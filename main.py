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


@APP.route('/Menu',methods=['GET', 'POST','PUT'])
def menu_page():
    method=request.form.get('_method')
    if request.method == 'POST':
        recipename = request.form.get('name')
        price = request.form.get('price')
        time = request.form.get('time')
        info = request.form.get('calorie')
        des = request.form.get('description')
        rate = request.form.get('rate')
        img = request.form.get('img')
        cursor = CONNECTION.cursor()
        sqlquer = "exec AddRecipe " + \
            "["+str(recipename) + "] , " + price + \
            " , " + time + " , [" + str(info) + "]," + rate + ",[ " + str(img) + " ] , '' "
        cursor.execute(sqlquer)
        CONNECTION.commit()


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
    name = request.args.get('name')
    cursor = CONNECTION.cursor()
    squery = "SELECT RecipeName, Description, NutritionalInfo, CookTime, PictureURL " \
        "FROM Recipe " \
        "WHERE RecipeName = '" + name + "'"
    cursor.execute(squery)
    result = cursor.fetchone()
    return render_template('Recipe.html', recipe=result)


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
    method=request.form.get('_method')
    if method == 'POST':
        guestnumber = request.args.get('guestnumber', '')
        recipename = request.form.get('name')
        quantity = request.form.get('quantity')
        cursor = CONNECTION.cursor()
        sqlquer = "exec AddOrder " + \
            (guestnumber) + " , [" + str(recipename) + \
            "], " + str(quantity) + " , '' "
        cursor.execute(sqlquer)
        CONNECTION.commit()

    if method == 'PUT':
        guestnumber = request.args.get('guestnumber', '')
        username = request.args.get('user', '')
        date = request.args.get('time', '')
        recipename = request.form.get('name')
        quantity = request.form.get('quantity')
        cursor = CONNECTION.cursor()
        sqlquer = "exec UpdateBuy [" + \
            (guestnumber) + "] , [" + str(recipename) + \
            "] , [" + str(quantity) + "] , '' "
        cursor.execute(sqlquer)
        CONNECTION.commit()

    
    guestnumber = request.args.get('guestnumber', '')
    username = request.args.get('user', '')
    date = request.args.get('time', '')
    cursor = CONNECTION.cursor()
    squery = "Select Orders.RecipeName, Quantity, (Price*Quantity) as Price " \
        "From [Check], Orders, Recipe " \
        "Where [Check].GuestNumber = Orders.GuestNumber " \
        "And Orders.RecipeName = Recipe.RecipeName " \
        "AND [Check].GuestNumber = " + guestnumber

    squery2 = "Select Orders.GuestNumber, [Date/Time], TableNumber "  \
        "From [Check], Orders " \
        "Where [Check].GuestNumber = Orders.GuestNumber " \
        "AND [Check].GuestNumber = " + guestnumber

    cursor.execute(squery)
    recipesOrdered = cursor.fetchall()

    cursor.execute(squery2)
    checkInfo = cursor.fetchone()
    return render_template('Order.html', orderInfo=recipesOrdered, checkInfo=checkInfo)


#-----CUSTOMERS----------#


@APP.route('/CustomerList')
def customerList_page():
    cursor = CONNECTION.cursor()
    squery = ("SELECT Username, Balance, FullName FROM Account")
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
    squery2 = ("SELECT * FROM [CHECK] WHERE Username=" + "'" + username + "'")
    squery3 = ("SELECT * FROM Favorite WHERE Username=" + "'" + username + "'")
    cursor.execute(squery1)
    result1 = cursor.fetchall()
    cursor.execute(squery2)
    result2 = cursor.fetchall()
    cursor.execute(squery3)
    if cursor.rowcount == 0:
        temp = ['', "None"]
        return render_template('Customer.html', customer=result1[0],hisorder=result2,fav=temp)
    result3 = cursor.fetchall()
    return render_template('Customer.html', customer=result1[0],hisorder=result2,fav=result3[0])

#-------INGREDIENTS----------#


@APP.route('/IngredientList', methods=['POST', 'GET'])
def ingredientList_page():
    if request.method == 'POST':
        nameOfIngredient = request.form.get('name', '')
        nutriInfo = request.form.get('nutrinfo')
        unitsize = request.form.get('UnitSize')
        cursor = CONNECTION.cursor()
        sqlquer = "exec AddIngredient [" + str(nameOfIngredient) + "] , [" + str(nutriInfo) + "] , [" + str(unitsize) + "]"
        cursor.execute(sqlquer)
        CONNECTION.commit()

    cursor = CONNECTION.cursor()
    squery = "SELECT Stock.IngredientName, Quantity, Units, ExpirationDate " \
        "FROM Stock, Ingredient " \
        "WHERE Stock.IngredientName=Ingredient.IngredientName;"
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
    squery1 = ("SELECT * FROM Ingredient WHERE IngredientName=" + "'" + iname + "'")
    squery2 = ("SELECT * FROM Stock WHERE IngredientName=" + "'" + iname + "'")
    cursor.execute(squery1)
    result1 = cursor.fetchall()
    cursor.execute(squery2)
    result2 = cursor.fetchall()
    return render_template('Ingredient.html', info=result1[0],serial=result2)

if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=8080, debug=True)
