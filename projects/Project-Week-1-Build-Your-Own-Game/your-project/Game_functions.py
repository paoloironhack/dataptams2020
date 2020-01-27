# Define a function which simulate the drawing of the card from the pile and update pile by deleting the card drawn

def drawcard(pile):
    pick_card = pile[0]
    del pile[0]
    return pick_card

# Create a deck made of 40 cards randomly ordered

def create_random_deck(values, suits):

    from itertools import product
    import random
    deck_clean = list(product(values, suits))
    deck_shuffled = random.sample(deck_clean, len(deck_clean))
    
    return deck_shuffled

# Define a function which let the Players to steal the pile of the other player or put the card on the table
    
def snap_or_leave_card_Player1(Player1_cardinplay, Player1_capturedcards, Player2_capturedcards):

# Check if Player2 has a Pile, if not exit
        
    if len(Player2_capturedcards) == 0:
        Last_player = False
        Snap1 = False
        pass
        
    # If yes, check if the value of the first card in the pile of Player 2 matches the value of the card in play     
    else:
        
        # Transforming tuples in lists to read the first value in the conditions
        Last_player = True
        list_Player1_cardinplay = list(Player1_cardinplay)
        list_Player2_capturedcards = list(Player2_capturedcards[0])
        
        if list_Player1_cardinplay[0] == list_Player2_capturedcards[0]:
               
            Snap1 = True
            
            # All cards in the pile of player2 are "stolen" and added to the pile of Player1
            print("SNAP!!! Player 1 snaps the pile from Player2!!!")
            for x in Player2_capturedcards:
                Player1_capturedcards.append(x)
            Player1_capturedcards.append(Player1_cardinplay)
            Player2_capturedcards.clear()
            
            Player1_cardinplay = 0
                    
        else:
            Snap1 = False
            pass
        
    
    return Player1_cardinplay, Player1_capturedcards, Player2_capturedcards, Last_player, Snap1

# Define a function to determine if the Player grab a card from the table or leave it on the table    
    
def grab_or_leave_Player1(Player1_cardinplay, Player1_capturedcards, Table_cards):
    
    if Player1_cardinplay == 0:
        Last_player = False
        pass
    
    else:
    
        if len(Table_cards) == 0:
            Last_player = False
            Table_cards.append(Player1_cardinplay)

        else:

            Last_player = True
            list_Player1_cardinplay = list(Player1_cardinplay)
            Table_cards.sort(key=lambda x: x[0], reverse=False)
            list_Table_cards_values = [e[0] for e in Table_cards]
            list_Table_cards_suits = [u[1] for u in Table_cards]

            gen = (x for x in list_Table_cards_values if x == list_Player1_cardinplay[0])
            for x in gen:
                    Player1_capturedcards.append(Player1_cardinplay)
                    Player1_capturedcards.append(Table_cards[list_Table_cards_values.index(x)])
                    Table_cards.remove(Table_cards[list_Table_cards_values.index(x)])
                    break

            else:
                Table_cards.append(Player1_cardinplay)       

    return Player1_capturedcards, Table_cards, Last_player

def snap_or_leave_card_Player2(Player2_cardinplay, Player2_capturedcards, Player1_capturedcards):
    
    
# Check if Player1 has a Pile, if not exit
        
    if len(Player1_capturedcards) == 0:
        Last_player = False
        Snap2 = False
        pass
        
    # If yes, check if the value of the first card in the pile of Player 1 matches the value of the card in play     
    else:
        
        # Transforming tuples in lists to read the first value in the conditions
        Last_player = False
        list_Player2_cardinplay = list(Player2_cardinplay)
        list_Player1_capturedcards = list(Player1_capturedcards[0])
        
        if list_Player2_cardinplay[0] == list_Player1_capturedcards[0]:
            
            Snap2 = True
            
            # All cards in the pile of player1 are "stolen" and added to the pile of Player1
            print("SNAP!!! Player 2 snaps the pile from Player1!!!")
            for x in Player1_capturedcards:
                Player2_capturedcards.append(x)
            Player2_capturedcards.append(Player2_cardinplay)
            Player1_capturedcards.clear()
            
            Player2_cardinplay = 0
            
        else:
            Snap2 = False
            pass
        
  
    return Player2_cardinplay, Player2_capturedcards, Player1_capturedcards, Last_player, Snap2

def grab_or_leave_Player2(Player2_cardinplay, Player2_capturedcards, Table_cards):
    
    if Player2_cardinplay == 0:
        Last_player = False
        pass
    
    else:
    
        if len(Table_cards) == 0:
            Last_player = False
            Table_cards.append(Player2_cardinplay)

        else:

            Last_player = False
            list_Player2_cardinplay = list(Player2_cardinplay)
            Table_cards.sort(key=lambda x: x[0], reverse=False)
            list_Table_cards_values = [e[0] for e in Table_cards]
            list_Table_cards_suits = [u[1] for u in Table_cards]

            gen = (x for x in list_Table_cards_values if x == list_Player2_cardinplay[0])
            for x in gen:
                    Player2_capturedcards.append(Player2_cardinplay)
                    Player2_capturedcards.append(Table_cards[list_Table_cards_values.index(x)])
                    Table_cards.remove(Table_cards[list_Table_cards_values.index(x)])
                    break

            else:
                Table_cards.append(Player2_cardinplay)       

    return Player2_capturedcards, Table_cards, Last_player