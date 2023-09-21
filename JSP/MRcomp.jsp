<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
<body>
<%
   out.println("<center><h2>Medical Registration complete</h2><br><br>");
    out.println("<form action='main.jsp' method='post'>");
    out.println("<input type='hidden' name='rollno' value='"+session.getAttribute("roll")+"'>");
    out.println("<input type='hidden' name='password' value='"+session.getAttribute("pass")+"'>");
    out.println("<input type='submit' value='Home'></form></center>");
%>
</body>
</html>