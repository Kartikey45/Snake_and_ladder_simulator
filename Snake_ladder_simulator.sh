#!/bin/bash -x

echo "**********************Welcome to Snake and ladder Simulator***********************"

#CONSTANTS
NUMBER_OF_PLAYER=1
START_POSITION=0
NO_PLAY=1
LADDER=2
SNAKE=3

#VARIABLE
position=$START_POSITION

#ROLL DIE FOR PLAYER
rollDie=$(( 1 + RANDOM % 6 ))

#CHECK FOR OPTION
checkOption=$(( 1 + RANDOM % 3 ))

case "$checkOption" in
	$NO_PLAY)
		echo "Player is on same Position."
		;;
	$LADDER)
		position=$(( position + rollDie ))
		echo "Player moves ahead by $rollDie position."
		;;
	$SNAKE)
		position=$(( position - rollDie ))
		echo "Player moves behind by $rollDie position."
		;;
esac
