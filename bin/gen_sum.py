#!/usr/bin/python3

import re
import sys
import numpy as np
from operator import add
from functools import reduce
from scipy.stats import gmean

db = {}

for entry in sys.stdin:
    data = entry.split(',')
    case_name, case_index = data[0].split('-')
    data[0] = "1"
    data = list(map(int, data))
    if case_name in db:
        db[case_name] = list(map(add, db[case_name], data))
    else:
        db[case_name] = data

db_keys = sorted(db)

for c in db_keys:
    data = db[c]
    cases = data[0]
    data.pop(0)
    db[c] = [x / cases for x in data]

for c in db_keys:
    data = db[c]
    #12 APKI
    data.append(data[3] * 1000.0 / data[2])
    #13 MPKI
    data.append(data[4] * 1000.0 / data[2])
    #14 Reloc PKI
    data.append(data[6] * 1000.0 / data[2])
    #15 reloc rate
    data.append(data[6] / data[5])
    #16 Remap PGI
    data.append(data[7] * 1000000000.0 / data[2])
    #17 Prediction rate
    data.append(data[8] / (data[3] - data[4]))
    #18 Mem-PKI
    data.append(data[9] * 1000.0 / data[2])
    db[c] = data

# average
total   = reduce(lambda x, y: list(map(add, x, y)), db.values())
average = [ x / len(db) for x in total]

# geo-mean
geomean = []
for i in range(len(total)):
    v = []
    for c in db_keys:
        if db[c][i] > 0.0001:
            v.append(db[c][i])
        else:
            v.append(0.0001)
    gm = gmean(v)
    if gm <= 0.00011:
        gm = 0
    geomean.append(gm)


# print out
#                         0        1           2             3         4       5          6            7       8            9        10        11         12    13    14         15          16         17            18
print("#index, case-name, seconds, spike-time, instructions, accesses, misses, evictions, relocations, remaps, predict-hit, mem-acc, mem-read, mem-write, APKI, MPKI, Reloc-PKI, reloc-rate, Remap-PGI, predict-rate, Mem-APKI")
index = 0
for c in db_keys:
    print(','.join(list([str(index),c]) + list(map(str, db[c]))))
    index = index + 1

print(','.join(list([str(index), "average"]) + list(map("{:.3f}".format, average))))
index = index + 1
print(','.join(list([str(index), "geomean"]) + list(map("{:.3f}".format, geomean))))

