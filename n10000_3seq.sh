#!/bin/bash

#PBS -l select=1:ncpus=1:mem=1GB
#PBS -l walltime=120:00:00

#PBS -m abe
#PBS -M frederick.r.jaya@student.uts.edu.au

cd ~/rec-bench
nextflow rdm-n10000_3seq.nf -with-timeline out/n1000_3seq_timeline.html -with-report out/n10000_3seq_report.html -with-trace out/n10000_3seq_trace.html