#!/usr/bin/env bash

var_stack=""

fn_push() {
    local var_push_item="$1"
    var_stack="$var_push_item $var_stack"
}

fn_pop() {
    if [[ -z "$var_stack" ]]; then
        echo "var_stack is empty."
        return
    fi

    var_pop_result=${var_stack%% *}
    var_stack=${var_stack#* }
}

echo "var_stack: $var_stack"

fn_push Apple
echo "var_stack: $var_stack"

fn_push Banana
echo "var_stack: $var_stack"

fn_push Cherry
echo "var_stack: $var_stack"

fn_pop
echo "var_pop_result: $var_pop_result"
echo "var_stack: $var_stack"

fn_pop
echo "var_pop_result: $var_pop_result"
echo "var_stack: $var_stack"
