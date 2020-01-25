#Tic-tac-toe game
#Version 1: simple two-player version

#I use the time.sleep function to add delays in printing during the game

import time

#Define the board

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']

#Function for printing the game header:

def print_header():
    print('\n')
    print('=======================')
    print('WELCOME TO TIC TAC TOE!')
    print('=======================')
    time.sleep(1.5)
    print('\nThis is a two-player game\n')
    time.sleep(1.5)

#Function for giving instructions:

def instructions():
    print('Player 1 plays \'X\' and Player 2 plays \'O\'.\n')
    time.sleep(1.5)
    print('Please take turns in choosing your position on the board from 1-9:\n')
    print(' 1 | 2 | 3 ')
    print('---|---|---')
    print(' 4 | 5 | 6 ')
    print('---|---|---')
    print(' 7 | 8 | 9 ')
    time.sleep(1.5)
    print('\nLet\'s play! :-)')
    time.sleep(1.5)

#Function for printing the board:

def print_board():
    print('\n')
    print(' ' + board[1] + ' | ' + board[2] + ' | ' + board[3] + ' ')
    print('---|---|---')
    print(' ' + board[4] + ' | ' + board[5] + ' | ' + board[6] + ' ')
    print('---|---|---')
    print(' ' + board[7] + ' | ' + board[8] + ' | ' + board[9] + ' ')
    print('\n')

#Function for player 1 move:

def player1_move():
    move_p1 = input('Player 1, what is your move?\n')
    move_p1 = int(move_p1)
    while board[move_p1] != ' ':
        move_p1 = input('That space is not empty. Player 1, please choose a different position\n')
        move_p1 = int(move_p1)
    board[move_p1] = 'X'

#Function for player 2 move:

def player2_move():
    move_p2 = input('Player 2, what is your move?\n')
    move_p2 = int(move_p2)
    while board[move_p2] != ' ':
        move_p2 = input('That space is not empty. Player 2, please choose a different position\n')
        move_p2 = int(move_p2)
    board[move_p2] = 'O'

#Function that checks whether player 1 has won:

def player1_wins():
    if (board[1] == 'X' and board[2] == 'X' and board[3] == 'X') or \
        (board[4] == 'X' and board[5] == 'X' and board[6] == 'X') or \
        (board[7] == 'X' and board[8] == 'X' and board[9] == 'X') or \
        (board[1] == 'X' and board[4] == 'X' and board[7] == 'X') or \
        (board[2] == 'X' and board[5] == 'X' and board[8] == 'X') or \
        (board[3] == 'X' and board[6] == 'X' and board[9] == 'X') or \
        (board[1] == 'X' and board[5] == 'X' and board[9] == 'X') or \
        (board[3] == 'X' and board[5] == 'X' and board[7] == 'X'):
        return True
    else:
        return False

#Function that checks whether player 2 has won:

def player2_wins():
    if (board[1] == 'O' and board[2] == 'O' and board[3] == 'O') or \
        (board[4] == 'O' and board[5] == 'O' and board[6] == 'O') or \
        (board[7] == 'O' and board[8] == 'O' and board[9] == 'O') or \
        (board[1] == 'O' and board[4] == 'O' and board[7] == 'O') or \
        (board[2] == 'O' and board[5] == 'O' and board[8] == 'O') or \
        (board[3] == 'O' and board[6] == 'O' and board[9] == 'O') or \
        (board[1] == 'O' and board[5] == 'O' and board[9] == 'O') or \
        (board[3] == 'O' and board[5] == 'O' and board[7] == 'O'):
        return True
    else:
        return False

#Function that checks whether board is full:    

def full_board():
    if ' ' in board[1:]:
        return False
    else:
        return True

#Function for executing the game:

def play_game():
    print_header()
    instructions()
    
    while True:
        print_board()
        player1_move()
    
        if player1_wins():
            print_board()
            time.sleep(1.5)
            print('Player 1 is the winner!\n')
            break
    
        if full_board():
            print_board()
            time.sleep(1.5)
            print('It\'s a tie! Nobody lost!\n')
            break
    
        print_board()
        player2_move()
    
        if player2_wins():
            print_board()
            time.sleep(1.5)
            print('Player 2 is the winner!\n')
            break
    
        if full_board():
            print_board()
            time.sleep(1.5)
            print('It\'s a tie! Nobody lost!\n')
            break

#Execute game
play_game()
