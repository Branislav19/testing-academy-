#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'


@test "when city is provided, then data is recived" {

run curl -s "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=3718d7f90e7b081ca8f46aa4305c05ea&q=kosice"

assert_equal $(echo "output" | jq -r .name) "Kosice"

}
