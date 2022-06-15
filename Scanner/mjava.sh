#!/bin/sh

java -classpath ../third-part/JFlex/jflex-1.8.2/lib/jflex-full-1.8.2.jar JFlex.Main *.flex
if [ $? = 0 ];then
  javac -classpath ./third-part/java-cup-11a.jar Scanner.java sym.java
  if [ $? = 0 ]; then
    java -classpath ./third-part/CUP/java-cup-11a-runtime.jar Scanner SampleProgram.mjava
  fi
fi