#!/usr/bin/env python
# coding: utf-8

# In[1]:


import random
import time
import pandas as pd


# In[6]:


qualified = pd.read_excel('data/List_v2.xlsx')
count_names = len(qualified['Pers.No.'])
list_names = [name for name in qualified['Full_Name']]


# In[ ]:


print('\n', *list_names, sep='\n')
time.sleep(10)


# In[4]:


winner1 = random.choice(list_names)
print('\n')
print('\n')
print('=========================')
print('\nThe FIRST winner is: \n')
print('=========================')
print('\n')
print('\n')
print('\n')
print('\n')

time.sleep(8)


# In[5]:



print('\n')
print('=============================')
print(winner1, '\nCongratulations!\n')
print('=============================')
print('\n')

list_names.remove(winner1)
time.sleep(8)


# In[6]:


winner2 = random.choice(list_names)
print('\n')
print('\n')
print('==========================')
print('\nThe SECOND winner is: \n')
print('==========================')
print('\n')
print('\n')
time.sleep(8)


# In[7]:


print('\n')
print('\n')
print('=============================')
print(winner2, '\nCongratulations!\n')
print('=============================')
print('\n')
print('\n')
print('\n')
print('\n')
list_names.remove(winner2)
time.sleep(8)


# In[8]:


winner3 = random.choice(list_names)
print('\n')
print('\n')
print('=========================')
print('\nThe THIRD winner is: \n')
print('=========================')
print('\n')
print('\n')
print('\n')
time.sleep(8)

