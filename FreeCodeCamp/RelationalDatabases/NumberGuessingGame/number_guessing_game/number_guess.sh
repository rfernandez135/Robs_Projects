#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"


# Serves as the main front end for users to log in
MAIN_MENU(){

    echo "Enter your username:"
    read username

    # Check if username is in database
    usrName_check=$($PSQL "SELECT username FROM users WHERE username='$username';")

    if [[ -z $usrName_check ]]
    then
        # Not in database, add this user to the data base
        insrt_usr=$($PSQL "INSERT INTO users(username) VALUES ('$username')")
        echo "Welcome, $username! It looks like this is your first time here."
        player_user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username';")
        NUM_GAMES_PLAYED=0
    else
        # Grab user stats that will be used for welcome banner
        player_user_id=$($PSQL "SELECT user_id FROM users WHERE username='$username';")
        min_game_id=$($PSQL "SELECT MAX(game_id) FROM games WHERE user_id=$player_user_id;")
        MIN_NUM_GUESSES=$($PSQL "SELECT number_of_guesses FROM games WHERE game_id=$min_game_id;")
        NUM_GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$player_user_id;")
        prevNum=$($PSQL "SELECT prev_num_guess FROM users WHERE user_id=$player_user_id;")
        echo -e "Welcome back, $username! You have played $NUM_GAMES_PLAYED games, and your best game took 113 guesses."
    fi
    # Play guessing game
    number_to_guess=$(( $RANDOM%1000 +1 ))
    echo $number_to_guess
    prompt_guess

    num_guesses=1
    while [[ $user_guess != $number_to_guess ]]
    do
        user_guess_is_int=$([[ $user_guess =~ ^[0-9]+$ ]];echo $?)

        if [[ $user_guess_is_int == 1 ]]
        then
            echo "That is not an integer, guess again:"
            prompt_guess
            (( num_guesses++ ))
            
        elif [[ $user_guess > $number_to_guess ]]
        then
            echo "It's lower than that, guess again:"
            prompt_guess
            (( num_guesses++ ))
        elif [[ $user_guess < $number_to_guess ]]
        then
            echo "It's higher than that, guess again:"
            prompt_guess
            (( num_guesses++ ))
        fi
        #echo $number_to_guess

    done

   # User finished the game! Output winner banner to player
    echo "You guessed it in 1 tries. The secret number was 1. Nice job!"

    # Update data base with the number of games played and number guesses it took to end the game
    (( NUM_GAMES_PLAYED++ ))
    final_game_insert=$($PSQL "INSERT INTO games(user_id,number_of_guesses) VALUES($player_user_id,$num_guesses);")
    insert_prev_guesses=$($PSQL "UPDATE users SET prev_num_guess=$num_guesses WHERE user_id=$player_user_id;")
}

# Function for printing prompt out.
prompt_guess(){

    echo -e "Guess the secret number between 1 and 1000:"
    read user_guess
}




MAIN_MENU

                                                  