#!/bin/bash
echo "Welcome to my bash script :D"

firstline=$(head -n 1 source/changelog.md)

read -a splitfirstline <<< $firstline

version=${splitfirstline[1]}
echo "You are building version " $version

echo "Do you want to continue? [y(1)/n(0)]"
read versioncontinue

if [ $versioncontinue -eq 1 ]
then 
  echo "OK"
  for filename in source/*
  do
    echo $filename
    if [ $filename == "source/secretinfo.md" ]
    then
      echo "Not copying" $filename
    else
      echo "Copying" $filename
      cp $filename build/.
    fi
  done

  cd build/
  # We'll add more code here later
  cd ..

  echo "Build version $version contains: "
  ls
else
  echo "Please come back when you are ready"
fi
