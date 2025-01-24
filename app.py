from flask import Flask, render_template, request, redirect, url_for
import sqlite3 as sql

#https://flask.palletsprojects.com/en/2.0.x/
#https://www.tutorialspoint.com/python_data_access/python_sqlite_cursor_object.htm
#https://www.w3schools.com/html/html_attributes.asp
# remeber to create database if not already created

app = Flask(__name__)

host = 'http://127.0.0.1:5000/'

@app.route('/')
def hello_world():  # put application's code here
    return render_template('home.html')

#login page --------------------------------
@app.route('/login', methods=['POST'])
def login_submission():
    error = None
    email = request.form['email_entry']
    password = request.form['password_entry']
    valid =login_validation(email, password)
    if valid:
        #may have security concerns, 'session' may be solution || redirect(url_for('buyers_page', email=email))
        return buyers_page(email)
    else:
        # sets failed status of html
        return render_template('login.html', f_status = 1)

@app.route('/login', methods=['GET'])
def login_render():
    #renders page with failed status as 0
    return render_template('login.html', f_status = 0)

@app.route('/buyer', methods=["GET" ,"POST"])
def buyers_page(email):
    list_result = intial_listings()
    parent_cat = fetch_parent_categories()
    #request.form(p_cat_select)

    return render_template('buyer_home.html', list_result = list_result, p_cats = parent_cat)

#proccess instruction functions -------------------
def login_validation(email, password):
    connection = sql.connect('NM_database.db')
    connection.execute('CREATE TABLE IF NOT EXISTS users(email TEXT, password TEXT, PRIMARY KEY(email));')
    #get the correct password
    #remember [] , sqlite fetch commands , tuple index
    cor_pas = connection.execute('SELECT password FROM users WHERE email = ?;', [email] ).fetchone()
    if cor_pas != None: #index the password from the tuple object
        cor_pas= cor_pas[0]
    if cor_pas == password:
        return 1
    else:
        return 0

def intial_listings():
    connection = sql.connect('NM_database.db')
    cursor = connection.execute('SELECT Title,Product_Name,Product_Description,Price,Quantity  FROM Product_Listing;')
    return cursor.fetchall()

def fetch_parent_categories():
    connection = sql.connect('NM_database.db')
    cursor = connection.execute('SELECT parent_category  FROM Categories;')
    return cursor.fetchall()

#def order_listings






if __name__ == '__main__':
    app.run()
