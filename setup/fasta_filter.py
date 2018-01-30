import itertools
import re
import sys


def grouper(iterable, n, fillvalue=None):
    "Collect data into fixed-length chunks or blocks"
    # grouper('ABCDEFG', 3, 'x') --> ABC DEF Gxx"
    args = [iter(iterable)] * n
    return itertools.zip_longest(*args, fillvalue=fillvalue)


for seq_id, seq in grouper(sys.stdin.readlines(), n=2):
    if len(seq.strip()) >= 200:
        sys.stdout.write(seq_id)
        sys.stdout.write(seq)
    else:
        pass
