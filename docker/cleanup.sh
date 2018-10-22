#!/usr/bin/env bash

what="${1:-}"
when="${2:-}"
id="${3:-}"

show_usage() {
	echo "Invalid arguments provided"
	echo ""
	echo "Usage: cleanup.sh <what> <when> <id>"
	echo "  <what>: images|container"
	echo "  <when>: before|after"
	echo "  <id>:   image_id|container_id"
	exit
}

([ -z "$what" ] || ([ "$what" != "images" ] && [ "$what" != "container" ])) && show_usage
([ -z "$when" ] || ([ "$when" != "before" ] && [ "$when" != "after" ])) && show_usage
[ -z "$id" ] && show_usage

docker $what -qa --filter $when=$id | xargs docker rmi
