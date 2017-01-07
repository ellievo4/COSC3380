/*Thanh Vo & Seat #D9*/
/*COSC 3380   Fall 2016   Project 3*/
/*This is MY work*/
/*Will NOT disseminate*/

/*Part 1. Stored Procedures*/
/*Create new column SalePrice in table Product*/
ALTER TABLE Product DROP COLUMN SalePrice;
ALTER TABLE Product ADD SalePrice DECIMAL(6,2);

/*1.a) Create the procedure*/
--set serveroutput on;
CREATE OR REPLACE PROCEDURE ProductLineSale
IS
  /*declare the variables that store the sale price, the standard price and the product id*/  
  Sale Product.SalePrice%type;
  Price Product.ProductStandardPrice%type;
  PID Product.ProductID%type;
  
  /*use cursor to select all product id and standard price from product table*/
  CURSOR get_price IS
    SELECT ProductID, ProductStandardPrice FROM Product;
  
BEGIN
  /*open the cursor */  
  OPEN get_price;
  LOOP
    /*store product id and price at a row into variables and exit loop if no more data retrieved*/ 
    FETCH get_price INTO PID, Price;
    EXIT WHEN get_price%NOTFOUND;
    
    /*if the price >= 400, the sale price is 90% of price; otherwise, 85% of the price*/  
    IF Price >= 400 THEN 
      Sale := 0.90 * Price;
    ELSE 
      Sale := 0.85 * Price; 
    END IF; 

    /*update the new values to SalePrice column*/
    UPDATE Product SET SalePrice = Sale WHERE ProductID = PID; 
  END LOOP;
  COMMIT;
END ProductLineSale;
/

/*1.b) execute the procedure*/  
BEGIN
  ProductLineSale();
END;

/*1.c) Display the contents of the PRODUCT table*/
SELECT * FROM Product;


/*Part 2.   TRIGGERS */
/*1.	Write and run the trigger named StandardPriceUpdate*/
/*drop the standard price update trigger*/
/*drop the PriceUpdate table*/
DROP TRIGGER StandardPriceUpdate;
DROP TABLE PriceUpdate;

/*Create table PriceUpdate*/
CREATE TABLE PriceUpdate (
  UpdateProductID   INTEGER,
  DateChanged DATE,
  OldPrice INTEGER,
  NewPrice INTEGER
);

/*create the trigger after the product table is updated*/
CREATE OR REPLACE TRIGGER StandardPriceUpdate
AFTER UPDATE ON Product
FOR EACH ROW
BEGIN
  /*insert new data row to PriceUpdate table*/
  INSERT INTO PriceUpdate (UPDATEPRODUCTID, DATECHANGED, OLDPRICE, NEWPRICE) VALUES (:OLD.ProductID, SYSDATE, :OLD.ProductStandardPrice, :NEW.ProductStandardPrice);
END;
/


/*Drop then create view SalestoDate - a report that will be used by the Product Manager (product ID, product description, #number of times the product was ordered.*/
DROP VIEW SalestoDate;
CREATE VIEW SalestoDate AS 
  SELECT PR.PRODUCTID, PR.PRODUCTNAME, PR.PRODUCTFINISH, PR.PRODUCTSTANDARDPRICE, PR.PRODUCTLINEID, PR.PHOTO, SUM(OL.ORDEREDQUANTITY) AS ORDERTIME
  FROM PRODUCT PR, ORDERLINE OL
  WHERE PR.PRODUCTID = OL.PRODUCTID
  GROUP BY PR.PRODUCTID, PR.PRODUCTNAME, PR.PRODUCTFINISH, PR.PRODUCTSTANDARDPRICE, PR.PRODUCTLINEID, PR.PHOTO
  ORDER BY PR.PRODUCTID;

