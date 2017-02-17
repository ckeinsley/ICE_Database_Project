Curtis Humm, Christopher Keinsley, Yuchen Wang
2/16/17

The readme as well as all of these scripts can be accessed at
our github repo https://github.com/ckeinsley/ICE_Database_Project,
additionally all of our frontend/server code is contained within this github repository. 

Contained here you will find the Microsoft SQL Queries necesarry to recreate the ICE 
Database Project. 

A Note on Order

Run the Table Queries first in the order Ingredient, Account, Stock, Recipe, Table,
Favorite, Contains, Staff, Orders so as to get the foreign keys in the right order.

The run all Index Queries. 

Then run all of the Add, Update, and Delete SPROCS

Then run CheckMoney, CheckParts, Check Stock, DecPart, and Dec Stock SPROCS

Finish by running the trigger querey


