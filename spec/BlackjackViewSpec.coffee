assert = chai.assert

describe 'blackJack', ->

###
Create a new deck
create two hands, 
	a dealer 
	a player
if card an ace, set value at 1 if player's score is over 12

if player's hand has an ace in it and subsequent card puts player score
over 21, change ace value to 1 (if not already) and recalculate score


compare different hands and see if they comply with rules of blackjack
see if player hits and he goes over 21 player loses
see if dealer hits when below a certain number and stops at a certain number
see if it registers wins properly
###