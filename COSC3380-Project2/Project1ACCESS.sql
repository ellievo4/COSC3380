/*Thanh Vo & Seat #D9*/
/*COSC 3380   Fall 2016   Project 1*/
/*This is MY work*/
/*Will NOT disseminate*/

--Problem 2:
/*9 RELATIONS*/
/*Customer table*/
/*create the table Customer*/
CREATE TABLE Customer (
    CustomerID 			INTEGER CONSTRAINT Customer_cusid_pk PRIMARY KEY,
    CustomerName		CHAR(30),
    CustomerAddress		CHAR(60),
    CustomerCity		CHAR(20),
    CustomerState		CHAR(20),
    CustomerPostalCode	CHAR(5),
    CustomerEmail 		CHAR(20),
    CustomerUserName	CHAR(10),
    CustomerPassword	CHAR(10));
	
/*Order table*/
/*create the table Order*/
CREATE TABLE Orderr (
    OrderID INTEGER CONSTRAINT Orderr_oid_pk PRIMARY KEY,
    OrderDate DATE,
    CustomerID INTEGER NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID));

/*SaleTerritory table*/
/*create the table SaleTerritory*/
CREATE TABLE Territory (
    TerritoryID INTEGER CONSTRAINT SaleTerritory_terid_pk PRIMARY KEY,
    TerritoryName CHAR(30));
    
/*DoBusiness table*/
/*create the table DoBusiness*/
CREATE TABLE DoesBusinessIn (
    CustomerID INTEGER NOT NULL,
    TerritoryID INTEGER NOT NULL,
    PRIMARY KEY(CustomerID, TerritoryID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID));       
	
/*SalePerson table*/
/*create the table SalePerson*/
CREATE TABLE SalesPerson (
    SalespersonID INTEGER CONSTRAINT Saleperson_perid_pk PRIMARY KEY,
    SalespersonName CHAR(30),
    SalespersonPhone CHAR(10),
    SalespersonEmail CHAR(40),
    SalespersonUserName CHAR(15),
    SalespersonPassword CHAR(15),
    TerritoryID INTEGER NOT NULL,
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID));
	

/*ProductLine table*/
--/*create the table ProductLine*/	
CREATE TABLE ProductLine (
    ProductLineID INTEGER CONSTRAINT ProductLine_plid_pk PRIMARY KEY ,
    ProductLineName CHAR(20));

/*Product table*/
/*create the table Product*/
CREATE TABLE Product (
    ProductID INTEGER CONSTRAINT Product_prodid_pk PRIMARY KEY,
    ProductName CHAR(20),
    ProductFinish CHAR(20),
    ProductStandardPrice INTEGER,
    ProductLineID INTEGER NOT NULL,
    Photo CHAR(10),
    FOREIGN KEY (ProductLineID) REFERENCES productline(ProductLineID));

/*OrderLine table*/
/*create the table OrderLine*/
CREATE TABLE OrderLine (
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    OrderedQuantity INTEGER,
    SalePrice INTEGER,
    PRIMARY KEY(OrderID, ProductID),
    FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID),
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID));
    
/*drop then create price update table*/
CREATE TABLE PriceUpdate (
    PriceUpdateID INTEGER CONSTRAINT PriceUpdate_puid_pk PRIMARY KEY,
    DateChanged DATE,
    OldPrice INTEGER,
    NewPrice INTEGER
);

