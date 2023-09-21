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
<title>Password</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
	header {
    background-color: #2899D1;
    padding: 2px;
    text-align: center;
    font-size: 25px;
    color: white;
}
input[type=text]{
    width: 25%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
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
.container {
    padding: 16px;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 40%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child() {
    background-color: #dddddd;
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

</style>
</head>
<body>
<header><center><h3>Show Password</h3></center></header><br><br>
<%
Connection conn1 = null;
Statement Stmt=null;
ResultSet Res=null;
try {
    String url1 = "jdbc:mysql://localhost:3306/project";
    String user = "root";
    String password = "";
    String oldp;
    oldp=session.getAttribute("pass").toString();
    conn1 = DriverManager.getConnection(url1, user, password);
    Stmt=conn1.createStatement();
    String roll;
    roll=request.getParameter("srollno");
    Res=Stmt.executeQuery("select * from login where roll_no='"+roll+"'");
    if(Res.next()){
    out.println("<center><font size='4'><table><tr><th>Roll No</th><td>"+roll+"</td></tr>");
    out.println("<tr><th>Password</th><td>"+Res.getString("password")+"</td></tr></table></font></center>");
    out.println("<center><form action='main.jsp' method='post'>");
    out.println("<input type='hidden' name='rollno' value='"+session.getAttribute("roll")+"'>");
    out.println("<input type='hidden' name='password' value='"+session.getAttribute("pass")+"'>");
    out.println("<br><input type='submit' value='Home'></form></center>");
    }
    else
    {
    	out.println("<center><h2>Invalid Roll No</h2><br>");
    	out.println("<a href='SP.jsp'><button>RETRY</button></a></center>");
    }
}
catch (SQLException ex) {
System.out.println("An error occurred. Maybe user/password is invalid");
ex.printStackTrace();
}
%>
</body>
</html>