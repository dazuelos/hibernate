#!/bin/bash

# little script to immediatly put to hibernate a MacOS

_id=`id -u`
_cn=`basename $0`
case "${_id}" in
	0)	;;
	*)	echo "${_cn}: must be run as root..." >&2
		exit 2
		;;
esac

# get the actual hibernatemode
_actual_hm=`pmset -g | grep hibernatemode | awk '{print $2}'`

pmset hibernatemode 25
pmset sleepnow

# restore initial hibernatemode
pmset hibernatemode ${_actual_hm}
