#!/usr/bin/env dash

# Arguments
# $1 - stack: array reference
# $2 - stack_size: int reference
# $3 - item: string value
stack_push() {
    eval "$2=\$((\$$2+1))"
    eval "$1[\$$2]='$3'"
    return 0
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
    return 0
}