#!/bin/bash

library=$1

echo `readelf -s $library | grep -v UND | wc -l`
