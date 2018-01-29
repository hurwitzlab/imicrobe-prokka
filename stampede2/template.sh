#!/bin/bash

echo "Started $(date)"

echo "input file: ${INPUT_FILE}"
echo "arguments: ${ARGS}"

sh run.sh ${INPUT_FILE} ${ARGS}

echo "Ended $(date)"
exit 0
