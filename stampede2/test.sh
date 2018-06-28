#!/bin/bash

#SBATCH -A iPlant-Collabs
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -t 00:10:00
#SBATCH -p skx-normal
#SBATCH -J imicrobe-prokka-test
#SBATCH --mail-type BEGIN,END,FAIL
#SBATCH --mail-user jklynch@email.arizona.edu

iget -f /iplant/home/jklynch/test/imicrobe-prokka/test.fa

# include --force to overwrite output from previous tests
./run.sh test.fa --cpus 0 --force --outdir PROKKA_TEST
