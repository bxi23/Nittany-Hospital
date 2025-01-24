--SQL TABLE DECLARATIONS NITTANY MARKET
/* Table will be entered in hierachical structure*/

--Local_Vendors -
CREATE TABLE Local_Vendors(
	email TEXT,
	Business_Name TEXT,
	Buisness_Account_ID TEXT,
	Customer_Service_Number TEXT,
	PRIMARY KEY(email));

 --Buyers Table - imports data from Users,Adress table
 CREATE TABLE Buyers(
 	email TEXT,
 	first_name TEXT,
 	last_name TEXT, 
 	gender TEXT, 
 	age int,
 	home_address_id TEXT,
 	billing_address_id TEXT,
 	PRIMARY KEY(email));
 	
--Address Table - NF
CREATE TABLE Address(
	address_id TEXT,
	zipcode int,
	street_num int,
	street_name TEXT,
	PRIMARY KEY(address_id));

--Credit Card - Nf
CREATE TABLE Credit_Cards(
	credit_card_num TEXT,
	card_code int,
	expire_month int,
	expire_year int,
	card_type TEXT,
	Owner_email TEXT,
	PRIMARY KEY(credit_card_num));

--Categories Table - NF
CREATE TABLE Categories(
	parent_category TEXT,
	category_name TEXT,
	PRIMARY KEY(parent_category, category_name));


 --Orders Table
 CREATE TABLE Orders(
 	Transaction_ID int,
 	Seller_Email TEXT,
 	Listing_ID int, 
 	buyer_email TEXT,
 	date TEXT,
 	quantity int,
 	payment int,
 	PRIMARY KEY(Transaction_ID));

 --Product Listing Table
 CREATE TABLE Product_Listing(
 	Seller_Email TEXT,
 	Listing_ID int,
 	Category TEXT,
 	Title TEXT,
 	Product_Name TEXT,
 	Product_Description TEXT,
 	Price TEXT,
 	Quantity int,
 	PRIMARY KEY(Listing_ID));

 --Ratings Table
 CREATE TABLE Ratings(
 	Buyer_Email TEXT,
 	Seller_Email TEXT,
 	Date TEXT,
 	Rating int,
 	Rating_Desc TEXT,
 	PRIMARY KEY(Buyer_Email, Seller_Email,Date);

 --Reviews Table
 CREATE TABLE Reviews(
 	Buyer_Email TEXT,
 	Seller_Email TEXT,
 	Listing_ID int,
 	Review_Desc TEXT,
 	PRIMARY KEY(Buyer_Email, Seller_Email));

 --Sellers Table
 CREATE TABLE Sellers(
 	email TEXT,
 	routing_number TEXT,
 	account_number int,
 	balance int,
 	PRIMARY KEY(email));

 --Users Table
 CREATE TABLE Users(
 	email TEXT,
 	password TEXT,
 	PRIMARY KEY(email));

 --ZipCode_Info Table
 CREATE TABLE Zipcode_Info(
 	zipcode int,
 	city TEXT,
 	state_id TEXT,
 	population int,
 	density DOUBLE,
 	county_name TEXT,
 	timezone TEXT,
 	PRIMARY Key(zipcode));