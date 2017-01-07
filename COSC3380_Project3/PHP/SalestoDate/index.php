<!--Thanh Vo & Seat #D9
COSC 3380   Fall 2016   Project 3
This is MY work
Will NOT disseminate -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Sales to Date </title>
        <style>
            table,th,td {
                border: 1.5px solid black;
            }
        </style>
    </head>
    <body>
        <h1> Display SalestoDate from the database, a report that will be used by the 
		Product Manager (product ID, product description, #number of times the product was ordered).</h1>
<?php
    //connect database
    $link  = @mysqli_connect("127.0.0.1:3306", "root", "", "cosc3380_furniture") or die ("Error: Unable to connect: " . mysqli_connect_error());
//    echo '<p class="alert alert-success"> Connect successfully to the database </p>';

	//prepare query sql command
    $sql = "SELECT * FROM SalestoDate;";
	
	//if we can execute the command successfully, we check if the result is non-empty or empty
    if($result = mysqli_query($link,$sql)) {
        if (mysqli_num_rows($result)>0)  {
			//print the table of data with row labels and tuples
            echo "<table><tr><th>PRODUCTID</th><th>PRODUCTNAME</th><th>PRODUCTFINISH</th><th>PRODUCTSTANDARDPRICE</th>
                <th>PRODUCTLINEID</th><th>PHOTO</th><th>ORDERTIME</th></tr>";
            // output data of each row
            while($row = $result->fetch_assoc()) {
                echo "<tr><td>" . $row["PRODUCTID"]. "</td><td>" . $row["PRODUCTNAME"]. "</td><td> " . $row["PRODUCTFINISH"]. "</td><td>".
                    $row["PRODUCTSTANDARDPRICE"]. "</td><td>". $row["PRODUCTLINEID"]. "</td><td>". $row["PHOTO"]. "</td>
					<td>". $row["ORDERTIME"] . "</td></tr>";
        }
        echo "</table>";
        } else {
            echo "0 results";
        }
    }
	
	//close connection
    $link->close();
?>
    </body>
</html>