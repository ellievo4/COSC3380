/*Thanh Vo & Seat #D9*/
/*COSC 3380   Fall 2016   Project 1*/
/*This is MY work*/
/*Will NOT disseminate*/

--Problem 2:
/*9 RELATIONS*/
/*Customer table*/
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
/*create the table Order*/
CREATE TABLE Orderr (
    orderr_id INTEGER CONSTRAINT Orderr_oid_pk PRIMARY KEY,
    cus_id INTEGER NOT NULL,
    orderr_date DATE,
    FOREIGN KEY (cus_id) REFERENCES customer(cus_id));

/*SaleTerritory table*/
/*create the table SaleTerritory*/
CREATE TABLE SaleTerritory (
    ter_id INTEGER CONSTRAINT SaleTerritory_terid_pk PRIMARY KEY,
    ter_name CHAR(30));
    
/*DoBusiness table*/
/*create the table DoBusiness*/
CREATE TABLE DoBusiness (
    cus_id INTEGER NOT NULL,
    ter_id INTEGER NOT NULL,
    PRIMARY KEY(cus_id, ter_id),
    FOREIGN KEY (cus_id) REFERENCES Customer(cus_id),
    FOREIGN KEY (ter_id) REFERENCES SaleTerritory(ter_id));    
	
/*SalePerson table*/
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
--/*create the table ProductLine*/	
CREATE TABLE ProductLine (
    prodline_id INTEGER CONSTRAINT ProductLine_plid_pk PRIMARY KEY ,
    prodline_name CHAR(20));

/*Product table*/
/*create the table Product*/
CREATE TABLE Product (
    prod_id INTEGER CONSTRAINT Product_prodid_pk PRIMARY KEY,
    prodline_id INTEGER NOT NULL,
    prod_name CHAR(20),
    prod_finish CHAR(10),
    prod_stdprice NUMBER,
    prod_photo CHAR(20),
    FOREIGN KEY (prodline_id) REFERENCES productline(prodline_id));

/*OrderLine table*/
/*create the table OrderLine*/
CREATE TABLE OrderLine (
    orderr_id INTEGER NOT NULL,
    prod_id INTEGER NOT NULL,
    quantity INTEGER,
    price NUMBER,
    PRIMARY KEY(orderr_id, prod_id),
    FOREIGN KEY(orderr_id) REFERENCES orderr(orderr_id),
    FOREIGN KEY(prod_id) REFERENCES product(prod_id));
    
/*drop then create price update table*/
CREATE TABLE PriceUpdate (
    prup_id INTEGER CONSTRAINT PriceUpdate_puid_pk PRIMARY KEY,
    prup_productname CHAR(20),
    prup_changedate DATE,
    prup_oldprice NUMBER,
    prup_newprice NUMBER
);

