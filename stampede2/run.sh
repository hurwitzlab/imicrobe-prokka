#!/bin/bash

module load tacc-singularity

echo "all arguments: $@"

singularity run imicrobe-prokka.img $@ --notbl2asn --compliant --metagenome --cpus 48
