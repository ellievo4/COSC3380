/*Thanh Vo & Seat #D9*/
/*COSC 3380   Fall 2016   Project 3*/
/*This is MY work*/
/*Will NOT disseminate*/

/*First, create new database*/
CREATE DATABASE COSC3380_Furniture;


/*Second, create 9 tables*/
/*9 RELATIONS*/
/*Customer table*/
/*create the table Customer*/
CREATE TABLE Customer (
    CustomerID 			INTEGER NOT NULL, 
    CustomerName		CHAR(40),
    CustomerAddress		CHAR(60),
    CustomerCity		CHAR(20),
    CustomerState		CHAR(2),
    CustomerPostalCode	CHAR(10),
    CustomerEmail 		CHAR(40),
    CustomerUserName	CHAR(15),
    CustomerPassword		CHAR(15),
	PRIMARY KEY(CustomerID));
	
/*Order table*/
/*create the table Order*/
CREATE TABLE Orderr (
    OrderID INTEGER NOT NULL, 
    OrderDate DATE,
    CustomerID INTEGER NOT NULL,
    PRIMARY KEY(OrderID),
    FOREIGN KEY (CustomerID) REFERENCES customer(CustomerID) ON DELETE CASCADE);

/*Territory table*/
/*create the table Territory*/
CREATE TABLE Territory (
    TerritoryID INTEGER NOT NULL,
    TerritoryName CHAR(30),
	PRIMARY KEY(TerritoryID));
    
/*DoesBusinessIn table*/
/*create the table DoesBusinessIn*/
CREATE TABLE DoesBusinessIn (
    CustomerID INTEGER NOT NULL,
    TerritoryID INTEGER NOT NULL,
    PRIMARY KEY(CustomerID, TerritoryID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID) ON DELETE CASCADE);    
	
/*SalesPerson table*/
/*create the table SalesPerson*/
CREATE TABLE SalesPerson (
    SalespersonID INTEGER NOT NULL,
    SalespersonName CHAR(30),
    SalespersonPhone CHAR(10),
    SalespersonEmail CHAR(40),
    SalespersonUserName CHAR(15),
    SalespersonPassword CHAR(15),
    TerritoryID INTEGER NOT NULL,
    PRIMARY KEY(SalespersonID),
    FOREIGN KEY (TerritoryID) REFERENCES Territory(TerritoryID) ON DELETE CASCADE);
	

/*ProductLine table*/
--/*create the table ProductLine*/	
CREATE TABLE ProductLine (
    ProductLineID INTEGER NOT NULL,
    ProductLineName CHAR(20),
	PRIMARY KEY (ProductLineID));

/*Product table*/
/*create the table Product*/
CREATE TABLE Product (
    ProductID INTEGER NOT NULL,
    ProductName CHAR(20),
    ProductFinish CHAR(20),
    ProductStandardPrice INTEGER,
    ProductLineID INTEGER NOT NULL,
    Photo CHAR(10),
    PRIMARY KEY (ProductID),
    FOREIGN KEY (ProductLineID) REFERENCES productline(ProductLineID) ON DELETE CASCADE);

/*OrderLine table*/
/*create the table OrderLine*/
CREATE TABLE OrderLine (
    OrderID INTEGER NOT NULL,
    ProductID INTEGER NOT NULL,
    OrderedQuantity INTEGER,
    SalePrice INTEGER,
    PRIMARY KEY(OrderID, ProductID),
    FOREIGN KEY(OrderID) REFERENCES Orderr(OrderID) ON DELETE CASCADE,
    FOREIGN KEY(ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE);
    
/*create price update table*/
CREATE TABLE PriceUpdate (
    PriceUpdateID INTEGER NOT NULL,
    DateChanged DATE,
    OldPrice INTEGER,
    NewPrice INTEGER,
    PRIMARY KEY (PriceUpdateID));
	
/*Third, populate data into the tables*/
/*Insert data into customer table*/
/*---------------------------------*/
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (1, 'Contemporary Casuals', '1355 S Hines Blvd', 'Gainesville', 'FL', '32601-2871');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (2, 'Value Furnitures', '15145 S.W. 17th St.', 'Plano', 'TX', '75094-7734');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode, 
    CustomerEmail, CustomerUserName, CustomerPassword) 
  VALUES (3, 'Home Furnishings', '1900 Allard Ave', 'Albany', 'NY', '12209-1125',  'homefurnishings?@gmail.com', 'CUSTOMER1', 'CUSTOMER1#');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (4, 'Eastern Furniture', '1925 Beltline Rd.', 'Carteret', 'NJ', '07008-3188');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (5, 'Impressions', '5585 Westcott Ct.', 'Sacramento', 'CA', '94206-4056');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (6, 'Furniture Gallery', '325 Flatiron Dr.', 'Boulder', 'CO', '80514-4432');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (7, 'New Furniture', 'Palace Ave', 'Farmington', 'NM', '');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (8, 'Dunkins Furniture', '7700 Main St', 'Syracuse', 'NY', '31590');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (9, 'A Carpet', '434 Abe Dr', 'Rome', 'NY', '13440');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (12, 'Flanigan Furniture', 'Snow Flake Rd', 'Ft Walton Beach', 'FL', '32548');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (13, 'Ikards', '1011 S. Main St', 'Las Cruces', 'NM', '88001');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (14, 'Wild Bills', 'Four Horse Rd', 'Oak Brook', 'Il', '60522');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (15, 'Janet''s Collection', 'Janet Lane', 'Virginia Beach', 'VA', '10012');
