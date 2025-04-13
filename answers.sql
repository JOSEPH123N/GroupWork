

--Quetione 1 
create database bookstoredata;


 --Quetion 2/All the Tables 
 --Table 1 
 use bookstoredata; 
 create table book ( book_id INT auto_increment primary KEY, title varchar (255), isbn varchar(20), publisher_id int, language_id int, price decimal(10,2), publication_year Int );
 
 
  --Table 2 
use bookstoredata; 
create table book_author( book_id int, author_id int, PRIMARY KEY(book_id,author_id) );

  
 --Table 3 
CREATE TABLE author ( author_id INT AUTO_INCREMENT PRIMARY KEY, first_name VARCHAR(100), last_name VARCHAR(100) );

   
 --Table 4 
use bookstoredata; 
    
create table book_language( language_id int auto_increment PRIMARY KEY, language_name varchar(100) ); 


--Table 5
 use bookstoredata; 
create table publisher( publisher_id int auto_increment PRIMARY KEY, name varchar (255), country_id int ); 


--Table 6
use bookstoredata;
create table customer( customer_id int auto_increment PRIMARY KEY, first_name varchar(100), last_name varchar(100), email varchar (150), phone varchar (20) ); 
 


--Table 7 
use bookstoredata;
create table customer_address( customer_id int, address_id int, status_id int, PRIMARY KEY(customer_id ,address_id) ); 

--Table 8 
use bookstoredata;
create table address( address_id int auto_increment PRIMARY KEY, street varchar(100), city varchar(100), postal_code varchar (20),  country_id int );

--Table 9 
use bookstoredata; 
create table address_status( status_id int auto_increment PRIMARY KEY, status_name varchar (100) ); 

--Table 10 
use bookstoredata; 
create table country( country_id int auto_increment PRIMARY KEY, country_name varchar (100) ); 

--Table 11 
use bookstoredata; 
create table cust_order( order_id int auto_increment PRIMARY KEY, customer_id int, order_date date, shipping_method_id int, order_status_id int ); 



--Table 12 
use bookstoredata;
CREATE TABLE order_line ( order_line_id INT AUTO_INCREMENT PRIMARY KEY, order_id INT, book_id INT, quantity INT, unit_price DECIMAL(10,2), FOREIGN KEY (order_id) REFERENCES cust_order(order_id), FOREIGN KEY (book_id) REFERENCES book(book_id) ); 


--TABLE 13 
use bookstoredata; 
create table shipping_method( method_id int auto_increment PRIMARY KEY , method_name varchar (100), delivery_time varchar (100) ); 


--Table 14 
use bookstoredata; 
create table order_status( status_id int auto_increment PRIMARY KEY, status_name varchar (50) ); 



--Table 15
use bookstoredata; 
create table order_history( history_id int auto_increment PRIMARY KEY, order_id int, status_id int, change_date DATETIME ); 


--Question 3 
--CREATING FOREIGN KEYS
 --FOREIGN KEY 1 
 ALTER TABLE order_history ADD FOREIGN KEY (order_id) REFERENCES cust_order(order_id), ADD FOREIGN KEY (status_id) REFERENCES order_status(status_id);
 


  --FORIEGNY KEY 2 
ALTER TABLE cust_order ADD FOREIGN KEY (order_id) REFERENCES cust_order(order_id), ADD FOREIGN KEY (status_id) REFERENCES order_status(status_id);
 

--FOREIGN KEY KEY 3 
ALTER TABLE orderline ADD FOREIGN KEY (order_id) REFERENCES cust_order(order_id), ADD FOREIGN KEY (book_id) REFERENCES book(book_id);
 

--FOREIGN KEY 4 
ALTER TABLE address ADD FOREIGN KEY (country_id) REFERENCES country(country_id);
 


--FOREIGN KEY 5
 ALTER TABLE customer_address ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id), ADD FOREIGN KEY (address_id) REFERENCES address(address_id), ADD FOREIGN KEY (status_id) REFERENCES address_status(status_id);
  

--FOREIGN KEY 6
ALTER TABLE publisher ADD FOREIGN KEY (country_id) REFERENCES country (country_id);
   

 --FOREIGN KEY 7 
ALTER TABLE book_author ADD FOREIGN KEY (book_id) REFERENCES book(book_id), ADD FOREIGN KEY (author_id) REFERENCES author (author_id) 
   
--FOREIGN KEY 8 
ALTER TABLE book ADD FOREIGN KEY (publisher_id)REFERENCES publisher(publisher_id), ADD FOREIGN KEY (language_id) REFERENCES book_language(language_id) 
   

--QUESTION 4
-- Created roles for different levels of access CREATE ROLE manager; 
CREATE ROLE sales; CREATE ROLE viewer;


--QUESTION 5 
 SELECT order_id, .status_name, .change_date FROM order_history JOIN order_status status_id = status_id ORDER BY .change_date DESC;
