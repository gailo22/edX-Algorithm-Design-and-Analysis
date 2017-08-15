#!/bin/sh
# copy source to test directory
echo "Copying code to test/ directory"
cp ~/workspace/submit/MinHeap.java .
cp ~/workspace/submit/Sorting.java .
cp ~/workspace/submit/MyTests.java .

# delete the .class files (if they exist?)
if [ -e MinHeap.class ]; then
    rm MinHeap*.class
fi
if [ -e Sorting.class ]; then
    rm Sorting*.class
fi
if [ -e MyTests.class ]; then
    rm MyTests.class
fi

# compile their code
echo "Attempting to compile your code"
javac CompareInt.java
javac Sorting.java
javac MinHeap.java
javac KthSmallest.java
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
echo "Outputting results from test cases to result.txt"
java -cp .:hamcrest.jar:junit.jar TestRunner $1
echo
echo "Deleting extra files"
rm MinHeap*.class
rm Sorting*.class
rm MyTests.class
rm CompareInt.class
rm KthSmallest.class
rm MinHeap.java
rm Sorting.java
rm MyTests.java