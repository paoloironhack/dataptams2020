dir = '../input/'

from subprocess import check_output
print(check_output(["ls", dir]).decode("utf8"))
import pandas as pd
import glob

data = pd.DataFrame()
for f in glob.glob((dir+'*.csv')): # all files in the directory that matchs the criteria.
    data = pd.concat([data,pd.read_csv(f)])

# If deplaying to new file
# data.to_csv((dir+'.csv'), index=False)
# if not, use data as all of them.
