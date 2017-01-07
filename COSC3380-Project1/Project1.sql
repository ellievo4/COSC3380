/*Thanh Vo & Seat #D9*/
/*COSC 3380   Fall 2016   Project 1*/
/*This is MY work*/
/*Will NOT disseminate*/

--Problem 2:
/*9 RELATIONS*/
/*Customer table*/
/*drop table with cascade constraint*/
DROP TABLE Customer CASCADE CONSTRAINTS;
/*create the table Customer*/
CREATE TABLE Customer (
    cus_id 			INTEGER CONSTRAINT Customer_cusid_pk PRIMARY KEY,
    cus_name		CHAR(30),
    cus_address		CHAR(60),
    cus_city		CHAR(20),
    cus_state		CHAR(20),
    cus_postalcode	CHAR(5),
    cus_email 		CHAR(20),
    cus_username	CHAR(10),
    cus_pass		CHAR(10));
	
/*Order table*/
/*drop table with cascade constraint*/
DROP TABLE Orderr CASCADE CONSTRAINTS;
/*create the table Order*/
CREATE TABLE Orderr (
    orderr_id INTEGER CONSTRAINT Orderr_oid_pk PRIMARY KEY,
    cus_id INTEGER NOT NULL,
    orderr_date DATE,
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id));

/*SaleTerritory table*/
/*drop table with cascade constraint*/
DROP TABLE SaleTerritory CASCADE CONSTRAINTS;
/*create the table SaleTerritory*/
CREATE TABLE SaleTerritory (
    ter_id INTEGER CONSTRAINT SaleTerritory_terid_pk PRIMARY KEY,
    ter_name CHAR(30));
    
/*DoBusiness table*/
/*drop table with cascade constraint*/
DROP TABLE DoBusiness CASCADE CONSTRAINTS;
/*create the table DoBusiness*/
CREATE TABLE DoBusiness (
    cus_id INTEGER NOT NULL,
    ter_id INTEGER NOT NULL,
    PRIMARY KEY(cus_id, ter_id),
    FOREIGN KEY (cus_id) REFERENCES Customer(cus_id),
    FOREIGN KEY (ter_id) REFERENCES SaleTerritory(ter_id));    
	
/*SalePerson table*/
/*drop table with cascade constraint*/
DROP TABLE SalePerson CASCADE CONSTRAINTS;
/*create the table SalePerson*/
CREATE TABLE SalePerson (
    per_id INTEGER CONSTRAINT Saleperson_perid_pk PRIMARY KEY,
    ter_id INTEGER NOT NULL,
    per_name CHAR(60),
    per_tel CHAR(10),
    per_email CHAR(30),
    per_user CHAR(10),
    per_pass CHAR(10),
    FOREIGN KEY (ter_id) REFERENCES saleterritory(ter_id));
	

/*ProductLine table*/
/*drop table with cascade constraint*/
DROP TABLE ProductLine CASCADE CONSTRAINTS;
--/*create the table ProductLine*/	
CREATE TABLE ProductLine (
    prodline_id INTEGER CONSTRAINT ProductLine_plid_pk PRIMARY KEY ,
    prodline_name CHAR(20));

/*Product table*/
/*drop table with cascade constraint*/
DROP TABLE Product CASCADE CONSTRAINTS;
/*create the table Product*/
CREATE TABLE Product (
    prod_id INTEGER CONSTRAINT Product_prodid_pk PRIMARY KEY,
    prodline_id INTEGER NOT NULL,
    prod_name CHAR(20),
    prod_finish CHAR(10),
    prod_stdprice DECIMAL(10,2),
    prod_photo CHAR(20),
    FOREIGN KEY (prodline_id) REFERENCES productline(prodline_id));

/*OrderLine table*/
/*drop table with cascade constraint*/
DROP TABLE OrderLine CASCADE CONSTRAINTS;
/*create the table OrderLine*/
CREATE TABLE OrderLine (
    orderr_id INTEGER NOT NULL,
    prod_id INTEGER NOT NULL,
    quantity INTEGER,
    price DECIMAL(10,2),
    PRIMARY KEY(orderr_id, prod_id),
    FOREIGN KEY(orderr_id) REFERENCES orderr(orderr_id),
    FOREIGN KEY(prod_id) REFERENCES product(prod_id));
    
/*drop then create price update table*/
DROP TABLE PriceUpdate;
CREATE TABLE PriceUpdate (
    prup_id INTEGER CONSTRAINT PriceUpdate_puid_pk PRIMARY KEY,
    prup_productname CHAR(20),
    prup_changedate DATE,
    prup_oldprice DECIMAL(10,2),
    prup_newprice DECIMAL(10,2)
);
	
