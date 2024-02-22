# Arguments
# $1: stack: array
# $2: stack_size: int
# $3: item: string
stack_push() {
    echo $1 $$1 $2 $$2 $3 $$3 >&2
    eval $1[$2]="$3"
    eval (($2++))
    echo $1 $2 $3 >&2
}

test() {
    a_my_stack=()
    i_my_stack_size=0
    s_my_item=""
    i_status=0
    stack_push a_my_stack i_my_stack_size "hello"
}

test
