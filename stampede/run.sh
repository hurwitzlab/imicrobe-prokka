#!/bin/bash

module load singularity

#export LAUNCHER_DIR="$HOME/src/launcher"
#export LAUNCHER_PLUGIN_DIR=$LAUNCHER_DIR/plugins
#export LAUNCHER_WORKDIR=$OUT_DIR
#export LAUNCHER_RMI=SLURM

#export LAUNCHER_JOB_FILE=`pwd`/launcher_jobfile
#echo ${LAUNCHER_JOB_FILE}

echo "all arguments: $@"

xz --decompress imicrobe-prokka.img.xz
singularity run imicrobe-prokka.img $@ --notbl2asn --compliant --metagenome --cpus 16

#$LAUNCHER_DIR/paramrun
#echo "Ended launcher"