/*6 VIEWS*/
/*Product Line Sales Comparison REPORT*/
/*drop view for Product Line Sales Comparison REPORT*/
DROP VIEW Product_Line_Sales_Comparison;
/*create view for Product Line Sales Comparison REPORT*/
CREATE VIEW Product_Line_Sales_Comparison AS
  SELECT PL.prodline_id, PR.prod_id, PR.prod_name, SUM(OL.quantity) AS sumquantity
  FROM Product PR 
  JOIN ProductLine PL ON (PR.prodline_id = PL.prodline_id) 
  JOIN OrderLine OL ON (PR.prod_id = OL.prod_id)
  GROUP BY PL.prodline_id, PR.prod_id, PR.prod_name;
  
/*Total Value for Products REPORT*/
/*drop view for Total Value for Products REPORT*/
DROP VIEW Total_Value_for_Products;
/*create view for Total Value for Products REPORT*/
CREATE VIEW Total_Value_for_Products AS
  SELECT O.orderr_id, PR.prod_id, PR.prod_name, SUM(OL.price) AS sumprice
  FROM OrderLine OL 
  JOIN Orderr O ON (OL.orderr_id = O.orderr_id) 
  JOIN Product PR ON (OL.prod_id = PR.prod_id)
  GROUP BY O.orderr_id, PR.prod_id, PR.prod_name;
  
  
/*Data for Customer REPORT*/
/*drop view for Data for Customer REPORT*/
DROP VIEW Data_for_Customer;
/*create view for Data for Customer REPORT*/
CREATE VIEW Data_for_Customer AS
  SELECT ST.ter_id, PR.prod_id, PR.prod_stdprice
  FROM SaleTerritory ST, Customer CU, Orderr O, OrderLine OL, Product PR, DoBusiness DB
  WHERE ST.ter_id = DB.ter_id AND DB.cus_id = CU.cus_id AND CU.cus_id = O.cus_id AND O.orderr_id = OL.orderr_id AND OL.prod_id = PR.prod_id;
  
/*Customer by States Shipment REPORT*/
/*drop view for Customer by States Shipment REPORT*/
DROP VIEW Customer_by_States_Shipment;
/*create view for Customer by States Shipment REPORT*/
CREATE VIEW Customer_by_States_Shipment AS
  SELECT COUNT(cus_id) AS customercount, cus_address, cus_city, cus_state
  FROM Customer
  GROUP BY cus_address, cus_city, cus_state;
  
/*Past Purchase History REPORT*/
/*drop view for Past Purchase History REPORT*/
DROP VIEW Past_Purchase_History;
/*create view for Past Purchase History REPORT*/
CREATE VIEW Past_Purchase_History AS
  SELECT O.orderr_id, O.orderr_date, OL.quantity, PR.prod_name, PR.prod_stdprice
  FROM OrderLine OL 
  JOIN Orderr O ON (OL.orderr_id = O.orderr_id) 
  JOIN Product PR ON (OL.prod_id = PR.prod_id);
  
/*Product Manager Support*/
/*drop view for Product Manager Support*/
DROP VIEW Product_Manager_Support;
/*create view for Product Manager Support*/
CREATE VIEW Product_Manager_Support AS
  SELECT Cu.cus_id, Cu.cus_name, Cu.cus_postalcode, Pr.prod_id, Pr.prod_name, Pr.prod_finish, Pr.prod_stdprice, Pr.prodline_id, Pl.prodline_name,
          O.orderr_id, O.orderr_date, O.cus_id orderredCustomerid, Ol.orderr_id orderlineOrderid, Ol.prod_id orderlineProdid, Ol.quantity
  FROM Customer Cu, Product Pr, ProductLine Pl, Orderr O, OrderLine Ol
  WHERE (Cu.cus_id = O.cus_id) AND (O.orderr_id = Ol.orderr_id) AND (Ol.prod_id = Pr.prod_id) AND (Pr.prodline_id = Pl.prodline_id);
  
/*1 TRIGGER*/
/*write the trigger StandardPriceUpdate*/
/*Event: E3: Product – A4: prod_stdprice  on UPDATE
Condition: E3: Product – A4: prod_stdprice is updated
Action:  Entering E1: PriceUpdate – A1: prup_productname
						    E1: PriceUpdate – A2: prup_changedate
						    E1: PriceUpdate – A3: prup_oldprice
						    E1: PriceUpdate – A4: prup_newprice
*/
CREATE OR REPLACE TRIGGER StandardPriceUpdate AFTER UPDATE ON Product
  FOR EACH ROW
  BEGIN
    INSERT INTO PriceUpdate(prup_id,prup_productname,prup_changedate,prup_oldprice,prup_newprice) 
      VALUES (1, NULL, NULL, 0.00, 0.00);
END;


    
	
	