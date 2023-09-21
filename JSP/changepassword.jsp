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
<title>change pass</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
	header {
    background-color: #2899D1;
    padding: 2px;
    text-align: center;
    font-size: 35px;
    color: white;
}

input[type=text], input[type=password] {
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
</style>
</head>
<body><center>
<header><h3>Change Password</h3></header><br>
<%
Connection conn1 = null;
Statement Stmt=null;
ResultSet Res=null;
try {
    // connect way #1
    String url1 = "jdbc:mysql://localhost:3306/project";
    String user = "root";
    String password = "";
    String oldp;
    oldp=session.getAttribute("pass").toString();
    conn1 = DriverManager.getConnection(url1, user, password);
    Stmt=conn1.createStatement();
    //if (conn1 != null) {
     //   out.println("Connected to the database test1");
   // }
    String pass;
    pass=request.getParameter("oldpass");
    if(oldp.equals(pass)){
    	if(request.getParameter("newpass").equals(request.getParameter("retypenewpass"))){
    	      Stmt.executeUpdate("UPDATE login SET password='"+request.getParameter("newpass")+"' WHERE roll_no='"+session.getAttribute("roll")+"'");
    	      out.println("<center><h3>Password is updated</h3>");
    	      out.println("<br><a href='temp.jsp'><button>HOME</button></a></center>");
    	}
    	else{
    		out.println("<h2>Both passwords are not same</h2><br>");
    		out.println("<a href='changepassword.html'><button>RETRY</button></a>");
    	}
    }
    else{
    	out.println("<h2>Old password is incorrect</h2><br>");
    	out.println("<a href='changepassword.html'><button>RETRY</button></a>");
    }
}
catch (SQLException ex) {
System.out.println("An error occurred. Maybe user/password is invalid");
ex.printStackTrace();
}
%>
</center>
<body>

</body>
</html>