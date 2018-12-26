###################################
##	Churong Zhang
##	cxz173430@utdallas.edu
#############################
.data
##############################################################################################
randomSeed:	.word 553	# Change this to any integer when a new game start
##############################################################################################
Begin:	.asciiz "                                                   UNO Card Game\nThis game needs four players to play. Each Player will take seven cards from the deck. \nAfter the four players receive seven cards from the deck, the game will take one more \ncard from the deck as the beginning card. The goal to win this game is by using all of the \ncards that are in your hand. There are couple rules of the game. First, each player only can \nplay one card per round. and the card that the player play has to be the same color or the \nsame type of cards. The exceptions are the Wild cards and Wild Plus Four cards. If the \nplayer uses a Wild card, then he/she can choose the color he/she wants. The Draw Two \ncards will make the next player gain two cards. The Skip cards will skip the player that is \nfollowed by the user. lastly, the Reverse Card change the rotation of the player when they \nplay. For example, the default rotation starts with Player A, then Player B, Player C, Player D, \nthen go back to Player A. If Player C use the Reverse card, then the rotation will become \nPlayer B, Player A, Player D, Player C, then Player B again. This rotation will stay the same \nunless someone else uses the card Reverse. If you do not have the right card to play, then \nenter zero to gain a card. if you want to end the game, then enter -1. Have Fun playing UNO!!!"
GameEnd: .asciiz "Thank you for playing UNO, Have a nice day!!!"
#######################################################
####### string version of each card
red:	.asciiz	"Red "
green:	.asciiz	"Green "
yellow: .asciiz	"Yellow "
blue:	.asciiz	"Blue "
wild:	.asciiz "Wild Card"
wildPlus:	.asciiz "Wild Plus Four"
zero:	.asciiz "0"
one:	.asciiz "1"
two:	.asciiz "2"
three:	.asciiz "3"
four:	.asciiz "4"
five:	.asciiz "5"
six:	.asciiz "6"
seven:	.asciiz "7"
eight:	.asciiz "8"
nine:	.asciiz "9"
drawTwo:	.asciiz "Draw Two"
skip:	.asciiz "Skip"
reverse:.asciiz "Reverse"
########################################################
newLine:	.asciiz "\n" # print a new line
PlayerAMessage:	.asciiz "It is Player A's Turn, please let he/she read only."
PlayerBMessage:	.asciiz "It is Player B's Turn, please let he/she read only."
PlayerCMessage:	.asciiz "It is Player C's Turn, please let he/she read only."
PlayerDMessage:	.asciiz "It is Player D's Turn, please let he/she read only."
PlayerAWinsMessage:	.asciiz	"Congratulations, Player A won the gaame!!!!!"
PlayerBWinsMessage:	.asciiz	"Congratulations, Player B won the gaame!!!!!"
PlayerCWinsMessage:	.asciiz	"Congratulations, Player C won the gaame!!!!!"
PlayerDWinsMessage:	.asciiz	"Congratulations, Player D won the gaame!!!!!"
PlayerA:	.word	1,2,3,4,5,6,7,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0
PlayerB:	.word	1,2,3,4,5,6,7,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0
PlayerC:	.word	1,2,3,4,5,6,7,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0
PlayerD:	.word	1,2,3,4,5,6,7,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0
			# make space for the 4 players
cardValue: .space 25	# start the string of the card, use by PrintCard

ReverseTrue:	.word 1		# reverse true or false - 1 mean A TO B TO C TO D TO A, -1 MEAN A TO D TO C TO B TO A CardNumber 12
SkipTrue:	.word 0		# skip true if $t4 is not equal to 	CardNUmber 11
DrawTwoTrue:	.word 0		# draw two true if $t3 not equal 0	CardNumber 10
CurrentCardPlay: .word 0	# store the current card 
CurrentColor:	.word	2048	# default for color red
CurrentCardUsed: .word 0	# store how many card is used * 4

Current:	.space 250 	#.asciiz "You have the following cards: "
Current2:	.space 450	# create space
ErrorMessage:	.asciiz "Invalid input, please try again. "
ColorQuestion:	.asciiz "What color do you want? 256 for Blue, 512 for Yellow, 1024 for Green, 2048 for Red"
talk1:		.asciiz "The Current Card is "
talk2:		.asciiz	", you can play any "
talk3:		.asciiz " cards or wild cards or wild plus 4 cards. \n"
CurrentPlayer1:	.asciiz "Which card do you want to play? type in a number for the card: -1 for ending the game, \n0 for gaining a card 1 for the first card, 2 for second, etc \nYou have the following cards: \n"
#CurrentPlayer2:	.asciiz "which card do you want to play? type in a number for the card: 1 for the first card, 2 for second, etc"
CardThatPlayerPlay: .asciiz "The card you play is "
CardThatPlayerPlayMessage: .space	50	# print the card that the player play message
deckSize: .word 108				# store number od cards
###################################
############## store the deck
deck:	.word 0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0 ,0,0,0,0,0,0,0,0,0,0,0,0,0  ,0,0,0,0,0,0,0,0,0,0,0,0,0

