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
<title>Confirmation</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

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
<body><center>
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
    String[] courses =request.getParameterValues("courses");
   // out.println(courses[0]);
   for(int i=0;i<courses.length;i++){
	   Stmt.executeUpdate("insert into course_regis value('"+session.getAttribute("roll")+"','"+courses[i]+"')");
   }
   out.println("Registration Successful<br><br>");
   out.println("<form action='main.jsp' method='post'>");
   out.println("<input type='hidden' name='rollno' value='"+session.getAttribute("roll")+"'>");
   out.println("<input type='hidden' name='password' value='"+session.getAttribute("pass")+"'>");
   out.println("<input type='submit' value='Home'></form>");
}
catch (SQLException ex) {
   out.println("<h2>The selected course/courses are already registered</h2><br><br>");
   out.println("<form action='main.jsp' method='post'>");
   out.println("<input type='hidden' name='rollno' value='"+session.getAttribute("roll")+"'>");
   out.println("<input type='hidden' name='password' value='"+session.getAttribute("pass")+"'>");
   out.println("<input type='submit' value='Home'></form>");
ex.printStackTrace();
}
%>
</center>
</body>
</html>