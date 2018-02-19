#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

@test "Should add numbers together" {
    assert_equal $(echo 1+1 | bc) 2


}



@test 'assert' {
assert_success
assert echo "ficim"
assert echo "aj tu ficim"
assert false
assert echo "tu neficim"

}



@test "mkdir po novom" {
run mkdir /mocny
assert_equal ${status} 1 

}



@test "mkdir po starom" {
OUTPUT=$(mkdir /mocny)
}
