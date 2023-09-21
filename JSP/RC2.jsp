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
<title>Delete Course</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
	header {
    background-color: #2899D1;
    padding: 2px;
    text-align: center;
    font-size: 25px;
    color: white;
}
.container {
    padding: 16px;
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

</style>
</head>
<body>
<header><center><h3>Delete Course</h3></center></header><br><br>
<%
Connection conn1 = null;
Statement Stmt=null;
ResultSet Res=null;
try {
    String url1 = "jdbc:mysql://localhost:3306/project";
    String user = "root";
    String password = "";
    conn1 = DriverManager.getConnection(url1, user, password);
    Stmt=conn1.createStatement();
    String roll;
    roll=request.getParameter("cd");
    Res=Stmt.executeQuery("select * from course where course_id='"+roll+"'");
    if(Res.next()){
    Stmt.executeUpdate("delete from course where course_id='"+roll+"'");
    out.println("<center><h3>Success</h3></center>");
    out.println("<center><form action='main.jsp' method='post'>");
    out.println("<input type='hidden' name='rollno' value='"+session.getAttribute("roll")+"'>");
    out.println("<input type='hidden' name='password' value='"+session.getAttribute("pass")+"'>");
    out.println("<br><input type='submit' value='Home'></form></center>");
    }
    else
    {
    	out.println("<center><h2>Invalid Course Id</h2><br>");
    	out.println("<a href='RC.jsp'><button>RETRY</button></a></center>");
    }
}
catch (SQLException ex) {
  out.println("An error occurred. Maybe user/password is invalid");
ex.printStackTrace();
}
%>
</body>
</html>