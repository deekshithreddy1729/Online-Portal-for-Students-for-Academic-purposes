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
<title>Successful</title>
<style>
body {font-family: Arial;}
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
</style>
</head>
<body>
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
    Res=Stmt.executeQuery("select * from student where roll_no='"+session.getAttribute("roll")+"'");
    Res.next();
    String s=Res.getString("library_registration");
    if(s.equals("no"))
    {
        Stmt.executeUpdate("update student set library_registration='Yes' where roll_no='"+session.getAttribute("roll")+"'");
        out.println("<center><h2>Library Registration Successful</h2><br><br>");
    }
    else
    {
    	out.println("<center><h2>Library Registration Already Completed</h2><br><br>");
    }
    out.println("<form action='main.jsp' method='post'>");
    out.println("<input type='hidden' name='rollno' value='"+session.getAttribute("roll")+"'>");
    out.println("<input type='hidden' name='password' value='"+session.getAttribute("pass")+"'>");
    out.println("<input type='submit' value='Home'></form></center>");
}
catch (SQLException ex) {
out.println("<h4><center>invalid</center></h4></center><br><br>");
//out.println(ex.getMessage());
}
%>
</body>
</html>