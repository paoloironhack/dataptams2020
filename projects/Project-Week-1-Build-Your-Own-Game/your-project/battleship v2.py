#below are the functions for the game
from random import randint 
import os
from termcolor import cprint, colored

#create a 5 by 5 board
board = [["a"]*5 for i in range(5)]

#print it pretty
def print_board(board,the_ship,turn_num):
    os.system('clear')
    cprint('\n LETS PLAY BATTLESHIP! \n', 'red')
    cprint("turn #%d \n" % (turn_num),'magenta')
    cprint('  1  2  3  4  5  -- columns',  'yellow')
    y = 1
    for row in board:
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
    cprint('| rows \n',  'yellow')
    cprint('(the ship is in column %d, row %d)' % (the_ship[1],the_ship[0]), 'grey')



#with randint function get a ship location in the board (normal indexing)
def ship_placing(board):
    ship_row = randint(1,len(board))
    ship_column = randint(1,len(board[0]))
    return ship_row,ship_column


#ask user for coordinates to shoot and check if the shot falls in the board, keep asking if it doesn't
#normal indexing
def turn():
    while True:
        shot_column = int(input("choose column for shot: "))
        if shot_column <= len(board[0]) and shot_column > 0:
            break
        else:
            print("you're shot is out of range, try again")
    while True:
        shot_row = int(input("choose row for shot: "))
        if shot_row <= len(board) and shot_row > 0:
            break
        else:
            print("you're shot is out of range, try again")
    return shot_row,shot_column

#check if the shot matches the ship's location
def shoot(the_ship,the_shot,board):
    if the_ship[0] == the_shot[0] and the_ship[1] == the_shot[1]:
        return False
    else:
        return True

#HERE IS THE GAME FUNCTION
def game():

    turn_num = 1

    #get the ship's position
    the_ship = ship_placing(board)

    #print the board on the terminal
    print_board(board,the_ship,turn_num)
    
    #establish ship status to keep playing until sunk
    ship_sts = True
    
    #loop for game
    while ship_sts == True:
        #get the player's shot
        the_shot = turn()

        #check the shot against the ship's position
        ship_sts = shoot(the_ship,the_shot,board)

        #update the board where the shot was made O for missed shot X for hit
        # index 0 for ship and shot is a row - rows are the nested lists in board
        # index 1 for ship and shot is a column - columns are the elements in the list in board
        if ship_sts == True:
            board[the_shot[0]-1][the_shot[1]-1] = 'O'
            turn_num += 1
            print_board(board,the_ship,turn_num)   
            cprint("YOU MISSED! Try again: \n",'magenta')

        else:
            board[the_shot[0]-1][the_shot[1]-1] = 'X'
            print_board(board,the_ship,turn_num)                       
            cprint("YOU SUNK THE SHIP!! ( ͡❛ᴗ ͡❛) \n",'green')  

game()
