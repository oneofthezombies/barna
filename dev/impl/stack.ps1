function stack_push {
    param (
        [ref][System.Collections.Generic.List[object]]$stack,
        [ref]$stack_size,
        $item
    )
    if ($stack_size.Value -lt $stack.Value.Count) {
        $stack.Value[$stack_size.Value] = $item
    } else {
        $stack.Value.Add($item)
    }
    $stack_size.Value++
    return 0
}

function stack_pop {
    param (
        [ref][System.Collections.Generic.List[object]]$stack,
        [ref]$stack_size,
        [ref]$item
    )
    if ($stack_size.Value -eq 0) {
        return 1
    }
    $item.Value = $stack.Value[$stack_size.Value - 1]
    $stack_size.Value--
    return 0
}

function test {
    $a_my_stack = New-Object System.Collections.Generic.List[object]
    $a_my_stack_size = 0
    $s_my_item = ""
    $i_status = 0

    $i_status = stack_push ([ref]$a_my_stack) ([ref]$a_my_stack_size) "hello"
    Write-Host $($a_my_stack -join ' ') $a_my_stack_size $s_my_item $i_status

    $i_status = stack_push ([ref]$a_my_stack) ([ref]$a_my_stack_size) "world"
    Write-Host $($a_my_stack -join ' ') $a_my_stack_size $s_my_item $i_status

    $i_status = stack_pop ([ref]$a_my_stack) ([ref]$a_my_stack_size) ([ref]$s_my_item)
    Write-Host $($a_my_stack -join ' ') $a_my_stack_size $s_my_item $i_status

    $i_status = stack_pop ([ref]$a_my_stack) ([ref]$a_my_stack_size) ([ref]$s_my_item)
    Write-Host $($a_my_stack -join ' ') $a_my_stack_size $s_my_item $i_status

    $i_status = stack_pop ([ref]$a_my_stack) ([ref]$a_my_stack_size) ([ref]$s_my_item)
    Write-Host $($a_my_stack -join ' ') $a_my_stack_size $s_my_item $i_status
}

test
