#!/bin/bash

mkdir dir{1..3}
mkdir dir2/subdir{1..2}
mkdir dir3/subdir1
touch dir1/file{1..3}
touch dir2/subdir1/file{1..3}
touch dir2/subdir2/file{1..4}
touch dir3/subdir1/file{1..3}

awk '{ print "1\n2\n3\n" > "dir1/file1" }'

#for file in dir2/subdir*; do
#    awk '{ print "1\n2\n3\n\4\n" }';
#done

#for file in dir3/subdir*; do
#    awk '{ print "1\n2\n3\n\4\n" }';
#done

exit;
EOF

