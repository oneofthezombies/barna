#!/usr/bin/env bash

# Arguments
# $1 - stack: array reference
# $2 - stack_size: int reference
# $3 - item: string value
stack_push() {
    eval "$2=\$((\$$2+1))"
    eval "$1[\$$2]='$3'"
}

# Arguments
# $1 - stack: array reference
# $2 - stack_size: int reference
# $3 - item: string reference
stack_pop() {
    if [ $(eval echo \$$2) -eq 0 ]; then
        return 1
    fi
    eval "$3=\${$1[\$$2]}"
    eval "$2=\$((\$$2-1))"
}

test() {
    a_my_stack=()
    i_my_stack_size=0
    s_my_item=""
    i_status=0

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
