from flask import Flask, request, render_template, jsonify
import pypyodbc

APP = Flask(__name__)

#TODO fix password in SQL SERVER
CONNECTION = pypyodbc.connect('Driver={SQL Server}; Server=titan.csse.rose-hulman.edu;'
                              'Database=ICE_Project; Uid=introvertGuest; Pwd=introvertPassword')


@APP.route('/')
@APP.route('/Welcome')
def hello_world():
    return render_template('Welcome.html')

@APP.route('/Menu')
def menu_page():
    return render_template('Menu.html')

#-----ORDERS------#
@APP.route('/OrderList')
def orderList_page():
    return render_template("OrderList.html")

@APP.route('/Order')
def order_page():
    return render_template('Order.html')

#-----CUSTOMERS----------#
@APP.route('/CustomerList')
def customerList_page():
    return render_template("CustomerList.html")

@APP.route('/Customer')
def customer_page():
    cursor = CONNECTION.cursor()
    squery = ("SELECT Username FROM Account")
    cursor.execute(squery)
    results = cursor.fetchone()
    mystring = ''.join(map(str, results))
    return mystring
    # return render_template('Customer.html', customer=results)

#-------INGREDIENTS----------#
@APP.route('/IngredientList')
def ingredientList_page():
    return render_template('IngredientList.html')

@APP.route('/Ingredient')
def ingredient_page():
    return render_template('Ingredient.html')

if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=8080, debug=True)
