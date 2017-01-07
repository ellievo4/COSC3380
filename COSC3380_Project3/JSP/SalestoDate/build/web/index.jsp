<%--
    Thanh Vo & Seat #D9
    COSC 3380   Fall 2016   Project 3
    This is MY work
    Will NOT disseminate
--%>

<%@ page import = "java.sql.*"%>
<%@ page import = "java.io.*"%>
<%  Class.forName("oracle.jdbc.driver.OracleDriver");%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Display SalestoDate from the database, a report that will be used by the Product Manager
            (product ID, product description, #number of times the product was ordered).</h1>

        <%
            //prepare variables for hostname, connection, statement object, result object
            String url = "jdbc:oracle:thin:@129.7.242.225:1521:orcl";
            Connection conn = null;
            Statement statement = null;
            ResultSet resultset = null;

            try {
                // Establish connection
                conn = DriverManager.getConnection(url, "vot","vt1148524");

                //create a statement object from the connection object in order to execute a SQL statement
                statement = conn.createStatement();

                //prepare query
                String query = "SELECT * FROM SalestoDate";

                //execute query
                resultset = statement.executeQuery(query);
        %>

        <%--  Setup the Output Report HTML View --%>
        <TABLE BORDER="1" BGCOLOR="CCFFFF" width='50%' cellspacing='1' cellpadding='0' bordercolor="black" border='1'>
            <TR>
                <TH bgcolor='#DAA520'> <font size='2'/>PRODUCTID</TH>
                <TH bgcolor='#DAA520'> <font size='2'/>PRODUCTNAME</TH>
                <TH bgcolor='#DAA520'><font size='2'/>PRODUCTFINISH</TH>
                <TH bgcolor='#DAA520'><font size='2'/>PRODUCTSTANDARDPRICE</TH>
                <TH bgcolor='#DAA520'><font size='2'/>PRODUCTLINEID</TH>
                <TH bgcolor='#DAA520'><font size='2'/>PHOTO</TH>
                <TH bgcolor='#DAA520'><font size='2'/>ORDERTIME</TH>
            </TR>

            <%
                //retrieve data in each row
                while (resultset.next()) {%>
            <TR>
                <TD> <font size='2'/><center><% out.print(resultset.getInt("ProductID"));%></center></TD>
                <TD> <font size='2'/><center><% out.print(resultset.getString("ProductName"));%></center></TD>
                <TD> <font size='2'/><center><% out.print(resultset.getString("ProductFinish"));%></center></TD>
                <TD> <font size='2'/><center><% out.print(resultset.getString("ProductStandardPrice"));%></center></TD>
                <TD> <font size='2'/><center><% out.print(resultset.getString("ProductLineID"));%></center></TD>
                <TD> <font size='2'/><center><% out.print(resultset.getString("Photo"));%></center></TD>
                <TD> <font size='2'/><center><% out.print(resultset.getInt("OrderTime"));%></center></TD>
            </TR>

            <% }
             }
            catch (Exception e) {
                e.printStackTrace();
            }

            //close connection, statement and result
            if(resultset!=null) resultset.close();
            if(statement!=null) statement.close();
            if(conn!=null) conn.close();%>

        </TABLE>

    </body>
</html>
