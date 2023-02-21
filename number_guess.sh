#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

echo -e "\n~~~~~ Number Guessing Game ~~~~~\n"

echo -e "Enter your username:"
read USER_NAME

echo -e "Welcome back, $USER_NAME! You have played <games_played> games, and your best game took <best_game> guesses."
echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
echo -e "Guess the secret number between 1 and 1000:"

RANDOM_NUMBER=$(( $RANDOM % 100 + 1 ))
echo $RANDOM_NUMBER

GAME() {
  let NUMBER_OF_TRIES++
  read USER_GUESS_NUMBER
  if [[ ! $USER_GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $USER_GUESS_NUMBER > $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $USER_GUESS_NUMBER < $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $USER_GUESS_NUMBER == $RANDOM_NUMBER ]]
  then
    echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    return 0
  fi
  GAME
}

GAME