import sys
import pandas as pd
import random


data = pd.read_csv('tmalign.out', names=['name1', 'name2', 'tmscore', 'seqid'], delimiter='\t')

names = data['name1'].tolist() + data['name2'].tolist()


query = sys.argv[1]


with open(query) as f:
    queries = f.readlines()

queries = [x.strip() for x in queries] 

def get_idx():
    # return random index of names
    return random.randint(0, len(names))


cnt = 0
for i in range(len(queries)):

    for _ in range(12):
        print(f"QUERY{i}\t{names[get_idx()]}")

    cnt += 1
    # if cnt > 10:
        # break
    