#!/bin/sh

echo - assemble [ *.ll ] into LLVM bitcode [ *.bc ] -
llvm-as -f *.ll
if [ $? = 0 ];then
  echo -n - compile [ *.bc ] into Intel assembly language for x86 archi
  llc --x86-asm-syntax=intel -f *.bc
  echo tecture [ *.s ] -
  echo - run [ *.bc ] -
  echo
  echo .............................................................................
  lli *.bc
  echo .............................................................................
  echo
fi