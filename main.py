from flask import Flask, request, render_template, jsonify
import pypyodbc

app = Flask(__name__)

connection = pypyodbc.connect('Driver={SQL Server};'
                              'Server=titan.csse.rose-hulman.edu;'
                              'Database=ICE_Project;'
                              'uid=guest;pwd=')


@app.route('/')
def hello_world():
    return render_template('Welcome.html')

# Might want to change the extensions to remove the .html tags


@app.route('/Menu.html')
def menu_page():
    return render_template('Menu.html')


@app.route('/OrderList.html')
def order_page():
    cursor = connection.cursor()
    squery = ("SELECT RecipeName, Price FROM Recipe")
    cursor.execute(squery)
    results = cursor.fetchone()
    return jsonify(results)


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
    app.run(host='0.0.0.0', port=8080, debug=True)
