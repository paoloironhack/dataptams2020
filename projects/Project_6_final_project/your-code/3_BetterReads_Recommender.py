# Importing libraries
import pandas as pd
import numpy as np
import os
from termcolor import cprint, colored
from goodreads import client

# API Key for GoodReads
gc = client.GoodreadsClient('wxwrc6aLfRoMX3Ivr784A','rFT6Ytzh5TRBNcWnAYTdWY1wU5U27fQ6tEegWiSM5M')

# some userID's to run in the program
# Sara Mdza:	42889636
# Zuzanna: 		29153227
# Mom: 			45188186
# Melissa: 		48794835
# Paolo: 		6940448

# Read the donwloaded info
df1 = pd.read_csv('../data/goodreads_batch1.csv')
df2 = pd.read_csv('../data/goodreads_batch2.csv')
df = pd.concat([df1,df2])

# Only keeping books with scores of 4 or 5 stars, as we want the books that are recommended
high_rated = df.loc[df.rating > 3]

# Creating list of the best selling 20 books
mean_rating = high_rated.pivot_table(index=['book'],values=['rating'],aggfunc=(len,np.mean)).reset_index()
mean_rating.columns = ['_'.join(col).strip() for col in mean_rating.columns.values]
best_sellers = list(mean_rating.sort_values(by='rating_len', ascending=False)[0:20]['book_'])

#and removing the bestselles from the list
high_rated = high_rated[~high_rated.book.isin(best_sellers)]

# First we create a matrix of all books vs all users, if they have not read / rated it, the rating will be nan
high_rated_pivot = high_rated.pivot_table(index='book', columns='userid').rating.reset_index()

# Matrix of total books recommended per user
books_loved = pd.DataFrame(high_rated.groupby('userid')['rating'].count())
books_loved.rename(columns={'rating': 'total_loved_books'},inplace=True)

# Now I want to check which users are highly correlated, to find book recommendations
corr = high_rated_pivot.corr()

# Here the main function for the recommendation system
def main():
	os.system('clear')
	cprint("\nwelcome to BETTER READS\n", 'cyan')
	cprint("\nthe program that recommends BETTER books to you\n", 'cyan')

	# Request a userID	
	while True:
		my_user = input('\nwhich GoodReads userID needs a BetterRead?: ')
		if int(my_user) > 0 and int(my_user) in high_rated['userid'].unique():
			break
		else: 
			cprint("Invalid user entered")

	# Cast user as an int, and saving name from server
	my_user = int(my_user)
	username = gc.user(my_user).name

	# Correlating all to only one user, to find similar users
	similar_to_mine = corr[my_user]
	similar_to_minedf = pd.DataFrame(similar_to_mine)
	similar_to_minedf.rename(columns={my_user: 'pearson_corr'},inplace=True)
	similar_to_minedf.dropna(inplace=True)

	# Adding information of how many books other users have loved
	similar_to_minedf = similar_to_minedf.join(books_loved['total_loved_books'])

	# Other users need to at least have loved half the books the given user has loved to be able to recommend
	parameter = books_loved.reset_index()
	parameter = parameter.loc[parameter['userid'] == my_user]['total_loved_books'] / 2

	top = similar_to_minedf[similar_to_minedf['total_loved_books'] >= int(parameter)].drop(my_user).sort_values('pearson_corr', ascending=False).head(20)
	top.reset_index(inplace=True)

	top_id = list(top['userid'])

	# Adding my user to identify the books I've already read
	top_id.append(my_user)
	top_id

	# Now we create a new matrix will all the books that have been read by the highest corr users
	top_books = high_rated.pivot_table(index='userid', columns='book').rating.reset_index()
	top_books = top_books[top_books['userid'].isin(top_id)].dropna(how='all',axis=1)

	# But we drop all books that the user has already read
	read_books = top_books[(top_books['userid'] == my_user)].dropna(axis=1).columns[1:]
	read_books = list(df[(df['userid'] == my_user)]['book'])
	for i in read_books:
	    if i in top_books.columns:
	        top_books.drop(i,1,inplace=True)

	# Recommendation given
	recommendation = top_books.fillna(0).astype(bool).sum(axis=0).sort_values(ascending=False).head(21)
	recommendation = recommendation.reset_index()[1:].rename(columns={0: 'times recommended'})

	cprint('\n \n20 similar users recommend that ','cyan', end='')
	cprint(username, 'yellow', end='')	
	cprint(' reads the following books', 'cyan')	
	cprint(recommendation, 'white')
	print('\n \n')

if __name__ == "__main__":
    main()

while True:
		cprint('type ','cyan', end='')
		cprint('Y ', 'yellow', end='')	
		cprint('if you want BETTER reads for another user, or  ','cyan', end='')
		cprint('N ', 'yellow', end='')	
		cprint('to end the program:','cyan', end='')
		reply = input(' ')
		if reply == 'Y':
			main()
		elif reply == 'N': 
			cprint("\n \nBye, have a great reading day! \n \n")
			break
		else:
			cprint("Invalid paramenter entered, please only enter Y or N")