.text

	la	$a0, deck	# load the deck address
	jal	CreateDeck	# create the deck
	la	$a0, deck	# load the deck address
	jal	ShuffleCards	# shuffle the deck
	
	li	$v0, 55		# display the beginning message
	la	$a0, Begin	# address of the string
	li	$a1, 1		# 1 for information
	syscall
	
	li	$t0, 0		# $t0 deck address change
	add	$t6, $zero, $zero	# $t6 player cards address change
	la	$t1, deck	# $t1 contain the deck
	la	$t2, PlayerA	# $t2 contain the cards address of the player
CardsForA:
	add	$t3, $t1, $t0	# go to the current card on the deck
	add	$t5, $t2, $t6	# go to the current card address of the player
	lw	$t4, ($t3)	# get the card from the deck
	sw	$t4, ($t5)	# give the card to the player
	
	addi	$t0, $t0, 4	# increase the deck address by 4
	addi	$t6, $t6, 4	# increase the player card address by 4
	ble	$t6, 24, CardsForA	# each player take 7 card at the beginning 

	addi	$t6, $t6, 4	# go to the next player card address after the last card 
	add	$t5, $t2, $t6	# go to the next player card address after the last card 
	sw	$zero, ($t5)	# store zero inside to show it is the ending of the card
	
	add	$t6, $zero, $zero	# $t6 player cards address change
	la	$t2, PlayerB	# $t2 contain the cards address of the player
CardsForB:
	add	$t3, $t1, $t0	# go to the current card on the deck
	add	$t5, $t2, $t6	# go to the current card address of the player
	lw	$t4, ($t3)	# get the card from the deck
	sw	$t4, ($t5)	# give the card to the player
	
	addi	$t0, $t0, 4	# increase the deck address by 4
	addi	$t6, $t6, 4	# increase the player card address by 4
	ble	$t6, 24, CardsForB	# each player take 7 card at the beginning 

	addi	$t6, $t6, 4	# go to the next player card address after the last card 
	add	$t5, $t2, $t6	# go to the next player card address after the last card 
	sw	$zero, ($t5)	# store zero inside to show it is the ending of the card

	add	$t6, $zero, $zero	# $t6 player cards address change
	la	$t2, PlayerC	# $t2 contain the cards address of the player
CardsForC:
	add	$t3, $t1, $t0	# go to the current card on the deck
	add	$t5, $t2, $t6	# go to the current card address of the player
	lw	$t4, ($t3)	# get the card from the deck
	sw	$t4, ($t5)	# give the card to the player
	
	addi	$t0, $t0, 4	# increase the deck address by 4
	addi	$t6, $t6, 4	# increase the player card address by 4
	ble	$t6, 24, CardsForC	# each player take 7 card at the beginning 

	addi	$t6, $t6, 4	# go to the next player card address after the last card 
	add	$t5, $t2, $t6	# go to the next player card address after the last card 
	sw	$zero, ($t5)	# store zero inside to show it is the ending of the card

	add	$t6, $zero, $zero	# $t6 player cards address change
	la	$t2, PlayerD	# $t2 contain the cards address of the player
CardsForD:
	add	$t3, $t1, $t0	# go to the current card on the deck
	add	$t5, $t2, $t6	# go to the current card address of the player
	lw	$t4, ($t3)	# get the card from the deck
	sw	$t4, ($t5)	# give the card to the player
	
	addi	$t0, $t0, 4	# increase the deck address by 4
	addi	$t6, $t6, 4	# increase the player card address by 4
	ble	$t6, 24, CardsForD	# each player take 7 card at the beginning 
	
	sw	$t0, CurrentCardUsed	# store how many address is used
	addi	$t6, $t6, 4	# go to the next player card address after the last card 
	add	$t5, $t2, $t6	# go to the next player card address after the last card 
	sw	$zero, ($t5)	# store zero inside to show it is the ending of the card
###############################################################################################
##################### Game Start ##############################################################	
	# $t0 / 4 contain how many card is used
	# $t1 contain the deck the rest can change 
	li	$t2, 0  	# $t2 reverse true or false - 0 mean A TO B TO C TO D TO A, 1 MEAN A TO D TO C TO B TO A
	li	$t3, 0		# $t3 draw two true if $t3 not equal 0
	li	$t4, 0		# $t4 skip true if $t4 is not equal to 0
	add	$t5, $t1, $t0	# go to the current card on the deck
	lw	$t6, ($t5)	# $t6 contain the start card
	addi	$t0, $t0, 4	# increase the deck address by 4
	sw	$t6, CurrentCardPlay	
	## 	start card should not be a special card or we will ignore it
	sw	$t0, CurrentCardUsed	# store how many address is used
	
