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
<title>Course Registration</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
	header {
    background-color: #2899D1;
    padding: 2px;
    text-align: center;
    font-size: 25px;
    color: white;
}
button {
    background-color: #2899D1;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 25%;
}

button:hover {
    opacity: 0.8;
}

table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 60%;
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
<center>
<header><h3>COURSES</h3></header><br><br>
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
    Res=Stmt.executeQuery("select * from course");
    out.println("<form action='CR2.jsp'><table>");
    out.println("<tr><th></th><th>Course Id</th><th>Course Name</th><th>L-T-P</th><th>Credits</th></tr>");
    while(Res.next()){
    	out.println("<tr><td><input type='checkbox' name='courses' value='"+Res.getString("course_id")+"'></td><td>"+Res.getString("course_id")+"</td><td>"+Res.getString("course_name")+"</td><td>"+Res.getString("L")+"-"+Res.getString("T")+"-"+Res.getString("P")+"</td><td>"+Res.getString("credits")+"</td></tr>");                                            
       // out.println("<br><br>"); 
    }
    out.println("</table><br>");
	out.println("<button type='submit'>Submit</button>");
	out.println("</form>");
}
catch (SQLException ex) {
System.out.println("An error occurred. Maybe user/password is invalid");
ex.printStackTrace();
}
%>
</center>


</body>
</html>