CREATE DATABASE number_guess;
\c number_guess

-- Create tables for project
CREATE TABLE users (
    user_id serial primary key,
    username varchar(22),
    num_games_played int NOT NULL DEFAULT 0

);

CREATE TABLE games (
    game_id serial primary key,
    user_id int,
    number_of_guesses int NOT NULL,
    foreign key(user_id) references users(user_id)
);