PlayerATurns:	
	li	$v0, 55			# show the message that only this player can see the next message
	la	$a0, PlayerAMessage
	li	$a1, 1
	syscall
	lw	$a0, CurrentCardPlay	# put the card in $a0 for the function follow by
	jal	PlayerTurns	# construct the string for current
	la	$a0, PlayerA	
	la	$a1, Current
	la	$a2, Current
	jal	GetPlayerCards	# add the cards that the player have into the string

PlayerAAnswer:
	la	$a0, Current
	li	$v0, 51		# show inputdialog int 
	syscall
	bne	$a1, 0, WrongAInputCard
	move	$a2, $a0	# $a0 has the answer, and CanThePlayerPlay $a2 need the answer
	la	$a0, PlayerA	# put in the address of the player
	lw	$a1, CurrentCardPlay	# the current card
	jal	CanThePlayerPlay	# check if this is a good card to play
	bne	$v0, 0, WrongAInputCard	# ask for input again if it does not work
	j	NextPlayerAfterA	# go to the next player
	WrongAInputCard:	###################################
	li	$v0, 55		## display wrong input message 
	la	$a0, ErrorMessage
	li	$a1, 0
	syscall
	j	PlayerAAnswer	# ask for answer again
	
	NextPlayerAfterA:	# check who is the next player
	lw	$t7, ReverseTrue	# check if it is going to the next or previous player
	beq	$t7, 1, NextPlayerIsBOrC
	lw	$t7, SkipTrue		# check if the player used skip
	beq	$t7, 0, PlayerDTurns
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerCTurns
	NextPlayerIsBOrC:		# if it is going from A TO B TO C TO D
	lw	$t7, SkipTrue
	beq	$t7, 0, PlayerBTurns
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerCTurns


PlayerBTurns:	
	li	$v0, 55			# show the message that only this player can see the next message
	la	$a0, PlayerBMessage
	li	$a1, 1
	syscall
	lw	$a0, CurrentCardPlay	# put the card in $a0 for the function follow by
	jal	PlayerTurns	# construct the string for current
	la	$a0, PlayerB
	la	$a1, Current
	la	$a2, Current
	jal	GetPlayerCards	# add the cards that the player have into the string

PlayerBAnswer:
	la	$a0, Current
	li	$v0, 51		# show inputdialog int 
	syscall
	bne	$a1, 0, WrongBInputCard
	move	$a2, $a0	# $a0 has the answer, and CanThePlayerPlay $a2 need the answer
	la	$a0, PlayerB		# input player B
	lw	$a1, CurrentCardPlay	# input the current card
	jal	CanThePlayerPlay	# go check if the player can use this card
	bne	$v0, 0, WrongBInputCard	# if not zero then ask input again
	j	NextPlayerAfterB	# go to the next player
	WrongBInputCard:
	li	$v0, 55			# if input is wrong, then ask for card again
	la	$a0, ErrorMessage
	li	$a1, 0
	syscall
	j	PlayerBAnswer
	
	NextPlayerAfterB:
	lw	$t7, ReverseTrue		# check what is the rotation
	beq	$t7, 1, NextPlayerIsCOrD	# check if next player is C or D
	lw	$t7, SkipTrue			# check do we need to skip
	beq	$t7, 0, PlayerATurns		
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerDTurns		# next is player D
	NextPlayerIsCOrD:
	lw	$t7, SkipTrue		# check skip is true
	beq	$t7, 0, PlayerCTurns	# go to player C
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerDTurns		# go to player D
	
PlayerCTurns:	
	li	$v0, 55			# show the message that only this player can see the next message
	la	$a0, PlayerCMessage
	li	$a1, 1
	syscall
	lw	$a0, CurrentCardPlay	# put the card in $a0 for the function follow by
	jal	PlayerTurns	# construct the string for current
	la	$a0, PlayerC
	la	$a1, Current
	la	$a2, Current
	jal	GetPlayerCards	# add the cards that the player have into the string

PlayerCAnswer:
	la	$a0, Current
	li	$v0, 51		# show inputdialog int 
	syscall
	bne	$a1, 0, WrongCInputCard
	move	$a2, $a0	# $a0 has the answer, and CanThePlayerPlay $a2 need the answer
	la	$a0, PlayerC	# put in the address of the player
	lw	$a1, CurrentCardPlay	# the current card
	jal	CanThePlayerPlay	# check if this is a good card to play
	bne	$v0, 0, WrongCInputCard	# ask for input again if it does not work
	j	NextPlayerAfterC	# go to the next player
	WrongCInputCard:	###################################
	li	$v0, 55		## display wrong input message 
	la	$a0, ErrorMessage
	li	$a1, 0
	syscall
	j	PlayerCAnswer	# ask for answer again
	
	NextPlayerAfterC:	# check who is the next player
	lw	$t7, ReverseTrue	# check if it is going to the next or previous player
	beq	$t7, 1, NextPlayerIsDOrA
	lw	$t7, SkipTrue		# check if the player used skip
	beq	$t7, 0, PlayerBTurns
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerATurns
	NextPlayerIsDOrA:		# if it is going from A TO B TO C TO D
	lw	$t7, SkipTrue
	beq	$t7, 0, PlayerDTurns
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerATurns
	
