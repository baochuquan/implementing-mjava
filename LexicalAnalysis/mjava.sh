#!/bin/sh

echo "===== step 1 ====="
java -classpath ../third-part/JFlex/jflex-1.8.2/lib/jflex-full-1.8.2.jar jflex.Main *.flex

if [ $? != 0 ]; then
  exit 1
fi

echo "===== step 2 =====" 
javac -Xlint:deprecation -classpath ../third-part/CUP/java-cup-11a.jar Scanner.java sym.java

if [ $? != 0 ]; then
  exit 1
fi

echo "===== step 3 ====="
java -classpath ../third-part/CUP/java-cup-11a-runtime.jar:. Scanner SampleProgram.mjava