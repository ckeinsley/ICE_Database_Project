import flask
import pypyodbc

app=Flask(__name__)

connection = pypyodbc.connect('Driver={SQL Server};'
							  'Server=boilermake.database.windows.net;'
							  'Database=Python Web Talk;'
							  'uid=Boilermake;pwd=IvoryHacks2017')

@app.route('/')
def hello_world():
	return 'Hello World!'

@app.route('/movie/<int:movie_id>',method=['GET'])
def get_movie(movie_id):
	cursor=connection.cursor()
	SQLCommand=("SELECT Title, Year, Rated from Movies"
				"WHERE Id=?")
	Values=[movie_id]
	cursor.execute(SQLCommand,Values)
	results=cursor.fetchone()
	flask.json.jsonify(results)

if__name__=='__main__':
	app.run(host='0.0.0.0',port=8000,debug=True)