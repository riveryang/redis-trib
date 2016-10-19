#!/bin/sh

case "$1" in
  create)
    if [ ! REPLICAS ]; then
      REPLICAS=1
    fi

    if [ ! NODES ]; then
      echo "NODES does not exist, please set docker env!"
      return
    fi

    echo "redis-trib.rb create --replicas $REPLICAS $NODES"
    redis-trib.rb create --replicas $REPLICAS $NODES
    ;;
  check)
    if [ ! NODE ]; then
      echo "NODE does not exist, please set docker env!"
      return
    fi

    redis-trib.rb check $NODE
    ;;
  add-node)
    if [ ! NEW_NODE ]; then
      echo "NEW_NODE does not exist, please set docker env!"
      return
    fi

    if [ ! CLUSTER_NODE ]; then
      echo "CLUSTER_NODE does not exist, please set docker env!"
      return
    fi

    if [ ! SLAVE ]; then
      redis-trib.rb add-node $NEW_NODE $CLUSTER_NODE
    else 
      redis-trib.rb add-node --slave $NEW_NODE $CLUSTER_NODE
    fi
    ;;
  *)
    echo "Please use create, check or add-node as first argument"
    ;;
esac
