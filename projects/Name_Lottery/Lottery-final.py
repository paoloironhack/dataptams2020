#!/usr/bin/env python
# coding: utf-8

# In[1]:


import random
import time
import pandas as pd


# In[2]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('================================')
print('Take Your Leave, Live Your Life!')
print('================================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(5)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('========================================')
print('Let us find out who wins the 2019 rafle!')
print('========================================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(10)


# In[3]:


qualified = pd.read_excel('data/List_v2.xlsx')
count_names = len(qualified['Pers.No.'])
list_names = [name for name in qualified['Personnel Number']]


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('=============================================================================')
print('\nThere are: ', count_names, 'associates who used all their holidays in 2019!')
print('=============================================================================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(10)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('======================================================')
print('\nCongratulations! Great that you enjoyed your life!\n')
print('======================================================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(5)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('=========================================================')
print('\n\Here are the canidates who can win the prize today:\n!')
print('=========================================================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(4)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n', *list_names, sep='\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(10)


# In[4]:


winner1 = random.choice(list_names)
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('=========================')
print('\nThe FIRST winner is: \n')
print('=========================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(10)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('=============================')
print(winner1, '\nCongratulations!\n')
print('=============================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
list_names.remove(winner1)
time.sleep(8)


# In[ ]:


winner2 = random.choice(list_names)
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('==========================')
print('\nThe SECOND winner is: \n')
print('==========================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(10)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('=============================')
print(winner2, '\nCongratulations!\n')
print('=============================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
list_names.remove(winner2)
time.sleep(8)


# In[ ]:


winner3 = random.choice(list_names)
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('=========================')
print('\nThe THIRD winner is: \n')
print('=========================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(10)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('=============================')
print(winner3, '\nCongratulations!\n')
print('=============================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
list_names.remove(winner3)
time.sleep(8)


# In[ ]:


print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('================================')
print('Take Your Leave, Live Your Life!')
print('================================')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
print('\n')
time.sleep(5)
