#!/bin/sh
# copy source to test directory
echo "Copying code to test/ directory"
cp ~/workspace/submit/GreedyDynamicAlgorithms.java .
cp ~/workspace/submit/Huffman.java .
cp ~/workspace/submit/MyTests.java .

# delete the .class files (if they exist?)
if [ -e GreedyDynamicAlgorithms.class ]; then
    rm GreedyDynamicAlgorithms*.class
fi
if [ -e Huffman.class ]; then
    rm Huffman*.class
fi
if [ -e MyTests.class ]; then
    rm MyTests.class
fi

# compile their code
echo "Attempting to compile your code"
javac GreedyDynamicAlgorithms.java
javac Huffman.java
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
echo "Outputting results of each test case to result.txt"
java -cp .:hamcrest.jar:junit.jar TestRunner $1

echo
echo "Deleting extra files"
rm Huffman*.class
rm GreedyDynamicAlgorithms*.class
rm MyTests.class
rm Huffman.java
rm GreedyDynamicAlgorithms.java
rm MyTests.java