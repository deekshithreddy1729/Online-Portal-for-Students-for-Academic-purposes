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
<title>View Student</title>
</head>
<body>
<center>
<header><h3>Select Branch</h3></header>
<form action="VS2.jsp">
<table>
<tr><th>Department</th><td><select name="vd">
<option>CSE</option>
<option>EE</option>
<option>CE</option>
<option>ME</option>
<option>MEMS</option>
</select></td></tr>
</table><br>
<input type="submit" value="View Students">
</form>
</center>
</body>
</html>