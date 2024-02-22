#!/usr/bin/env bash

var:barna:stack=""

fn_push() {
    local var_push_item="$1"
    var:barna:stack="$var_push_item $var:barna:stack"
}

fn_pop() {
    if [[ -z "$var:barna:stack" ]]; then
        echo "var:barna:stack is empty."
        return
    fi

    var_pop_result=${var:barna:stack%% *}
    var:barna:stack=${var:barna:stack#* }
}

echo "var:barna:stack: $var:barna:stack"

fn_push Apple
echo "var:barna:stack: $var:barna:stack"

fn_push Banana
echo "var:barna:stack: $var:barna:stack"

fn_push Cherry
echo "var:barna:stack: $var:barna:stack"

fn_pop
echo "var_pop_result: $var_pop_result"
echo "var:barna:stack: $var:barna:stack"

fn_pop
echo "var_pop_result: $var_pop_result"
echo "var:barna:stack: $var:barna:stack"
