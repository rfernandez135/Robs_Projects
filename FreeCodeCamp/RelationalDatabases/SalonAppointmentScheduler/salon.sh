#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~ My salon ~~\n"

# Define functions for SALON front end
MAIN_MENU(){


# Message user if brought back to main menu due to error with user input
if [[ $1 ]]
then
echo -e "$1\n"
fi


# Grab list of all services
LIST_OF_SERVICES=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id;")

# process list of services in a way that is more readable.
echo "$LIST_OF_SERVICES" | while read SERVICE_ID BAR SERVICE
do
echo "$SERVICE_ID) $SERVICE"
done

# Read in user input for desired service
read SERVICE_ID_SELECTED

# Check that the user inputted a number
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
  MAIN_MENU "Please pick a service number. Input is not a service number." 
else
  # Check that the desired service is offered. If it is not, the user should be brought back to the main menu and shown the list again.
  SERVICE_OFFERED_RESULT="$($PSQL "SELECT service_id FROM services GROUP BY service_id HAVING MIN(service_id) <= $SERVICE_ID_SELECTED AND MAX(service_id) >= $SERVICE_ID_SELECTED;")"
  if [[ -z $SERVICE_OFFERED_RESULT ]]
  then
    MAIN_MENU "\nService is not offered. Please pick a service number from the list of services."

  else
  # Ask user for their phone number.
  echo "What is your phone number:"
  read CUSTOMER_PHONE

  # If the phone number is not inside the database ask them for their name so that they can be added.
  PHONE_CHECK=$($PSQL "SELECT phone from customers WHERE phone='$CUSTOMER_PHONE'")
  
  if [[ -z $PHONE_CHECK ]]
  then
  echo What is your name?
  read CUSTOMER_NAME
  INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(phone,name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME');")
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE';")

  # Ask the user for a time. Normally, one should check that the time is the correct format. However, for sake of time, I will assume that the time is entered like [''1][0-9]:[0-5][0-9].
  echo What time would you like book this service?:
  read SERVICE_TIME

  # Insert appointment data into database
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")

  # Get service name for print out to customer.
  SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id=$SERVICE_ID_SELECTED;"| sed -E 's/ +//g')

  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."


  else
  
  CUSTOMER_NAME=$($PSQL "SELECT name from customers WHERE phone='$CUSTOMER_PHONE';" | sed -E 's/ +//g')
  CUSTOMER_ID=$($PSQL "SELECT customer_id from customers WHERE phone='$CUSTOMER_PHONE';")

  # Ask the user for a time. Normally, one should check that the time is the correct format. However, for sake of time, I will assume that the time is entered like [''1][0-9]:[0-5][0-9].
  echo What time would you like book this service?:
  read SERVICE_TIME

  # Insert appointment data into database
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES ($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME');")

  # Get service name for print out to customer.
  SERVICE_NAME=$($PSQL "SELECT name FROM services where service_id=$SERVICE_ID_SELECTED;"| sed -E 's/ +//g')

  echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."





  fi




  fi

fi





}


MAIN_MENU 




