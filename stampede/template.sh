#!/bin/bash

echo "Started $(date)"

echo $INPUT_FILE
echo $ARGS

sh run.sh $INPUT_FILE $ARGS

echo "Ended $(date)"
exit 0
