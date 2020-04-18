#!/bin/bash

mkdir dir{1..3}
mkdir dir2/subdir{1..2}
mkdir dir3/subdir1
touch dir1/file{1..3}
touch dir2/subdir1/file{1..3}
touch dir2/subdir2/file{1..4}
touch dir3/subdir1/file{1..3}

pachctl create repo test
pachctl put file -r test@master:/dir1 -f dir1/
pachctl put file -r test@master:/dir2 -f dir2/
pachctl put file -r test@master:/dir3 -f dir3/

echo "The test repository has been created."
clear
