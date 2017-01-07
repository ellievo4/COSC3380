/*Thanh Vo & Seat #D9*/
/*COSC 3380   Fall 2016   Project 2*/
/*This is MY work*/
/*Will NOT disseminate*/
/*---------------------------------*/
/*A. (35 points) The Client has supplied the following data. Use SQL to insert these data in the Oracle DBMS database created in Project 1. */
/*---------------------------------*/
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
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1001, '21/Aug/16', 1);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1002, '21/Jul/16', 8);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1003, '22/ Aug/16', 15);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1004, '22/Oct/16', 5);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1005, '24/Jul/16', 3);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1006, '24/Oct/16', 2);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1007, '27/ Aug/16', 5);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1008, '30/Oct/16', 12);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1009, '05/Nov/16', 4);
INSERT INTO Orderr(OrderID, OrderDate, CustomerID) VALUES (1010, '05/Nov/16', 1);
 

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
                                               
/*--------------------------------------------------------------------------------------*/
/*B. (65 points) The Client wishes that you create the SQL code for the following queries 
(please make sure you SQL COMMENT each query and produce the screenshots for SQL COMMENT, 
SQL COMMAND, and SQL OUTPUT each, to be placed in Project2.doc):*/
/*--------------------------------------------------------------------------------------*/
/*Q1 Which products have a standard price of less than $ 275?*/
/*    PRODUCTNAME   PRODUCTSTANDARDPRICE
      End Table           	175
      Coffee Table        	200
      Computer Desk       	250
*/
SELECT ProductName, ProductStandardPrice 
FROM Product 
WHERE ProductStandardPrice < 275;

/*Q2 List the unit price, product name, and product ID for all products in the Product table. */
/*    PRODUCTID   PRODUCTNAME             PRODUCTSTANDARDPRICE
      1	            End Table           	175
      2	            Coffee Table        	200
      3	            Computer Desk       	375
      4	            Entertainment Center	650
      5	            Writers Desk        	325
      6	            8-Drawer Desk       	750
      7	            Dining Table        	800
      8	            Computer Desk       	250
*/
SELECT ProductID, ProductName, ProductStandardPrice 
FROM Product;

/*Q3 What is the average standard price for all products in inventory? */
/*AVG(PRODUCTSTANDARDPRICE)
    440.625
*/
SELECT AVG(ProductStandardPrice)
FROM Product;

/* Q4 How many different items were ordered on order number 1004*/
/*   ORDERID     PRODUCTCOUNT
       1004             2
*/
SELECT OrderID, COUNT(DISTINCT ProductID) AS ProductCount
FROM ORDERLINE 
WHERE OrderID=1004
GROUP BY OrderID;

/*Q5 Which orders have been placed since 10/ 24/ 2010? */
/*  ORDERID   ORDERDATE
      1001	  21-AUG-16
      1002	  21-JUL-16
      1003	  22-AUG-16
      1004	  22-OCT-16
      1005	  24-JUL-16
      1006	  24-OCT-16
      1007	  27-AUG-16
      1008	  30-OCT-16
      1009	  05-NOV-16
      1010	  05-NOV-16
*/
SELECT OrderID, OrderDate  
FROM Orderr
WHERE OrderDate >= '24/ Oct/10';

/*Q6 What furniture does COSC3380 carry that isn’t made of cherry? */
/*  PRODUCTNAME           PRODUCTFINISH
    Coffee Table        	Natural Ash         
    Computer Desk       	Natural Ash         
    Entertainment Center	Natural Maple       
    8-Drawer Desk       	White Ash           
    Dining Table        	Natural Ash         
    Computer Desk       	Walnut              
*/
SELECT ProductName, ProductFinish
FROM Product
WHERE ProductFinish != 'Cherry';

/*Q7 List product name, finish, and standard price for all desks and all tables that cost more than $ 300 in the Product table. */
/*  PRODUCTNAME           PRODUCTFINISH   PRODUCTSTANDARDPRICE
    Computer Desk       	Natural Ash         	375
    Writers Desk        	Cherry              	325
    8-Drawer Desk       	White Ash           	750
    Dining Table        	Natural Ash         	800
*/
SELECT ProductName, ProductFinish, ProductStandardPrice
FROM Product
WHERE (ProductName LIKE '%Desk%' OR ProductName LIKE '%Table%') AND PRODUCTSTANDARDPRICE>300;