PlayerDTurns:
	li	$v0, 55			# show the message that only this player can see the next message
	la	$a0, PlayerDMessage
	li	$a1, 1
	syscall
	lw	$a0, CurrentCardPlay	# put the card in $a0 for the function follow by
	jal	PlayerTurns	# construct the string for current
	la	$a0, PlayerD
	la	$a1, Current
	la	$a2, Current
	jal	GetPlayerCards	# add the cards that the player have into the string

PlayerDAnswer:
	la	$a0, Current
	#move	$a0, $v0
	li	$v0, 51		# show inputdialog int 
	syscall
	bne	$a1, 0, WrongDInputCard
	move	$a2, $a0	# $a0 has the answer, and CanThePlayerPlay $a2 need the answer
	la	$a0, PlayerD	# put in the address of the player
	lw	$a1, CurrentCardPlay	# the current card
	jal	CanThePlayerPlay	# check if this is a good card to play
	bne	$v0, 0, WrongDInputCard	# ask for input again if it does not work
	j	NextPlayerAfterD	# go to the next player
	WrongDInputCard:	###################################
	li	$v0, 55		## display wrong input message 
	la	$a0, ErrorMessage
	li	$a1, 0
	syscall
	j	PlayerDAnswer	# ask for answer again
	
	NextPlayerAfterD:	# check who is the next player
	lw	$t7, ReverseTrue	# check if it is going to the next or previous player
	beq	$t7, 1, NextPlayerIsAOrB
	lw	$t7, SkipTrue		# check if the player used skip
	beq	$t7, 0, PlayerCTurns
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerBTurns
	NextPlayerIsAOrB:		# if it is going from A TO B TO C TO D
	lw	$t7, SkipTrue
	beq	$t7, 0, PlayerATurns
	li	$t7, 0			# change skip back to false
	sw	$t7, SkipTrue		# change skip back to false
	j	PlayerBTurns



exit:	
	# exit the program
	li	$v0, 55
	la	$a0, GameEnd
	li	$a1, 1
	syscall
	
	li	$v0, 10
	syscall

FuncStart:
	addi	$sp, $sp, -24		# push 3 items to stack
#	sw	$ra, 24($sp)
	sw	$s6, 20($sp)		# store s6 to the stack for byte address
	sw	$s5, 16($sp)		# store s5 to the stack for a byte content
	sw	$s4, 12($sp)		# store s4 to the stack
	sw	$s3, 8($sp)		# store s3 to the stack
	sw	$s2, 4($sp)		# store s2 to the stack
	sw	$s1, 0($sp)		# store s1 to the stack
	
	jr	$ra
FuncEnd:
	lw	$s1, 0($sp)		# restore s1 from stack
	lw	$s2, 4($sp)		# restore s2 from stack
	lw	$s3, 8($sp)		# restore s3 from stack
	lw	$s4, 12($sp)		# restore s4 from stack
	lw	$s5, 16($sp)		# restore s5 from stack
	lw	$s6, 20($sp)		# restore s6 from stack
	addi	$sp, $sp, 24		# pop 3 items from stack
	
	jr	$ra
	
