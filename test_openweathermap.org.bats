#!/usr/bin/env bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'


@test "when city is provided, then data are  recived" {

run curl -s "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=3718d7f90e7b081ca8f46aa4305c05ea&q=kosice"

assert_equal $(echo "$output" | jq -r .name) "Kosice"

}

@test "When wrong API key is provided, then data are not received" {
run curl -s "http://api.openweathermap.org/data/2.5/weather?units=metric&APPID=3718d7f90e7b081ca8f46aa4305c05ea&q=kosice"
message=$(echo "output" | jq -r .message)

assert_equal $(echo "output" | jq -r .cod) 401
assert_equal "message" "Invalid API key. Please see http://openweather.org/faq#error401 for more info"




}

