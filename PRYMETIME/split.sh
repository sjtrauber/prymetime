#!/bin/bash
#SBATCH -N 1
#SBATCH -n 16
#SBATCH -o split_%j.out
#SBATCH -e split_%j.err
#SBATCH -J split

cd "$1"
mkdir unicycler
cp cir_rep_contigs.fasta unicycler/
cd unicycler
awk '/^>/{s=++d".fasta"} {print > s}' cir_rep_contigs.fasta 
rm cir_rep_contigs.fasta