CreateDeck:
	addi	$sp, $sp, -4	
	sw	$ra, ($sp)	# store the ruturn address
	jal	FuncStart
	######################################################
	# create 4 wild cards
	li	$s1, 0
	li	$s2, 13 # 13 represent wild cards
	wildLoop:
	add	$s3, $a0, $s1
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	bne	$s1, 16, wildLoop	# add 4 Wild cards
	#################################### 
	# create 4 wild plus cards 
	li	$s2, 14 # 14 represent wild plus cards
	wildPlusLoop:
	add	$s3, $a0, $s1
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	bne	$s1, 32, wildPlusLoop	# add four Wild Plus Four cards
	##############################################
	########## create blue cards ################
	li	$s2, 256
	add	$s3, $a0, $s1
	sw	$s2, ($s3)	# one zero card
	addi	$s1, $s1, 4	
	BlueCardLoop:
	addi	$s2, $s2, 1
	# two same color card	
	add	$s3, $a0, $s1
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	add	$s3, $a0, $s1		# from 1 to 12 represending 1 to 9 plus Draw Two, Skip, and Reverse
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	bne	$s2, 268, BlueCardLoop 
	##############################################
	########## create yellow cards ################
	li	$s2, 512
	add	$s3, $a0, $s1
	sw	$s2, ($s3)	# add a yellow zero card 
	addi	$s1, $s1, 4	
	YellowCardLoop:
	addi	$s2, $s2, 1
	# two same color card
	add	$s3, $a0, $s1
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	add	$s3, $a0, $s1	# from 1 to 12 represending 1 to 9 plus Draw Two, Skip, and Reverse
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	bne	$s2, 524, YellowCardLoop
	##############################################
	########## create green cards ################
	li	$s2, 1024
	add	$s3, $a0, $s1
	sw	$s2, ($s3)	# add a green zero cards
	addi	$s1, $s1, 4
	GreenCardLoop:
	addi	$s2, $s2, 1
	# two same color card
	add	$s3, $a0, $s1
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	add	$s3, $a0, $s1	# from 1 to 12 represending 1 to 9 plus Draw Two, Skip, and Reverse
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	bne	$s2, 1036, GreenCardLoop
	
	##############################################
	########## create Red cards ################
	li	$s2, 2048
	add	$s3, $a0, $s1
	sw	$s2, ($s3)	# add a red zero card
	addi	$s1, $s1, 4
	RedCardLoop:
	addi	$s2, $s2, 1
	# two same color card
	add	$s3, $a0, $s1
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	add	$s3, $a0, $s1	# from 1 to 12 represending 1 to 9 plus Draw Two, Skip, and Reverse
	sw	$s2, ($s3)
	addi	$s1, $s1, 4
	bne	$s2, 2060, RedCardLoop
	
	jal	FuncEnd
	lw	$ra, ($sp)	# restore the address where the function was called
	addi	$sp, $sp, 4	
	jr	$ra
	#############################################
	############finish create deck
##############################################################
################ shuffle the deck
ShuffleCards:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)	# store address
	jal	FuncStart
	move	$s2, $a0 # $a0 need to use to generate random number
	li	$s1, 0
	shuffleLoop:
	#########random generate a number ###########
	lw	$a0, randomSeed		# get the random seed
	li	$a1, 108		# get a number between 0 and 107
	li	$v0, 42			# generate a random number
	syscall
	################# $a0 contain the random number
	li	$s3, 4
	mult	$a0, $s3 
	mflo	$s3
	add	$s4, $s2, $s1 # one card
	add	$s3, $s2, $s3 # a random card
	###### swap the two cards
	lw	$s5, ($s4)
	lw	$s6, ($s3)
	addi	$s1, $s1, 4
	sw	$s5, ($s3)
	sw	$s6, ($s4)
	################################
	bne	$s1, 432, shuffleLoop
	jal	FuncEnd
	lw	$ra, ($sp)	# restore the address where the function was called
	addi	$sp, $sp, 4
	jr	$ra
###################################################
######### print card $a0 - card number
######### $a1 - address to store card
PrintCard:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)
	jal	FuncStart
	############## Check what type of card 
	bgeu	$a0, 2048, RedCard
	bgeu	$a0, 1024, GreenCard
	bgeu	$a0, 512, YellowCard
	bgeu	$a0, 256, BlueCard
	WildCards:
	beq	$a0, 13, wild13
	beq	$a0, 14, wildPlus14
	wild13:
	addi	$v0, $zero, 5 # 5 wild card
	la	$a1, wild	# wild card
	j	EndPrintCard
	wildPlus14:
	addi	$v0, $zero, 6 # 6 wild plus card
	la	$a1, wildPlus	# wild plus four card
	j	EndPrintCard
	RedCard:
	addi	$v0, $zero,  1
	addi	$v1, $a0, -2048		# if the card is red
	j	CombineColorValue
	GreenCard:
	addi	$v0, $zero,  2
	addi	$v1, $a0, -1024		# if the card is green
	j	CombineColorValue
	YellowCard:
	addi	$v0, $zero,  3
	addi	$v1, $a0, -512		# if the card is yellow
	j	CombineColorValue
	BlueCard:
	addi	$v0, $zero,  4	
	addi	$v1, $a0, -256		# if the card is green
################################################################
##### the following code find the number and combine the color and the card type
CombineColorValue:
	la	$a2, cardValue
	la	$a0, red
	beq	$v0, 1, ValueCheck
	la	$a0, green
	beq	$v0, 2, ValueCheck
	la	$a0, yellow
	beq	$v0, 3, ValueCheck
	la	$a0, blue
	#### the color is either red or green or yellow or blue
	ValueCheck:
	la	$a1, zero
	beq	$v1, 0, valueOne
	la	$a1, one
	beq	$v1, 1, valueOne
	la	$a1, two
	beq	$v1, 2, valueOne
	la	$a1, three
	beq	$v1, 3, valueOne
	la	$a1, four
	beq	$v1, 4, valueOne
	la	$a1, five
	beq	$v1, 5, valueOne
	la	$a1, six
	beq	$v1, 6, valueOne
	la	$a1, seven
	beq	$v1, 7, valueOne
	la	$a1, eight
	beq	$v1, 8, valueOne
	la	$a1, nine
	beq	$v1, 9, valueOne
	la	$a1, drawTwo
	beq	$v1, 10, valueOne	# draw two
	la	$a1, skip
	beq	$v1, 11, valueOne	# skip
	la	$a1, reverse
	beq	$v1, 12, valueOne	# reverse
