@echo off
REM Spartan3 Starter Kit template - simulation script
REM Aaka Fosfor, 2023
REM https://github.com/AakaFosfor/S3StarterKit
REM
REM state: final

if [%1]==[-h] goto help

set GHDL_OPT=--std=08
set SRC_DIR=..\src

del S3StarterKit_tb.vcd > NUL 2>&1

echo Compiling S3StarterKit testbench
ghdl -a %GHDL_OPT% %SRC_DIR%\S3StarterKit.vhd
ghdl -a %GHDL_OPT% %SRC_DIR%\S3StarterKit_tb.vhd

echo Elaborating S3StarterKit testbench
ghdl -e %GHDL_OPT% S3StarterKit_tb

echo Simulating S3StarterKit testbench
ghdl -r %GHDL_OPT% S3StarterKit_tb --vcd=S3StarterKit_tb.vcd

if exist S3StarterKit_tb.vcd gtkwave --script=sim.tcl S3StarterKit_tb.vcd

goto :eof

:help
  echo usage: %0 [-h]
