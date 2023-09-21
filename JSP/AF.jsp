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

input[type=text],input[type=date], select {
    width: 60%;
    padding: 12px 20px;
    margin: 8px 0;
    display: block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
table {
    font-family: arial, sans-serif;

    width: 40%;
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
<title>ADD FACULTY</title>
</head>
<body>
<center>
<header><h3>Add Faculty</h3></header>
<form action="AF2.jsp">
<table>
<tr><th>College Id</th><td><input type = "text" name="acid"/></td></tr>
<tr><th>Aadhar No</th><td><input type = "text" name="aan"/></td></tr>
<tr><th>First Name</th><td><input type = "text" name="afn"/></td></tr>
<tr><th>Middle Name</th><td><input type = "text" name="amn"/></td></tr>
<tr><th>Last Name</th><td><input type = "text" name="aln"/></td></tr>
<tr><th>Personal Email</th><td><input type = "text" name="ape"/></td></tr>
<tr><th>College Email</th><td><input type = "text" name="ace"/></td></tr>
<tr><th>Gender</th><td><select name="ag">
<option>Male</option>
<option>Female</option>
<option>Other</option>
</select></td></tr>
<tr><th>Department</th><td><select name="ade">
<option>CSE</option>
<option>EE</option>
<option>CE</option>
<option>ME</option>
<option>MEMS</option>
</select></td></tr>
<tr><th>House No</th><td><input type = "text" name="ahn"/></td></tr>
<tr><th>Street</th><td><input type = "text" name="as"/></td></tr>
<tr><th>District</th><td><input type = "text" name="ad"/></td></tr>
<tr><th>City</th><td><input type = "text" name="ac"/></td></tr>
<tr><th>Pincode</th><td><input type = "text" name="ap"/></td></tr>
<tr><th>State</th><td><input type = "text" name="ast"/></td></tr>
<tr><th>Date of Birth</th><td><input type = "date" name="adob"/></td></tr>
<tr><th>Age</th><td><input type = "text" name="aa"/></td></tr>
<tr><th>Phone Number</th><td><input type = "text" name="apn"/></td></tr>
<tr><th>Phone Number(Optional)</th><td><input type = "text" name="apno"/></td></tr>
<tr><th>Salary</th><td><input type = "text" name="asr"/></td></tr>
</table><br>
<center><h3>Emergency Contact Details</h3></center>
<table>
<tr><th>Name</th><td><input type = "text" name="aecn"/></td></tr>
<tr><th>Relation</th><td><input type = "text" name="acr"/></td></tr>
<tr><th>Phone Number</th><td><input type = "text" name="aecpn"/></td></tr>
</table>
<input type="submit" value="Submit">
</form>
</center>
</body>
</html>