valueOne:
	# 	combine the color and the card type
	jal	StringAppend
	la	$a1, cardValue
EndPrintCard:
	jal	FuncEnd
	lw	$ra, ($sp)
	addi	$sp, $sp, 4
	jr	$ra
#######################################################
################ Get Player's Cards####################
####	$a0 contain the player's cards address
####	$a1 beginning sentense
####	$a2 contain the address to store the cards
GetPlayerCards:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)	# store the return address
	jal	FuncStart
	
	lw	$s4, CurrentCardPlay	# get the current card
	and	$s4, $s4, 15		# add remove the color value, only keep the 4 most right bit
	beq	$s4, 14, PlayerDrawFourCards	# check if is wild plus four card
	beq	$s4, 10, PlayerDrawTwoCards	# check if is draw two cards
	j	AddCardsToTheMessage	# do not need to add card to the players
	PlayerDrawFourCards:		# add 4 cards because wild plus four
	jal	GetACardFromDeck	# add a card
	jal	GetACardFromDeck	# add a card
	PlayerDrawTwoCards:		
	jal	GetACardFromDeck	# add a card
	jal	GetACardFromDeck	# add a card
	
	
	AddCardsToTheMessage:
	move	$s1, $a0	# $s1 contain the player's cards address
	move	$s2, $a1	# $a1 beginning sentense
	move	$s3, $a2	# $a2 contain the address to store the cards
	move	$a0, $a1	
	loopForPlayerCardsView:	# add the cards that the player has to the message
	la	$a1, newLine
	move	$a2, $s3	# add a new line to it
	jal	StringAppend
	
	lw	$a0, ($s1)
	addi	$s1, $s1, 4
	beq	$a0, $zero, loopForPlayerCardsViewDone	# stop if the card is zero
	jal	PrintCard	# this function change $a1
				# get the string value of the card 
	move	$a0, $s3
	move	$a2, $s3
	jal	StringAppend	# add the card to it
	j	loopForPlayerCardsView	# loop again
	
	loopForPlayerCardsViewDone:
	move	$v0, $s3
	jal	FuncEnd
	lw	$ra, ($sp)
	addi	$sp, $sp, 4
	jr	$ra
############# GetPlayerCards end##################
######################################################
########################################################
################ String Append add two string together 
############ $a0 - first string, $a1, second string
############ $a2, the combine string
StringAppend:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)	# store return address
	jal	FuncStart
	
	li	$s1, 0
	appendLoop1:
	add	$s2, $a0, $s1	# copy the first string
	add	$s4, $a2, $s1	
	lb	$s3, ($s2)	#  get a byte
	addiu	$s1, $s1, 1
	beq	$s3, 0, finishStringOne 	# go to next string if this one finish
	sb	$s3, ($s4)	# store the byte
	j	appendLoop1
finishStringOne:
	li	$s5, 0		# copy the second string
	addi	$s1, $s1, -1
	appendLoop2:
	add	$s2, $a1, $s5	
	add	$s4, $a2, $s1
	lbu	$s3, ($s2)	# load the byte
	addiu	$s1, $s1, 1
	addiu	$s5, $s5, 1
	beq	$s3, 0, finishStringTwo 
	sb	$s3, ($s4)	# store the byte
	j	appendLoop2

finishStringTwo:
	sb	$s3, ($s4)	# store the end mark of a string
	move	$v1, $s4
	jal	FuncEnd
	lw	$ra, ($sp)	# restore the return address
	addi	$sp, $sp, 4
	jr	$ra
##############String append end#########################
########################################################
#	$a0 contain the current card
##	This function construct the string of the input message box 
# 	that above the cards that the player has
PlayerTurns:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)	# store the return address
	jal	FuncStart
	
	sw	$a0, CurrentCardPlay
	move	$s1, $a0
	jal	PrintCard	# $a1 has the string of the card
	la	$a0, talk1	
	la	$a2, Current
	jal	StringAppend	# combine talk1 and the card. Example: The Current Card is Blue-5
	
	la	$a0, Current
	la	$a2, Current
	la	$a1, talk2	# combine the string above with talk two
	jal	StringAppend
	lw	$a0, CurrentCardPlay
	beq	$a0, 14, WildCardTurns	# check if the current card is a Wild cards
	beq	$a0, 13, WildCardTurns
	j	AfterWildCardTurns
	WildCardTurns:
	lw	$a0, CurrentColor	# load the color
	AfterWildCardTurns:
	bgeu	$a0, 2048, RedCardTurn	# if is red
	bgeu	$a0, 1024, GreenCardTurn	# if is green
	bgeu	$a0, 512, YellowCardTurn	# if is yellow
	# it is blue
