# CSE220_ESESC_J_Adamson

This is a repository covering the work completed for the final project for CSE220, Computer Architecture. 
It compiles a risc-v binary suitable for use with the ESESC benchmarking program in order to analyze instruction usage
while processing a midi file in various ways.

3 makefiles are used to compile: https://github.com/craigsapp/midifile
for riscv

mid2svg.riscv64 is the precompiled workload binary

mario2svg.sh runs two ESESC simulations, one baseline and one improved

script should be run from ESESC directory ~/build/release/run

it takes the input file mario.mid which should be in ~build/release/run/data

outputs reports to ~build/release/run/reports

remaining text files are report outputs

