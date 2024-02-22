#!/usr/bin/env bash

# Arguments
# $1 - stack: array reference
# $2 - stack_size: int reference
# $3 - item: string value
stack_push() {
    local -n stack=$1
    local -n stack_size=$2
    ((stack_size+=1))
    stack[stack_size]=$3
    return 0
}

# Arguments
# $1 - stack: array reference
# $2 - stack_size: int reference
# $3 - item: string reference
stack_pop() {
    local -n stack=$1
    local -n stack_size=$2
    if [ $stack_size -eq 0 ]; then
        return 1
    fi
    eval $3="${stack[stack_size]}"
    ((stack_size-=1))
    return 0
}

test() {
    declare -a a_my_stack
    declare -i i_my_stack_size=0
    declare s_my_item=""
    declare -i i_status=0

    stack_push a_my_stack i_my_stack_size hello
    i_status=$?
    echo ${a_my_stack[@]} $i_my_stack_size $s_my_item $i_status

    stack_push a_my_stack i_my_stack_size world
    i_status=$?
    echo ${a_my_stack[@]} $i_my_stack_size $s_my_item $i_status

    stack_pop a_my_stack i_my_stack_size s_my_item
    i_status=$?
    echo ${a_my_stack[@]} $i_my_stack_size $s_my_item $i_status

    stack_pop a_my_stack i_my_stack_size s_my_item
    i_status=$?
    echo ${a_my_stack[@]} $i_my_stack_size $s_my_item $i_status

    stack_pop a_my_stack i_my_stack_size s_my_item
    i_status=$?
    echo ${a_my_stack[@]} $i_my_stack_size $s_my_item $i_status
}

test
