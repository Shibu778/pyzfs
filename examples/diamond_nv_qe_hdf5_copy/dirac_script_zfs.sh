#!/bin/sh
#PBS -N zfs_calc 
#PBS -q medium48
#PBS -l nodes=1:ppn=48
#PBS -l walltime=48:00:00
#PBS -l mem=187gb

cd $PBS_O_WORKDIR

NP=$(cat ${PBS_NODEFILE}|wc -l)
#mpiexec.hydra -f $PBS_NODEFILE -np $NP vasp_std | tee log
# QE save file is too large to be included in Git repo. Therefore, to run this test, an actual QE calculation will be performed to obtain the wavefunction.
# This example was tested with QE 6.4.1.

# To install QE, please follow instructions on https://www.quantum-espresso.org/Doc/user_guide/
# Note that the compilation of QE can be technical and users unfamiliar with the process may find it helpful to consult experts first.
# QE must be compiled with HDF5 flag enabled, i.e. when configuring QE one needs to specify HDF5 library (--with-hdf5=/path/to/hdf5/lib/).

# pw.x path /localscratch/shibuM/Code/qe-7.1_hdf5
# Run QE to generate wavefunction
#mpirun /localscratch/shibuM/Code/qe-7.1_hdf5/pw.x -i pw.in > pw.out
#mpiexec.hydra -f $PBS_NODEFILE -np $NP /localscratch/shibuM/Code/qe-7.1_hdf5/bin/pw.x -i pw.in > pw.out
source ~/.bashrc
conda activate pyzfs_dev
mpiexec.hydra -f $PBS_NODEFILE -np $NP pyzfs --wfcfmt qeh5 > zfs.out
