#!/bin/sh 
#PBS -l nodes=1:ppn=2 -l walltime=240:00:00
#PBS -M renau@ucsc.edu
ESESC_BIN=${1:-../main/esesc}

export ESESC_ReportFile="DELETE_ME"
export ESESC_BenchName="./bins/mid2svg.riscv64 ./data/mario.mid"

export ESESC_SamplerSel="TASS"
export ESESC_TASS_nInstSkip=5e6

#printenv|grep ESESC

if [ -f $ESESC_BIN ]; then
  $ESESC_BIN 
else
  $ESESC_BenchName 
fi
./scripts/report.pl -last > ./reports/mario_svg_baseline.txt
cat reports/mario_svg_baseline.txt

#adjust OoO performance
export ESESC_tradCore_nTotalRegs=64
export ESESC_tradCore_robSize=128

#add l3 cache and adjust l2
export ESESC_PrivL2_lowerLevel="L3Cache L3 shared"
export ESESC_PrivL2_assoc=1
export ESESC_PrivL2_bsize=512
let a=8*1024*1024
export ESESC_PrivL2_size=$a

export ESESC_L3Cache_assoc=1
export ESESC_L3Cache_bsize=512

if [ -f $ESESC_BIN ]; then
  $ESESC_BIN 
else
  $ESESC_BenchName 
fi
./scripts/report.pl -last > ./reports/mario_svg_improved.txt
cat reports/mario_svg_improved.txt


rm *DELETE*

exit 0
