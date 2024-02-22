#!/usr/bin/env bash

barna_stack_push() {
    local -n a_stack=$1
    local -n i_stack_size=$2
    local -n s_item=$3
    a_stack[i_stack_size++]=$s_item
}

barna_stack_pop() {
    local -n a_stack=$1
    local -n i_stack_size=$2
    local -n s_item=$3
    if [ $i_stack_size -eq 0 ]; then
        return 1
    fi
    echo before $i_stack_size >&2
    ((i_stack_size--))
    echo after $i_stack_size >&2
    # a=${#a_stack[i_stack_size]}
    # echo a: $a >&2
    s_item=${a_stack[$i_stack_size]}
    echo s_item: $s_item >&2
    return 0
}

test() {
  a_my_stack=()
  i_my_stack_size=0
  s_my_item=""

  barna_stack_push a_my_stack i_my_stack_size "hello"
  status=$?
  echo $status value: $s_my_item
  echo stack: ${a_my_stack[@]} size: $i_my_stack_size

  barna_stack_push a_my_stack i_my_stack_size "world"
  status=$?
  echo $status value: $s_my_item
  echo stack: ${a_my_stack[@]} size: $i_my_stack_size

  barna_stack_pop a_my_stack i_my_stack_size s_my_item
  status=$?
  echo $status value: $s_my_item
  echo stack: ${a_my_stack[@]} size: $i_my_stack_size

  barna_stack_pop a_my_stack i_my_stack_size s_my_item
  status=$?
  echo $status value: $s_my_item
  echo stack: ${a_my_stack[@]} size: $i_my_stack_size

  barna_stack_pop a_my_stack i_my_stack_size s_my_item
  status=$?
  echo $status value: $s_my_item
  echo stack: ${a_my_stack[@]} size: $i_my_stack_size
}

test