BlueCardTurn:
	li	$s6, 256
	sw	$s6, CurrentColor	# save current color
	la	$a0, Current
	la	$a2, Current
	la	$a1, blue
	jal	StringAppend		# add the color to the string
	j	PlayerTurnsEnd
	RedCardTurn:
	li	$s6, 2048		
	sw	$s6, CurrentColor	# save the color
	la	$a0, Current
	la	$a2, Current
	la	$a1, red
	jal	StringAppend		# add the color to the string
	j	PlayerTurnsEnd
	
	GreenCardTurn:
	li	$s6, 1024		
	sw	$s6, CurrentColor	# save the current color
	la	$a0, Current
	la	$a2, Current
	la	$a1, green
	jal	StringAppend		# add the color to the string
	j	PlayerTurnsEnd
	YellowCardTurn:
	li	$s6, 512
	sw	$s6, CurrentColor	# save the current color
	la	$a0, Current
	la	$a2, Current
	la	$a1, yellow
	jal	StringAppend		# add the color to the string
	#j	PlayerTurnsEnd
PlayerTurnsEnd:	
	la	$a0, Current
	la	$a2, Current
	la	$a1, talk3		# add talk3 on the string
	jal	StringAppend		
	la	$a0, Current
	la	$a2, Current
	la	$a1, CurrentPlayer1	# information for the player about how to input 
	jal	StringAppend
	jal	FuncEnd
	lw	$ra, ($sp)
	addi	$sp, $sp, 4
	jr	$ra
###########	PlayerTurns function end###########
######################################################
##	$a0 the player
##	$a1 the current card
## 	$a2 the card number that player play
##	$v0 return 0 mean the player play a right card
CanThePlayerPlay:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)
	jal	FuncStart
	beq	$a2, 0, AddACard	# add a card
	beq	$a2, -1, exit		# stop the game
	
	mul	$s1, $a2, 4	# mult the user imput by 4
	addi	$s2, $s1, -4	# minus 4 to go to the address of the card play
	add	$s3, $a0, $s2	# $s3 contain the address of the card play
	lw	$s4, ($s3)	# $s4 put the card into $s4
	beq	$a1, 13, CurrentIsWild
	beq	$a1, 14, CurrentIsWild
	
	beq	$s4, 13, WildCardPlay	# jump if is a wild card
	beq	$s4, 14, WildPlusCardPlay # jump if is a wild card
	
	and	$s6, $s4, 15	# delete the player's card color
	and	$s1, $a1, 15	# delete the current card color
	beq	$s6, $s1, sameNumberCardPlay	# jump if they have the same number, which mean can play
	j	AfterCurrentIsWild
	CurrentIsWild:
	lw	$a1, CurrentColor	# get the color
	AfterCurrentIsWild:
	and	$s5, $s4, $a1		# since 256, 512, 1024, 2048 all has a bit, if the two cards are same color
				# and the two card should have a number greater than 255
	bge	$s5, 250, SameColorCardPlay	# jump if they have the same color, which mean can play
	j	CardCannotPlay		# this card can not play
	AddACard:
	jal	GetACardFromDeck	# add a card due to the user input 0
	li	$v0, 0
	j	CanThePlayerPlayEnd2	# function end
	
	WildPlusCardPlayTryAgain:
	li	$v0, 55			# wrong input for asking new color 
	la	$a0, ErrorMessage	# show error message
	li	$a1, 0			
	syscall
	WildPlusCardPlay: # need to ask the user to input what color do you want
	WildCardPlay:
	sw	$s4, CurrentCardPlay
	li	$v0, 51			# ask the what color does the player want
	la	$a0, ColorQuestion
	syscall
	bne	$a1, 0, WildPlusCardPlayTryAgain	# try again if the input is wrong
	li	$v0, 0	
	bne	$a0, 2048, NextColor1	# go check the next color
	sw	$a0, CurrentColor	
	j	NoSpecialCard
	NextColor1:
	bne	$a0, 1024, NextColor2	# go check the next color
	sw	$a0, CurrentColor
	j	NoSpecialCard
	NextColor2:
	bne	$a0, 512, NextColor3	# go check the next color
	sw	$a0, CurrentColor
	j	NoSpecialCard
	NextColor3:
	bne	$a0, 256, WildPlusCardPlayTryAgain	# invalid input, ask input again
	sw	$a0, CurrentColor
	j	NoSpecialCard
	
	SameColorCardPlay:
	sameNumberCardPlay:
	li	$v0, 1	# holder 
	sw	$s4, CurrentCardPlay	# save the new card
	beq	$s6, 10, ChangeDrawTwo	# check if the card is a draw two card
	beq	$s6, 11, ChangeSkip	# check if the card is a skip card
	beq	$s6, 12, ChangeReverse	# check if the card is a reverse card
	j	NoSpecialCard
	ChangeDrawTwo:
	sw	$v0, DrawTwoTrue	# change draw two true to 1
	j	NoSpecialCard
	ChangeSkip:
	sw	$v0, SkipTrue		# change skip true to 1
	j	NoSpecialCard
	ChangeReverse:
	lw	$v0, ReverseTrue	# change reverse true 
	mul	$v0, $v0, -1	# swtich between 1 and -1
	sw	$v0, ReverseTrue
	NoSpecialCard:
	move	$a0, $s3	# delete the card that was used
	jal	DeleteCard
	li	$v0, 0		
	j	CanThePlayerPlayEnd
	CardCannotPlay:
	li	$v0, 1		# set $v0 to 1 shows that this card can not use
	j	CanThePlayerPlayEnd2
	CanThePlayerPlayEnd:
	lw	$a0, CurrentCardPlay
	jal	PrintCard
	la	$a0, CardThatPlayerPlay		# construct the string that show the player the card he/she used
	la	$a2, CardThatPlayerPlayMessage
	jal	StringAppend

	la	$a1, 1
	li	$v0, 55			# display the message that tell the player the card he/she used
	la	$a0, CardThatPlayerPlayMessage
	syscall
	li	$v0, 4			# print the message on Run I/O
	la	$a0, CardThatPlayerPlayMessage
	syscall
	li	$v0, 4			# print a new line
	la	$a0, newLine
	syscall
	li	$v0, 0
	CanThePlayerPlayEnd2:
	jal	FuncEnd
	lw	$ra, ($sp)
	addi	$sp, $sp, 4
	jr	$ra
