﻿/*
    Thanh Vo & Seat #D9
    COSC 3380   Fall 2016   Project 3
    This is MY work
    Will NOT disseminate
*/

using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;

public partial class _Default : System.Web.UI.Page
{
    StringBuilder table = new StringBuilder();  //store and display content
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            //connect to oracle database
            OracleConnection con = new OracleConnection("USER ID=vot; PASSWORD = vt1148524; DATA SOURCE=129.7.242.225:1521/orcl");
            con.Open();

            //prepare oracle sql command
            OracleCommand cmd = new OracleCommand("SELECT * FROM SalestoDate");
            cmd.Connection = con;

            //execute command
            OracleDataReader rd = cmd.ExecuteReader();

            //table header
            table.Append("<TABLE BORDER=\"1\" BGCOLOR=\"CCFFFF\" width=\'50%\' cellspacing=\'1\' cellpadding=\'0\' bordercolor=\"black\" border=\'1\'>");
            table.Append("<TR>");
            table.Append("<TH bgcolor='#DAA520'> <font size='2'/>PRODUCTID</TH>");
            table.Append("<TH bgcolor='#DAA520'> <font size='2'/>PRODUCTNAME</TH>");
            table.Append("<TH bgcolor='#DAA520'><font size='2'/>PRODUCTFINISH</TH>");
            table.Append("<TH bgcolor='#DAA520'><font size='2'/>PRODUCTSTANDARDPRICE</TH>");
            table.Append("<TH bgcolor='#DAA520'><font size='2'/>PRODUCTLINEID</TH>");
            table.Append("<TH bgcolor='#DAA520'><font size='2'/>PHOTO</TH>");
            table.Append("<TH bgcolor='#DAA520'><font size='2'/>ORDERTIME</TH>");
            table.Append("</TR>");

            if (rd.HasRows)
            {
                //load in table rows/tuples
                while (rd.Read())
                {
                    table.Append("<TR>");
                    table.Append("<TD> <font size='2'/><center>" + rd[0] + "</center></TD>");
                    table.Append("<TD> <font size='2'/><center>" + rd[1] + "</center></TD>");
                    table.Append("<TD> <font size='2'/><center>" + rd[2] + "</center></TD>");
                    table.Append("<TD> <font size='2'/><center>" + rd[3] + "</center></TD>");
                    table.Append("<TD> <font size='2'/><center>" + rd[4] + "</center></TD>");
                    table.Append("<TD> <font size='2'/><center>" + rd[5] + "</center></TD>");
                    table.Append("<TD> <font size='2'/><center>" + rd[6] + "</center></TD>");
                    table.Append("</TR>");
                }
            }
            table.Append("</TABLE>");

            //add content to html page
            PlaceHolder1.Controls.Add(new Literal { Text = table.ToString()});

            //dispose and close connection 
            rd.Dispose();
            rd.Close();
        }
    }
}