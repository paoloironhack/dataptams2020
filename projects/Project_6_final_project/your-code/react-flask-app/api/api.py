from flask import Flask, jsonify, request, json
from flask_mysqldb import MySQL
from datetime import datetime
from flask_cors import CORS
from flask_bcrypt import Bcrypt
from flask_jwt_extended import JWTManager, create_access_token

from keras.models import load_model
import pandas as pd
import numpy as np

app = Flask(__name__)

app.config['MYSQL_USER'] = 'XXX'
app.config['MYSQL_PASSWORD'] = 'XXX'
app.config['MYSQL_DB'] = 'XXX'
app.config['MYSQL_HOST'] = 'XXX'

app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
app.config['JWT_SECRET_KEY'] = 'secret'
model = load_model('recommender_model_s3.h5')

mysql = MySQL(app)
bcrypt = Bcrypt(app)
jwt = JWTManager(app)
CORS(app)

@app.route('/user/register', methods=['POST'])
def register():
    cur = mysql.connection.cursor()
    first_name = request.get_json()['first_name']
    last_name = request.get_json()['last_name']
    email = request.get_json()['email']
    password = bcrypt.generate_password_hash(request.get_json()['password']).decode('utf-8')
    created = datetime.utcnow()

    query = ( 
        f"INSERT INTO user (first_name, last_name, email, password, created) VALUES ("
        f"'{str(first_name)}',"
        f"'{str(last_name)}',"
        f"'{str(email)}',"
        f"'{str(password)}',"
        f"'{str(created)}')"
    )

    try:
        cur.execute(query)
    except Exception as e:
        return 'e'

    mysql.connection.commit()

    result = {
        "first_name" : first_name,
        "last_name" : last_name,
        "email" : email,
        "password" : password,
        "created" : created,
    }

    return {'result': result}

@app.route('/user/login', methods=['POST'])
def login():
    cur = mysql.connection.cursor()
    email = request.get_json()['email']
    password = request.get_json()['password']
    query = f"SELECT * FROM user WHERE email = '{str(email)}'"
    
    cur.execute(query)
    rv = cur.fetchone()

    result = {"error": "Invalid username and password"}
    if rv is None:
        return result

    if bcrypt.check_password_hash(rv['password'], password):
        access_token = create_access_token(identity = {'first_name': rv['first_name'], 'last_name': rv['last_name'], 'email': rv['email']})
        result =  {'token': access_token}

    return result

@app.route('/ratings', methods=['GET'])
def ratings():
    user_email = request.args.get('user_email');
    cur = mysql.connection.cursor()

    query = (
        f"SELECT rating.*, book.title, book.small_image_url, book.original_publication_year FROM user "
        f"LEFT JOIN rating on user.id = rating.user_id "
        f"LEFT JOIN book on rating.book_id = book.id "
        f"WHERE user.email = '{user_email}'"
    )
    cur.execute(query)

    # rv = cur.fetchone()
    rv = cur.fetchall()

    return jsonify(rv)


@app.route('/recommendations', methods=['GET'])
def recommendations():
    user_email = request.args.get('user_email');

    cur = mysql.connection.cursor()
    query = f"SELECT * FROM user WHERE email = '{str(user_email)}'"

    cur.execute(query)
    user_id = cur.fetchone()['id']

    query = f"SELECT id FROM book"
    cur.execute(query)
    books_tups = cur.fetchall()
    books_list = np.array([dic['id'] for dic in books_tups])
    user = np.array([user_id for i in range(len(books_list))])
    predictions = model.predict([user, books_list])
    predictions = np.array([a[0] for a in predictions])
    recommended_books_ids = (-predictions).argsort()[:9]

    query = "SELECT id, title, authors, original_publication_year, image_url FROM book WHERE id IN ("
    for book_id in recommended_books_ids:
        query = query + str(book_id) + ', '
    query = query[:-2] + ')'
    
    cur.execute(query)
    books_recommendation = cur.fetchall()

    return jsonify(books_recommendation)

@app.route('/book/<int:book_id>', methods=['GET'])
def book(book_id):
    user_email = request.args.get('user_email');
    cur = mysql.connection.cursor()

    query = (
        f"SELECT book.*, tab.rating from book "
        f"LEFT JOIN (SELECT * FROM rating LEFT JOIN user ON rating.user_id = user.id where user.email='{user_email}') AS `tab` ON book.id = tab.book_id "
        f"WHERE book.id={book_id}"
    )
    cur.execute(query)
    rv = cur.fetchone()
    return rv

@app.route('/books', methods=['GET'])
def books():

    cur = mysql.connection.cursor()

    query = "SELECT id, title FROM book"
    cur.execute(query)
    rv = cur.fetchall()
 
    return jsonify(rv)

@app.route('/book/rate', methods=['POST'])
def rate():
    cur = mysql.connection.cursor()
    book_id = request.get_json()['book_id']
    email = request.get_json()['email']
    rating = request.get_json()['rating']

    query = f"SELECT id FROM user WHERE email='{email}'"
    cur.execute(query)
    user = cur.fetchone()

    query = ( 
        f"INSERT INTO rating (book_id, user_id, rating) VALUES ("
        f"{int(book_id)}, "
        f"{int(user['id'])}, "
        f"{int(rating)})"
    )
    cur.execute(query)
    rv = cur.fetchone()
    mysql.connection.commit()

    return {'result': 'yeah'}


if __name__ == '__main__':
    app.run(debug=True)