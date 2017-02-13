# from __future__ import print_function
from flask import Flask, request, render_template, jsonify, url_for, redirect
import pypyodbc
# import sys

APP = Flask(__name__)

CONNECTION = pypyodbc.connect('Driver={SQL Server}; Server=titan.csse.rose-hulman.edu;'
                              'Database=ICE_Project; Uid=introvertGuest; Pwd=introvertPassword')


@APP.route('/')
@APP.route('/Welcome')
def hello_world():
    return render_template('Welcome.html')

#-----------MENU----------------#


@APP.route('/Menu')
def menu_page():
    cursor = CONNECTION.cursor()
    squery = ("SELECT RecipeName, Price, Rating FROM Recipe")
    cursor.execute(squery)
    results = cursor.fetchall()
    rows = []
    for row in results:
        rows.append(row)
    return render_template("Menu.html", menu=rows)

#---------------RECIPE-------------------#


@APP.route('/Recipe')
def recipe_page():
    recipename = request.args.get('name')
    cursor = CONNECTION.cursor()
    squery1 = ("SELECT* FROM Recipe WHERE RecipeName=" +
               "'" + recipename + "'")
    cursor.execute(squery1)
    result1 = cursor.fetchall()
    return render_template('Recipe.html', recipe=result1[0])

#-----ORDERS------#


@APP.route('/OrderList')
def orderList_page():
    cursor = CONNECTION.cursor()
    squery = ("SELECT* FROM [Check]")
    cursor.execute(squery)
    results = cursor.fetchall()
    rows = []
    for row in results:
        rows.append(row)
    return render_template("OrderList.html", orderlist=rows)


@APP.route('/Order', methods=['GET', 'POST'])
def order_page():
    # TODO get the guest number from page and pass that into the SQLquery
    guestnumber = request.args.get('guestnumber', '')
    username = request.args.get('user', '')
    date = request.args.get('time', '')
    cursor = CONNECTION.cursor()
    squery = (
        "SELECT * FROM [Check], Orders WHERE [Check].GuestNumber=Orders.GuestNumber AND [Check].GuestNumber=")
    squery+=str(guestnumber)
    cursor.execute(squery)
    result = cursor.fetchall()
    return render_template('Order.html', orderInfo=result)


@APP.route('/Order', methods=['POST'])
def order_page_post():
    # Lets do a query
    return redirect(url_for('order_page'))

#-----CUSTOMERS----------#


@APP.route('/CustomerList')
def customerList_page():
    cursor = CONNECTION.cursor()
    squery = ("SELECT Username, Balance FROM Account")
    cursor.execute(squery)
    results = cursor.fetchall()
    rows = []
    for row in results:
        rows.append(row)
    return render_template("CustomerList.html", customer=rows)


@APP.route('/Customer')
def customer_page():
    username = request.args.get('user')
    cursor = CONNECTION.cursor()
    squery1 = ("SELECT * FROM Account WHERE Username=" + "'" + username + "'")
    cursor.execute(squery1)
    result1 = cursor.fetchall()
    return render_template('Customer.html', customer=result1[0])

#-------INGREDIENTS----------#


@APP.route('/IngredientList')
def ingredientList_page():
    cursor = CONNECTION.cursor()
    squery = ("SELECT Stock.IngredientName, Quantity, Units, ExpirationDate FROM Stock, Ingredient WHERE Stock.IngredientName=Ingredient.IngredientName;")
    cursor.execute(squery)
    results = cursor.fetchall()
    rows = []
    for row in results:
        rows.append(row)
    return render_template('IngredientList.html', ingredientlist=rows)


@APP.route('/Ingredient')
def ingredient_page():
    iname = request.args.get('name')
    cursor = CONNECTION.cursor()
    squery = ("SELECT * FROM Ingredient WHERE IngredientName=" + "'" + iname + "'")
    cursor.execute(squery)
    result = cursor.fetchall()
    return render_template('Ingredient.html', info=result[0])

if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=8080, debug=True)
