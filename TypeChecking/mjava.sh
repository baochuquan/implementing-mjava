#!/bin/sh

echo "===== step 1 ====="
java -classpath ../third-part/JFlex/jflex-1.4.3/lib/JFlex.jar JFlex.Main *.flex
if [ $? != 0 ]; then
  exit 1
fi

echo "===== step 2 ====="
java -classpath ../third-part/CUP/java-cup-11a.jar java_cup.Main -parser mjavac -interface *.cup
if [ $? != 0 ]; then
  exit 1
fi

echo "===== step 3 ====="
javac -Xlint:deprecation -classpath ../third-part/CUP/java-cup-11a-runtime.jar Scanner.java sym.java mjavac.java JavaSymbol.java ./symtab/*.java ./type/*.java
if [ $? != 0 ]; then
  exit 1
fi

echo "===== step 4 ====="
java -classpath ../third-part/CUP/java-cup-11a.jar:. mjavac WrongProgram.mjava
if [ $? != 0 ]; then
  exit 1
fi
