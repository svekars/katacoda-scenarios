#!/usr/bin/env python3

import pandas as pd

df = pd.read_csv("Abyssinian.csv")
print(df[:10])

df.loc[1,"url"] = "test"
print(df.loc[3,"url"])

print(df.loc[:, 'url'])
