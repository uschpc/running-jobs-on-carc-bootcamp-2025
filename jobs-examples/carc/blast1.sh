#!/bin/bash
#SBATCH --nodes 1
#SBATCH --ntasks 10
#SBATCH --partition compute
#SBATCH --time=00:05:00
#SBATCH --account=ttrojan_001
#SBATCH --chdir /home1/${USER}/running-jobs-on-CARC-laguna
module purge
module load usc
module load blast-plus
echo "Example blast start"
sleep 20
mkdir -p results/blast/db
wget https://ftp.ncbi.nlm.nih.gov/blast/db/swissprot.tar.gz -O results/blast/db/swissprot.tar.gz
tar -xvzf results/blast/db/swissprot.tar.gz
blastp -db results/blast/db/swissprot -query data/blast/query.txt -out results/blast/results.txt -num_threads $SLURM_NTASKS
echo "Example blast end"
