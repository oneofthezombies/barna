#!/usr/bin/env bash

# Arguments
# $1: stack: array
# $2: stack_size: int
# $3: item: string
barna_stack_push() {
    $1[$2]=$3
    (($2++))
}

# barna_stack_pop() {
#     local -n a_stack=$1
#     local -n i_stack_size=$2
#     local -n s_item=$3
#     if [ $i_stack_size -eq 0 ]; then
#         return 1
#     fi
#     echo before $i_stack_size >&2
#     ((i_stack_size--))
#     echo after $i_stack_size >&2
#     # a=${#a_stack[i_stack_size]}
#     # echo a: $a >&2
#     s_item=${a_stack[$i_stack_size]}
#     echo s_item: $s_item >&2
#     return 0
# }

test() {
  a_my_stack=()
  i_my_stack_size=0
  s_my_item=""
  i_status=0

  barna_stack_push a_my_stack i_my_stack_size "hello"
  i_status=$?
  echo status: $i_status stack: $a_my_stack stack_size: $i_my_stack_size item: $s_my_item >&2
}

test
