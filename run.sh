#!/bin/bash

# https://unix.stackexchange.com/questions/321126/dash-arguments-to-shell-scripts
# usage() {
#   cat << EOF >&2
# Usage: $PROGNAME [-v] [-d <dir>] [-f <file>]

# -f <file>: ...
#  -d <dir>: ...
#        -v: ...
# EOF
#   exit 1
# }

script=""
url=""
key=""
threads=0
connections=0
duration=0

while getopts s:t:c:d:u: o; do
  case $o in
    (s) script=$OPTARG;;
    (t) threads=$OPTARG;;
    (c) connections=$OPTARG;;
    (d) duration=$OPTARG;;
    (u) url=$OPTARG;;
    (k) key=$OPTARG;;
    # (*) usage
  esac
done
shift "$((OPTIND - 1))"

echo -------- setting up stress test --------
echo "script: $script"
echo "url: $url"
echo "threads: $threads"
echo "connections: $connections"
echo "duration: $duration"

response=$(curl $url/stress-test/start?stress-test-preshared-key=$key)

auth_token=$(echo $response | jq '.auth_token')
shipper_uuid=$(echo $response | jq '.shipper_uuid')
carrier_uuid=$(echo $response | jq '.carrier_uuid')
trailer_type_uuid=$(echo $response | jq '.trailer_type_uuid')
shipper_location_type_uuid=$(echo $response | jq '.shipper_location_type_uuid')
loading_type_uuid=$(echo $response | jq '.loading_type_uuid')

echo "auth_token: $auth_token"
echo "shipper_uuid: $shipper_uuid"
echo "carrier_uuid: $carrier_uuid"
echo "trailer_type_uuid: $trailer_type_uuid"
echo "shipper_location_type_uuid: $shipper_location_type_uuid"
echo "loading_type_uuid: $loading_type_uuid"
echo "\n"

echo -------- starting wrk --------
eval env auth_token=$auth_token shipper_uuid=$shipper_uuid carrier_uuid=$carrier_uuid trailer_type_uuid=$trailer_type_uuid shipper_location_type_uuid=$shipper_location_type_uuid loading_type_uuid=$loading_type_uuid wrk -t $threads -c $connections -d "$duration"s --latency $url/graph -s ./lua_scripts/$script.lua
