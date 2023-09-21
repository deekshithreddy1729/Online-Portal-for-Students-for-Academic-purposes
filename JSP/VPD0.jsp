<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personal Details</title>
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
</style>
</head>
<body>
<header><center><h3>Personal Details</h3></center></header><br><br>
<form action="VPD.jsp">
<center>
  <div class="container">
    <label for="rollno"><b></b></label>
    <input type="text" placeholder="College Id" name="roll1" required>
<br>    
    <button type="submit">Show</button>
  </div>
</center>
</form>
</body>
</html>