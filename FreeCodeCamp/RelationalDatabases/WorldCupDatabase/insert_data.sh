#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[ $YEAR != year ]]
  then

  ## Populate teams table
  
  # Check if WINNER or OPPONENT is a team already in teams table. If it is not in the table insert, otherwise don't do anything.
  WINNER_QUERY=$($PSQL "SELECT name FROM teams WHERE name='$WINNER';")
  OPPONENT_QUERY=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT';")

  if [[ -z $WINNER_QUERY ]]
  then
    INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
    if [[ $INSERT_WINNER_TEAM == 'INSERT 0 1' ]]
    then
    echo "Inserted $WINNER (winner) into teams table"
    fi
  fi

  if [[ -z $OPPONENT_QUERY ]]
  then
    INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
    if [[ $INSERT_OPPONENT_TEAM == 'INSERT 0 1' ]]
    then
    echo "Inserted $OPPONENT (Opponent) into teams table"
    fi
  fi


  ## Populate games table. Previous logic will guarantee that the current winner and opponent team is inside the teams table.

  # grab team id for both winner and opponent
  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

  # Check if (year,round,opponent_id,winner_id) is in the game table already.
  GAME_CHECK=$($PSQL "SELECT year,round,opponent_id,winner_id FROM games WHERE year=$YEAR AND round='$ROUND' AND opponent_id=$OPPONENT_TEAM_ID AND winner_id=$WINNER_TEAM_ID;")
  if [[ -z $GAME_CHECK ]]
  then
  INSERT_GAME=$($PSQL "INSERT INTO games(year,round,opponent_id,winner_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$OPPONENT_TEAM_ID,$WINNER_TEAM_ID,$WINNER_GOALS,$OPPONENT_GOALS);")

  if [[ $INSERT_GAME == 'INSERT 0 1' ]]
  then
    echo "Inserted year=$YEAR, round=$ROUND, winner=$WINNER, opponent=$OPPONENT"
  fi


  fi





  fi


done