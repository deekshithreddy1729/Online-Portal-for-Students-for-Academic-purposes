<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Room Allotment</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
	header {
    background-color: #2899D1;
    padding: 2px;
    text-align: center;
    font-size: 25px;
    color: white;
}
input[type=submit] {
    width: 20%;
    background-color: #2899D1;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 15%;
}

button:hover {
    opacity: 0.8;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child() {
    background-color: #dddddd;
}
</style>
</head>
<body>
<center><header><h2>Personal Details</h2></header><br><br>
<%
Connection conn1 = null; 
Statement Stmt=null;
ResultSet Res=null;
try {
    // connect way #1
    String url1 = "jdbc:mysql://localhost:3306/project";
    String user = "root";
    String password = "";
    conn1 = DriverManager.getConnection(url1, user, password);
    Stmt=conn1.createStatement();
    Res=Stmt.executeQuery("select * from personal_details where clg_id='"+request.getParameter("roll1")+"'");
    Res.next();
     out.println("<table><tr><th>Roll No</th><td>"+Res.getString("clg_id")+"</td></tr>");
    out.println("<tr><th>First Name</th><td>"+Res.getString("first_name")+"</td></tr>");
    out.println("<tr><th>Middle Name</th><td>"+Res.getString("middle_name")+"</td></tr>");
    out.println("<tr><th>Last Name</th><td>"+Res.getString("last_name")+"</td></tr>");
    out.println("<tr><th>Gender</th><td>"+Res.getString("gender")+"</td></tr>");
    out.println("<tr><th>Address</th><td>"+Res.getString("house_no")+","+Res.getString("street")+","+Res.getString("district")+
    		                   ","+Res.getString("city")+","+Res.getString("pincode")+","+Res.getString("state")+"</td></tr>");
    out.println("<tr><th>DOB</th><td>"+Res.getString("date_of_birth")+"</td></tr>");
    out.println("<tr><th>Personal Email</th><td>"+Res.getString("personal_email")+"</td></tr>");
   
    Res=Stmt.executeQuery("select * from phone_number where clg_id='"+request.getParameter("roll1")+"'");
    out.println("<tr><th>Phone Number</th><td>");
    while(Res.next())
    {
    	out.println(Res.getString("phone_number")+",");	
    } 
    out.println("</td></tr></table>"); 
    out.println("<center><form action='main.jsp' method='post'>");
    out.println("<input type='hidden' name='rollno' value='"+session.getAttribute("roll")+"'>");
    out.println("<input type='hidden' name='password' value='"+session.getAttribute("pass")+"'>");
    out.println("<br><input type='submit' value='Home'></form></center>");
}
catch (SQLException ex) {
	ex.printStackTrace();
	out.println("dengindhi");
	}
%>
</center>
</body>
</html>