/*Q8 Which products in the Product table have a standard price between $ 200 and $ 300?*/
/*  PRODUCTNAME   PRODUCTSTANDARDPRICE
    Coffee Table        	200
    Computer Desk       	250
*/
SELECT ProductName, ProductStandardPrice  
FROM Product
WHERE ProductStandardPrice BETWEEN 200 AND 300;

/*Q9 List customer, city, and state for all customers in the Customer table whose address is Florida, Texas, California, or Hawaii. 
List the customers alphabetically by state and alphabetically by customer within each state. */
/*    CUSTOMERID  CUSTOMERNAME            CUSTOMERCITY   CUSTOMERSTATE
      5	          Impressions             Sacramento          	CA
      1	          Contemporary Casuals    Gainesville         	FL
      12	        Flanigan Furniture      Ft Walton Beach     	FL
      2	          Value Furnitures        Plano               	TX
*/
SELECT CustomerID, CustomerName, CustomerCity, CustomerState 
FROM Customer 
WHERE CUSTOMERSTATE='FL' OR CUSTOMERSTATE='TX' OR CUSTOMERSTATE='CA' OR CUSTOMERSTATE='HI' 
ORDER BY CustomerState ASC, CustomerName ASC;

/*Q10 Count the number of customers with addresses in each state to which we ship. */
/*  CUSTOMERSTATE   CUSTOMERCOUNT
    NJ	                1
    CA	                1
    NM	                2
    VA	                1
    Il	                1
    NY	                4
    CO	                1
    FL	                2
    TX	                1
*/
SELECT CustomerState, COUNT(customerID) AS CustomerCount 
FROM Customer
GROUP BY CustomerState;

/*Q11 Count the number of customers with addresses in each city to which we ship. List the cities by state. */
/*  CUSTOMERSTATE   CUSTOMERCITY        CUSTOMERCOUNT
    CA	              Sacramento          	1
    CO	              Boulder             	1
    FL	              Ft Walton Beach     	1
    FL	              Gainesville         	1
    Il	              Oak Brook           	1
    NJ	              Carteret            	1
    NM	              Farmington          	1
    NM	              Las Cruces          	1
    NY	              Albany              	1
    NY	              Rome                	2
    NY	              Syracuse            	1
    TX	              Plano               	1
    VA	              Virginia Beach      	1
*/
SELECT CustomerState, CustomerCity, COUNT(CustomerID) AS CustomerCount
FROM Customer
GROUP BY CustomerState, CustomerCity
ORDER BY CustomerState;

/*Q12 Find only states with more than one customer. */
/*    CUSTOMERSTATE   CUSTOMERCOUNT
      NM	              2
      NY	              4
      FL	              2
*/
SELECT CustomerState, COUNT(CustomerID) AS CustomerCount
FROM Customer
GROUP BY CustomerState
HAVING COUNT(CustomerID)>1;

/*Q13 List, in alphabetical order, the product finish and the average standard price for each finish for selected finishes having 
an average standard price less than 750. */
/*    PRODUCTFINISH   AVERAGESTANDARDPRICE 
      Cherry              	250
      Natural Ash         	458.333333333333333333333333333333333333
      Natural Maple       	650
      Walnut              	250
*/
SELECT ProductFinish, AVG(ProductStandardPrice) AS AverageStandardPrice
FROM PRODUCT 
GROUP BY ProductFinish
HAVING AVG(ProductStandardPrice)<750
ORDER BY ProductFinish ASC;

/*Q14 What is the total value of orders placed for each furniture product? */
/*  PRODUCTID       PRODUCTNAME           TOTALVALUE
      1	            End Table           	875
      6	            8-Drawer Desk       	1500
      2	            Coffee Table        	800
      4	            Entertainment Center	5200
      5	            Writers Desk        	650
      8	            Computer Desk       	3750
      3	            Computer Desk       	4125
      7	            Dining Table        	4000
*/
SELECT PR.ProductID, PR.ProductName, ProductPrice.TotalValue
FROM Product PR, 
    (SELECT ProductID, SUM(SalePrice) AS TotalValue 
     FROM OrderLine 
     GROUP BY ProductID) ProductPrice
WHERE PR.ProductID = ProductPrice.ProductID;