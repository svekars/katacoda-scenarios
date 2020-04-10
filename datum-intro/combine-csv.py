#!/usr/bin/env python3

import pandas as pd
import os, glob

path = "/pfs/cats"
ext = "*.csv"
files = [file
        for path, subdir, files in os.walk(path)
        for file in glob.glob(os.path.join(path, ext))]
#print(files) 

dfs = []

for file in files:
    df = pd.read_csv(file, index_col=None, header=0)
    dfs.append(df)

df = pd.concat([pd.read_csv(file) for file in files])
df.to_csv("/pfs/out/cats.csv", index = False)


