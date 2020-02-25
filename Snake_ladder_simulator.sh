#!/bin/bash -x

echo "**********************Welcome to Snake and ladder Simulator***********************"

#CONSTANTS
NUMBER_OF_PLAYER=1
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3
WINNING_POSITION=100

#VARIABLE
position=$START_POSITION

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

	echo $position
}

#FUNCTION TO CONTINUE PLAYING TILL REACHES WINNING POSITION
function winningPosition()
{
	while [ $position -ne $WINNING_POSITION ]
	do
		checkOption
	done
}

winningPosition
