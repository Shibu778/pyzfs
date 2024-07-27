#!/bin/sh
#PBS -N zfs_768atoms 
#PBS -q medium48
#PBS -l nodes=1:ppn=48
#PBS -l walltime=48:00:00
#PBS -l mem=187gb

cd $PBS_O_WORKDIR

#module load vasp.6.3.0
NP=$(cat ${PBS_NODEFILE}|wc -l)

source ~/.bashrc
conda activate pyzfs
#mpiexec.hydra -f $PBS_NODEFILE -np $NP vasp_std | tee log
mpiexec.hydra -f $PBS_NODEFILE -np $NP pyzfs --wfcfmt "vasp" | tee log