INSERT INTO Customer (CustomerID, CustomerName, CustomerAddress, CustomerCity, CustomerState, CustomerPostalCode) 
  VALUES (16, 'ABC Furniture Co.', '152 Geramino Drive', 'Rome', 'NY', '13440');
 
 
 /*---------------------------------*/
/*Insert data into Order table*/
/*---------------------------------*/
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1001, '2016-08-21', 1);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1002, '2016-07-21', 8);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1003, '2016-08-22', 15);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1004, '2016-10-22', 5);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1005, '2016-07-24', 3);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1006, '2016-10-24', 2);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1007, '2016-08-27', 5);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1008, '2016-10-30', 12);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1009, '2016-11-05', 4);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1010, '2016-11-05', 1);
 

/*---------------------------------*/
/*Insert data into Territory table*/
/*---------------------------------*/
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES (1, 'SouthEast'); 
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES (2, 'SouthWest'); 
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES (3, 'NorthEast'); 
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES (4, 'NorthWest'); 
INSERT INTO Territory(TerritoryID, TerritoryName) VALUES (5, 'Central'); 


/*---------------------------------*/
/*Insert data into DoesBusinessIn table*/
/*---------------------------------*/
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES (1, 1);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES (2, 2);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES (3, 3);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES (4, 4);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES (5, 5);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES (6, 1);
INSERT INTO DoesBusinessIn(CustomerID, TerritoryID) VALUES (7, 2);

 
/*---------------------------------*/  
/*Insert data into Salesperson table*/
/*---------------------------------*/
INSERT INTO Salesperson (SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, 
  SalespersonPassword,TerritoryID) 
  VALUES (1, 'Doug Henny', '8134445555', 'salesperson?@gmail.com', 'SALESPERSON', 'SALESPERSON#',1);
INSERT INTO Salesperson (SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, 
  SalespersonPassword,TerritoryID) 
  VALUES (2, 'Robert Lewis', '8139264006', '', '', '', 2);
INSERT INTO Salesperson (SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, 
  SalespersonPassword,TerritoryID) 
  VALUES (3, 'William Strong', '5053821212', '', '', '', 3);
INSERT INTO Salesperson (SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, 
  SalespersonPassword,TerritoryID) 
  VALUES (4, 'Julie Dawson', '4355346677', '', '', '', 4);
INSERT INTO Salesperson (SalespersonID, SalespersonName, SalespersonPhone, SalespersonEmail, SalespersonUserName, 
  SalespersonPassword,TerritoryID) 
  VALUES (5, 'Jacob Winslow', '2238973498', '', '', '', 5);


/*---------------------------------*/
/*Insert data into ProductLine table*/
/*---------------------------------*/
INSERT INTO ProductLine(ProductLineID, ProductLineName) VALUES (1, 'Cherry Tree');
INSERT INTO ProductLine(ProductLineID, ProductLineName) VALUES (2, 'Scandinavia');
INSERT INTO ProductLine(ProductLineID, ProductLineName) VALUES (3, 'Country Look');


/*---------------------------------*/
/*Insert data into Product table*/
/*---------------------------------*/
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID, Photo) 
  VALUES (1, 'End Table', 'Cherry', 175, 1, 'table.jpg');
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID) 
  VALUES (2, 'Coffee Table', 'Natural Ash', 200, 2);
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID) 
  VALUES (3, 'Computer Desk', 'Natural Ash', 375, 2);
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID) 
  VALUES (4, 'Entertainment Center', 'Natural Maple', 650, 3);
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID) 
  VALUES (5, 'Writers Desk', 'Cherry', 325, 1);
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID) 
  VALUES (6, '8-Drawer Desk', 'White Ash', 750, 2);
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID) 
  VALUES (7, 'Dining Table', 'Natural Ash', 800, 2);
INSERT INTO Product(ProductID, ProductName, ProductFinish, ProductStandardPrice, ProductLineID) 
  VALUES (8, 'Computer Desk', 'Walnut', 250, 3);
  

/*---------------------------------*/
/*Insert data into OrderLine table*/
/*---------------------------------*/
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1001, 1, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1001, 2, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1001, 4, 1);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1002, 3, 5);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1003, 3, 3);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1004, 6, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1004, 8, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1005, 4, 4);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1006, 4, 1);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1006, 5, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1006, 7, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1007, 1, 3);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1007, 2, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1008, 3, 3);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1008, 8, 3);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1009, 4, 2);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1009, 7, 3);
INSERT INTO OrderLine(OrderID, ProductID, OrderedQuantity) VALUES (1010, 8, 10);

/*---------------------------------*/
/*Insert data into OrderLine table at SalePrice column*/
/*---------------------------------*/
UPDATE OrderLine OL SET OL.SalePrice = (SELECT OL.OrderedQuantity*PR.ProductStandardPrice
              FROM Product PR 
              WHERE OL.ProductID = PR.ProductID);