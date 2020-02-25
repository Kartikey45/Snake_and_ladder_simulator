#!/bin/bash -x

echo "**********************Welcome to Snake and ladder Simulator***********************"

#CONSTANTS
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3
WINNING_POSITION=100

#VARIABLES
position=$START_POSITION
positionOfPlayer1=$START_POSITION
positionOfPlayer2=$START_POSITION
flag=0

#FUNCTION ROLL DIE FOR PLAYER
function rollDie()
{
	rollDie=$(( 1 + RANDOM % 6 ))
	echo $rollDie
}

#FUNCTION TO CHECK FOR OPTION
function checkOption()
{
	rollDie=$(rollDie)
	checkOption=$(( 1 + RANDOM % 3 ))

	case "$checkOption" in
		$NO_PLAY)
			position=$position
			;;
		$LADDER)
			position=$(( position + rollDie ))
			if [ $position -gt $WINNING_POSITION ]
			then
				position=$(( position - rollDie ))
			fi
			;;
		$SNAKE)
			position=$(( position - rollDie ))
			if [ $position -lt $START_POSITION ]
			then
				position=$START_POSITION
			fi
			;;
	esac

}

#FUNCTION TO CONTINUE PLAYING TILL ANY PLAYER REACHES WINNING POSITION
function winningPosition()
{
	while [ $position -ne $WINNING_POSITION ]
	do
		#FUNCTION CALL TO SET THE PLAYER
		setPlayer
	done
}

#FUNCTION TO SET PLAYER
function setPlayer()
{
	if [ $flag -eq 0 ]
	then
		position=$positionOfPlayer1
		checkOption
		flag=1
		positionOfPlayer1=$position
	else
		position=$positionOfPlayer2
		checkOption
		flag=0
		positionOfPlayer2=$position
	fi
}

#FUNCTION TO CHECK WINNER
function checkWinner()
{
	if [ $positionOfPlayer1 -eq $WINNING_POSITION ]
	then
		echo "Player 1 Wins"
	else
		echo "Player 2 Wins"
	fi
}

#FUNCTION CALL
winningPosition
checkWinner
