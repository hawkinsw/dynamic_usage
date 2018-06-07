#!/bin/bash

file=$1
library=$2

lib_funcs=`readelf -s $library | grep -v UND`

for i in `objdump -T $file | grep UND | awk '{print $6;}' | grep -v '^$' | grep -v '^ap_'`; do
	grep $i <(echo $lib_funcs) 2>&1 > /dev/null;
	if [ $? -eq 0 ]; then
		echo $i is a library symbol.
	fi
done
