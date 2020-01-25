#below are the functions for the game
from random import randint 
import os
from termcolor import cprint, colored
import numpy as np

#create 2 x 5 by 5 board
comp_board = [["a"]*5 for i in range(5)]
user_board = [["a"]*5 for i in range(5)]

#print it pretty
def print_board(comp_board,user_board,the_ship,turn_num):
    #clear and reprint everything to make it seem as an update
    os.system('clear')
    cprint('LETS PLAY BATTLESHIP! \n', 'red')
    #short game instructions below
    cprint('the ship is 3 positions long', 'red')
    cprint('~ == water', 'red')
    cprint('O == a missed shot', 'red')
    cprint('X == a hit', 'red')

    cprint("\n turn #%d \n" % (turn_num),'magenta')
    #now print the computer board:
    cprint("  1  2  3  4  5  <-- computer's board",  'yellow')
    y = 1
    for row in comp_board:
        cprint(y,  'yellow',end='')
        y += 1
        for cell in row:
            if cell == 'X':
                cprint(' X ',  'red',end='')
            elif cell == 'O':
                cprint(' O ',  'white',end='')                
            else:
                cprint(' ~ ',  'cyan',end='')
        print("\n")

    print("\n")
    cprint("  1  2  3  4  5  <-- user's board",  'yellow')
    y = 1
    for row in user_board:
        cprint(y,  'yellow',end='')
        y += 1
        for cell in row:
            if cell == 'X':
                cprint(' X ',  'red',end='')
            elif cell == 'O':
                cprint(' O ',  'white',end='')                
            else:
                cprint(' ~ ',  'cyan',end='')
        print("\n")
    cprint("the ship's coordinates are:", 'grey',end='')
    cprint(the_ship, 'grey')


#with randint function get a ship location in the board (normal indexing)
def ship_placing(board):
    #first index
    ship_column = randint(1,len(board[0])-2)
    ship_row = randint(1,len(board)-2)

    # 0 means the ship is vertical, 1 means its horizontal
    ship_h_or_v = randint(0,2)

    #depending on if ship is vertical or horizontal, get the rest of the ship position
    #if vertical, we need to add positions on row
    #if horizontal, we need to add possions on column
    if ship_h_or_v == 0:
        the_ship = [(ship_column,ship_row),(ship_column+1,ship_row),(ship_column+2,ship_row)]
    else:
        the_ship = [(ship_column,ship_row),(ship_column,ship_row+1),(ship_column,ship_row+2)]
    return the_ship

turn_num = 0
the_ship = ship_placing(comp_board)
print_board(comp_board,user_board,the_ship,turn_num)

# #ask user for coordinates to shoot and check if the shot falls in the board, keep asking if it doesn't
# #normal indexing
# def turn():
#     while True:
#         shot_column = int(input("choose column for shot: "))
#         if shot_column <= len(board[0]) and shot_column > 0:
#             break
#         else:
#             print("you're shot is out of range, try again")
#     while True:
#         shot_row = int(input("choose row for shot: "))
#         if shot_row <= len(board) and shot_row > 0:
#             break
#         else:
#             print("you're shot is out of range, try again")
#     return shot_column,shot_row
 

# #HERE IS THE GAME FUNCTION
# def game():

#     turn_num = 0

#     #get the ship's position
#     the_ship = ship_placing(board)

#     #print the board on the terminal
#     print_board(board,the_ship,turn_num)
    
#     #loop for game
#     while len(the_ship) > 0:

#         #get the player's shot
#         the_shot = turn()

#         #check the shot against the ship's position
#         #if the shot is a hit, remove location from the_ship's list, mark it as X on board and continue to next turn
#         if the_shot in the_ship:
#             the_ship.remove(the_shot)
#             board[the_shot[1]-1][the_shot[0]-1] = 'X'
#             turn_num += 1
#             print_board(board,the_ship,turn_num)                       
#             cprint("THAT WAS A HIT !! \n",'green')

#         #if the shot is a miss, mark is as O and continue to next turn
#         else:
#             board[the_shot[1]-1][the_shot[0]-1] = 'O'
#             turn_num += 1
#             print_board(board,the_ship,turn_num)   
#             cprint("YOU MISSED! Try again: \n",'magenta') 
              
#     cprint("YOU SUNK THE SHIP!! ( ͡❛ᴗ ͡❛) \n",'green')  

# game()
