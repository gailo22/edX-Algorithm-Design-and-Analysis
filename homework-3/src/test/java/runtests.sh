#!/bin/sh
# copy source to test directory
echo "Copying code to test/ directory"
cp ~/workspace/submit/Graph.java .
cp ~/workspace/submit/Maze.java .
cp ~/workspace/submit/MyTests.java .

# delete the .class files (if they exist?)
if [ -e Graph.class ]; then
    rm Graph*.class
fi
if [ -e Maze.class ]; then
    rm Maze*.class
fi
if [ -e MyTests.class ]; then
    rm MyTests.class
fi

# compile their code
echo "Attempting to compile your code"
javac Graph.java
javac Maze.java
javac -cp .:hamcrest.jar:junit.jar MyTests.java

# did it compile?
if [ $? -ne 0 ]; then 
    echo "uh oh didn't compile"
    exit 1; 
fi
echo "Successfully compiled code"
# made it here, run the JUnit tests
echo "Running unit tests"
echo
java -cp .:hamcrest.jar:junit.jar TestRunner $1

echo
echo "Deleting extra files"
rm Graph*.class
rm Maze*.class
rm MyTests.class
rm Graph.java
rm Maze.java
rm MyTests.java