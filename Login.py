from flask import Flask, render_template, request, redirect, url_for, make_response
from itsdangerous import URLSafeTimedSerializer
import mysql.connector
import yaml

app = Flask(__name__)
app.config['SECRET_KEY'] = 'Admin'  # Replace with a real secret key

# Load database configuration from the YAML file
with open('loginconfig.yml', 'r') as yaml_file:
    db_config = yaml.safe_load(yaml_file)

# Establish the database connection
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

@app.route('/')
def index():
    return render_template('login.html')

@app.route('/login', methods=['POST'])
def login():
    # Get user input from the login form
    username = request.form['username']
    password = request.form['password']

    # Execute a query to fetch user details from the database
    query = "SELECT * FROM users WHERE username = %s AND password = %s"
    cursor.execute(query, (username, password))
    user = cursor.fetchone()

    if user:
        # Authentication successful, generate token
        serializer = URLSafeTimedSerializer(app.config['SECRET_KEY'])
        token = serializer.dumps({'user_id': user[0]})  # Assuming user[0] is the user_id

        # Redirect to the video page with token as a cookie
        response = make_response(redirect('http://34.204.151.147:8080'))
        response.set_cookie('auth_token', token)
        return response
    else:
        # Authentication failed
        return "Login failed"

if __name__ == '__main__':
    app.run(debug=True)
