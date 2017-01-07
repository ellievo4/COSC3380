/*Thanh Vo & Seat #D9*/
/*COSC 3380   Fall 2016   Project 1*/
/*This is MY work*/
/*Will NOT disseminate*/

--Problem 2:
/*9 RELATIONS*/
/*Customer table*/
/*drop table with cascade constraint*/
DROP TABLE Customer CASCADE CONSTRAINTS PURGE;
/*create the table Customer*/
CREATE TABLE Customer (
    CustomerID 			INTEGER CONSTRAINT Customer_cusid_pk PRIMARY KEY,
    CustomerName		CHAR(40),
    CustomerAddress		CHAR(60),
    CustomerCity		CHAR(20),
    CustomerState		CHAR(2),
    CustomerPostalCode	CHAR(10),
    CustomerEmail 		CHAR(40),
    CustomerUserName	CHAR(15),
    CustomerPassword		CHAR(15));
	
/*Order table*/
/*drop table with cascade constraint*/
DROP TABLE Orderr CASCADE CONSTRAINTS PURGE;
/*create the table Order*/
CREATE TABLE Orderr (
    OrderID INTEGER CONSTRAINT Orderr_oid_pk PRIMARY KEY,
    OrderDate DATE,
    CustomerID INTEGER NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID));

/*Territory table*/
/*drop table with cascade constraint*/
DROP TABLE Territory CASCADE CONSTRAINTS PURGE;
/*create the table Territory*/
CREATE TABLE Territory (
    TerritoryID INTEGER CONSTRAINT SaleTerritory_terid_pk PRIMARY KEY,
    TerritoryName CHAR(30));
    
/*DoesBusinessIn table*/
/*drop table with cascade constraint*/
DROP TABLE DoesBusinessIn CASCADE CONSTRAINTS PURGE;
/*create the table DoesBusinessIn*/
CREATE TABLE DoesBusinessIn (
    CustomerID INTEGER NOT NULL,
    TerritoryID INTEGER NOT NULL,
    PRIMARY KEY(CustomerID, TerritoryID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID));    
	
/*SalesPerson table*/
/*drop table with cascade constraint*/
DROP TABLE SalesPerson CASCADE CONSTRAINTS PURGE;
/*create the table SalesPerson*/
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
/*drop table with cascade constraint*/
DROP TABLE ProductLine CASCADE CONSTRAINTS PURGE;
--/*create the table ProductLine*/	
CREATE TABLE ProductLine (
    ProductLineID INTEGER CONSTRAINT ProductLine_plid_pk PRIMARY KEY ,
    ProductLineName CHAR(20));

/*Product table*/
/*drop table with cascade constraint*/
DROP TABLE Product CASCADE CONSTRAINTS PURGE;
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
/*drop table with cascade constraint*/
DROP TABLE OrderLine CASCADE CONSTRAINTS PURGE;
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
DROP TABLE PriceUpdate;
CREATE TABLE PriceUpdate (
    PriceUpdateID INTEGER CONSTRAINT PriceUpdate_puid_pk PRIMARY KEY,
    DateChanged DATE,
    OldPrice INTEGER,
    NewPrice INTEGER
);
	
/*6 VIEWS*/
/*Product Line Sales Comparison REPORT*/
/*drop view for Product Line Sales Comparison REPORT*/
DROP VIEW Product_Line_Sales_Comparison;
/*create view for Product Line Sales Comparison REPORT*/
CREATE VIEW Product_Line_Sales_Comparison AS
  SELECT PL.ProductLineID, PR.ProductID, PR.ProductName, SUM(OL.OrderedQuantity) AS sumquantity
  FROM Product PR 
  JOIN ProductLine PL ON (PR.ProductLineID = PL.ProductLineID) 
  JOIN OrderLine OL ON (PR.ProductID = OL.ProductID)
  GROUP BY PL.ProductLineID, PR.ProductID, PR.ProductName;
  
/*Total Value for Products REPORT*/
/*drop view for Total Value for Products REPORT*/
DROP VIEW Total_Value_for_Products;
/*create view for Total Value for Products REPORT*/
CREATE VIEW Total_Value_for_Products AS
  SELECT O.OrderID, PR.ProductID, PR.ProductName, SUM(OL.SalePrice) AS sumprice
  FROM OrderLine OL 
  JOIN Orderr O ON (OL.OrderID = O.OrderID) 
  JOIN Product PR ON (OL.ProductID = PR.ProductID)
  GROUP BY O.OrderID, PR.ProductID, PR.ProductName;
  
  
/*Data for Customer REPORT*/
/*drop view for Data for Customer REPORT*/
DROP VIEW Data_for_Customer;
/*create view for Data for Customer REPORT*/
CREATE VIEW Data_for_Customer AS
  SELECT ST.TerritoryID, PR.ProductID, PR.ProductStandardPrice
  FROM Territory ST, Customer CU, Orderr O, OrderLine OL, Product PR, DoesBusinessIn DB
  WHERE ST.TerritoryID = DB.TerritoryID AND DB.CustomerID = CU.CustomerID 
    AND CU.CustomerID = O.CustomerID AND O.OrderID = OL.OrderID AND OL.ProductID = PR.ProductID;
  
/*Customer by States Shipment REPORT*/
/*drop view for Customer by States Shipment REPORT*/
DROP VIEW Customer_by_States_Shipment;
/*create view for Customer by States Shipment REPORT*/
CREATE VIEW Customer_by_States_Shipment AS
  SELECT COUNT(CustomerID) AS customercount, CustomerAddress, CustomerCity, CustomerState
  FROM Customer
  GROUP BY CustomerAddress, CustomerCity, CustomerState;
  
/*Past Purchase History REPORT*/
/*drop view for Past Purchase History REPORT*/
DROP VIEW Past_Purchase_History;
/*create view for Past Purchase History REPORT*/
CREATE VIEW Past_Purchase_History AS
  SELECT O.OrderID, O.OrderDate, OL.OrderedQuantity, PR.ProductName, PR.ProductStandardPrice
  FROM OrderLine OL 
  JOIN Orderr O ON (OL.OrderID = O.OrderID) 
  JOIN Product PR ON (OL.ProductID = PR.ProductID);
  
/*Product Manager Support*/
/*drop view for Product Manager Support*/
DROP VIEW Product_Manager_Support;
/*create view for Product Manager Support*/
CREATE VIEW Product_Manager_Support AS
  SELECT Cu.CustomerID, Cu.CustomerName, Cu.CustomerPostalCode, Pr.ProductID, Pr.ProductName, Pr.ProductFinish, Pr.ProductStandardPrice, 
          Pr.ProductLineID, Pl.ProductLineName, O.OrderID, O.OrderDate, O.CustomerID orderredCustomerid, Ol.OrderID orderlineOrderid, 
          Ol.ProductID orderlineProdid, Ol.OrderedQuantity
  FROM Customer Cu, Product Pr, ProductLine Pl, Orderr O, OrderLine Ol
  WHERE (Cu.CustomerID = O.CustomerID) AND (O.OrderID = Ol.OrderID) AND (Ol.ProductID = Pr.ProductID) AND (Pr.ProductLineID = Pl.ProductLineID);
  
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
    INSERT INTO PriceUpdate(PriceUpdateID,DateChanged,OldPrice,NewPrice) 
      VALUES (1, NULL, 0, 0);
END;


    
	
	