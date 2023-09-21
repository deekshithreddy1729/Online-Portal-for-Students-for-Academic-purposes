<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
	header {
    background-color: #2899D1;
    padding: 2px;
    text-align: center;
    font-size: 35px;
    color: white;
}

input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
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

input[type=submit]:hover {
    background-color: #2899D1;
}

div.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
<title>Add Course</title>
</head>
<body>
<center>
<header><h3>Add Course</h3></header>
<form action="AC2.jsp">
<table>
<tr><th>Course Id</th><td><input type = "text" name="acid"/></td></tr>
<tr><th>Course Name</th><td><input type = "text" name="acn"/></td></tr>
<tr><th>Department</th><td><select name="ad">
<option>CSE</option>
<option>EE</option>
<option>CE</option>
<option>MATHS</option>
<option>ME</option>
<option>HS</option>
<option>MEMS</option>
<option>CHEMISTRY</option>
</select></td></tr>
<tr><th>Credits</th><td><input type = "text" name="ac"/></td></tr>
<tr><th>L</th><td><input type = "text" name="al"/></td></tr>
<tr><th>T</th><td><input type = "text" name="at"/></td></tr>
<tr><th>P</th><td><input type = "text" name="ap"/></td></tr>
</table><br>
<input type="submit" value="Add">
</form>
</center>
</body>
</html>