###############################################
############### $a0 contain the address of the card to delete
######		delete a card from player's hand
DeleteCard:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)	# store return address
	jal	FuncStart
	
	addi	$s1, $a0, 4	# go to the next card
LoopForDeleteCard:	
	lw	$s2, ($s1)	# load the next card	
	sw	$s2, ($a0)	# overide the previous card
	addi	$s1, $s1, 4	# go to next
	addi	$a0, $a0, 4	# go to next
	bne	$s2,0 LoopForDeleteCard
	addi	$a0, $a0, -4 	# move $a0 one card back
	#	check if $a0 is the beginning address of the players
	la	$s4, PlayerA
	beq	$s4, $a0, PlayerAWins	# check if A wins
	la	$s4, PlayerB
	beq	$s4, $a0, PlayerBWins	# check if B wins
	la	$s4, PlayerC	
	beq	$s4, $a0, PlayerCWins	# check if C wins
	la	$s4, PlayerD
	beq	$s4, $a0, PlayerDWins	# check if D wins
	j	LoopForDeleteCardEnd
PlayerAWins:
	li	$v0, 55
	la	$a0, PlayerAWinsMessage
	li	$a1, 1		# show winer's message 
	syscall
	j	exit
PlayerBWins:
	li	$v0, 55
	la	$a0, PlayerBWinsMessage
	li	$a1, 1		# show winer's message 
	syscall
	j	exit
PlayerCWins:
	li	$v0, 55
	la	$a0, PlayerCWinsMessage
	li	$a1, 1		# show winer's message 
	syscall
	j	exit
PlayerDWins:
	li	$v0, 55
	la	$a0, PlayerDWinsMessage
	li	$a1, 1		# show winer's message 
	syscall
	j	exit
LoopForDeleteCardEnd:
	jal	FuncEnd
	lw	$ra, ($sp)	# restore the return address
	addi	$sp, $sp, 4
	jr	$ra
##################################################
#	$a0 contain the player address that recevie new card
##### a player get a card from the deck
GetACardFromDeck:
	addi	$sp, $sp, -4
	sw	$ra, ($sp)	# store return address
	jal	FuncStart

	la	$s1, deck	# load the deck
	lw	$s2, CurrentCardUsed	# load how many card used
	bge	$s2, 432, GetACardFromDeckEnd	# if all cards are use, then no more card to give
	li	$s3, 0		# player Card counter
	LoopToAddCardToTheEnd:	# this loop find the address after the last card
	add	$s4, $a0, $s3
	lw	$s5, ($s4)
	beq	$s5, 0, AddCardHere	# if this address store zero
	addi	$s3, $s3, 4
	j	LoopToAddCardToTheEnd
	AddCardHere:
	
	add	$s6, $s1, $s2	#get the card from the deck
	lw	$s5, ($s6)	# put it in $s5
	sw	$s5, ($s4)	# give it to the player
	addi	$s3, $s3, 4	#couter
	addi	$s2, $s2, 4	# couter
	add	$s4, $a0, $s3	# move the address
	sw	$s2, CurrentCardUsed	# store how many card used
	sw	$zero,($s4) 
	GetACardFromDeckEnd:
	jal	FuncEnd
	lw	$ra, ($sp)	# restore the return address
	addi	$sp, $sp, 4
	jr	$ra

