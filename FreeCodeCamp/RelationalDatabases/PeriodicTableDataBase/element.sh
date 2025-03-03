#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -c"

if [[ -z $1 ]]
then

  echo Please provide an element as an argument.

else

  # Need to check user input. The user can input:
  # The atomic number.
  # The symbol
  # the name of the element.
  
  # Since the atomic number is an integer and symbol/name are varchars, handling them as input should be different.
  input_is_a_number=$([[ $1 =~ ^[0-9]+$ ]];echo $?)
  input_is_a_elementStr=$([[ $1 =~ ^[A-Z][a-z]*$ ]];echo $?)

  if [[ $input_is_a_number == 0 ]]
  then
    user_input_check=$($PSQL "SELECT atomic_number,symbol,name FROM elements WHERE atomic_number=$1;")
  elif [[ $input_is_a_elementStr == 0 ]]
  then
    user_input_check=$($PSQL "SELECT atomic_number,symbol,name FROM elements WHERE symbol='$1' OR name='$1';")
  fi

  # Check if user inputted value was found in database

  if [[ -z $user_input_check ]]
  then
    echo "I could not find that element in the database."
  else
    # Element was found. Grab the following information to print out the necessary information:
    # atomic_number
    # name
    # symbol
    echo "$user_input_check" | while read ATOMIC_NUM BAR SYMBOL BAR NAME
    do
    # Grab
    # type
    # atomic mass
    # melting point
    # boiling point
    Other_data=$($PSQL "SELECT type,atomic_mass,melting_point_celsius,boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUM;")

    # Echo out information to user in correct format
    echo "$Other_data" | while read TYPE BAR ATOMIC_MASS BAR MELT_PT BAR BOIL_PT
    do
      echo "The element with atomic number $ATOMIC_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELT_PT celsius and a boiling point of $BOIL_PT celsius."    
    done
    
    done
    


  fi

fi


