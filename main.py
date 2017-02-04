from flask import Flask, request, render_template, jsonify
import pypyodbc

APP = Flask(__name__)

CONNECTION = pypyodbc.connect('Driver={SQL Server}; Server=titan.csse.rose-hulman.edu;'
                              'Database=ICE_Project; Uid=keinslc; Pwd=Vallion11')


@APP.route('/')
@APP.route('/Welcome.html')
def hello_world():
    return render_template('Welcome.html')

# Might want to change the extensions to remove the .html tags


@APP.route('/Menu')
def menu_page():
    return render_template('Menu.html')

#-----ORDERS------#

@APP.route('/OrderList')
def orderList_page():
    cursor = CONNECTION.cursor()
    squery = ("SELECT * FROM Recipe")
    cursor.execute(squery)
    results = cursor.fetchone()
    return jsonify(results)
    # return render_template("OrderList.html")

@APP.route('/Order')
def order_page():
    return render_template('Order.html')

#-----CUSTOMERS----------#
@APP.route('/CustomerList')
def customerList_page():
    return render_template("CustomerList.html")

@APP.route('/Customer')
def customer_page():
    return render_template('Customer.html')

#-------INGREDIENTS----------#
@APP.route('/IngredientList')
def ingredientList_page():
    return render_template('IngredientList.html')

@APP.route('/Ingredient')
def ingredient_page():
    return render_template('Ingredient.html')





# @app.route('/movie/<int:movie_id>', method=['GET'])
# def get_movie(movie_id):
    # cursor = connection.cursor()
    # SQLCommand = ("SELECT Title, Year, Rated from Movies"
    #   "WHERE Id=?")
    # Values = [movie_id]
    # cursor.execute(SQLCommand, Values)
    # results = cursor.fetchone()
    # flask.json.jsonify(results)
if __name__ == "__main__":
    APP.run(host='0.0.0.0', port=8080, debug=True)
