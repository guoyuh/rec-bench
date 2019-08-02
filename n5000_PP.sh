#!/bin/bash

#PBS -l select=1:ncpus=1:mem=1GB
#PBS -l walltime=120:00:00

#PBS -m abe
#PBS -M frederick.r.jaya@student.uts.edu.au

cd ~/rec-bench
nextflow rdm-n5000_PP.nf -with-timeline out/n5000_PP_timeline.html -with-report out/n5000_PP_report.html -with-trace out/n5000_PP_trace.html
