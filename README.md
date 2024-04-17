# Demo App

A new Flutter project.

## Getting Started

This project is a for demonstration of api connect, cubit, and hive database.
It connects to the public api [https://dummyjson.com/docs/products]

It demonstrates adding a product via POST but it does not save to the dummyjson server, it only imitates the response
of a successfuly posting the data via POST api.

## Features:

Login
Fetch from api[dummyjson.com] and display the data
Add a product via API and when the POST succeed, save the data locally using HIVE and display

## Credentials
Use any of the following credentials to login or choose any account from this site [https://dummyjson.com/users]
"username": atuny0,
"password": 9uQFF1Lh,

"username": "hbingley1",
"password": "CQutx25i8r",

"username": "rshawe2",
"password": "OWsTbMUgFc",


## How to compile and run the app

Run the following commands on your IDE:

flutter pub get

dart run build_runner build --delete-conflicting-outputs

dart plugins/i18n_generator/lib/main.dart --output lib/generated/i18n_lookup.generated.dart

flutter format lib

## Run the app
Press the compile + run button on the IDE
