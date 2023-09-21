
<%@page import="com.mysql.cj.Session"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}

button {
    background-color: #2899D1;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 15%;
}

button:hover {
    opacity: 0.8;
}
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 60%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child() {
    background-color: #dddddd;
}
</style>
</head>
<body>
<% 
Connection conn1 = null;
Statement Stmt=null;
ResultSet Res=null;
ResultSet Res1=null;
Statement Stmt1=null;
try {
    String url1 = "jdbc:mysql://localhost:3306/project";
    String user = "root";
    String password = "";
    conn1 = DriverManager.getConnection(url1, user, password);
    Stmt=conn1.createStatement();
    Stmt1=conn1.createStatement();
    String s=request.getParameter("rollno");
    String s3=request.getParameter("password");
    session.setAttribute("pass",s3);
    session.setAttribute("roll",s);
    Res=Stmt.executeQuery("select * from admin_login where user='"+s+"'");
    
    if(Res.next())
    {
        if(Res.getString("password").equals(s3))
        {
        	out.println("<center>");
        	out.println("<a href='SP.jsp'><button>Show Password</button></a>");
        	out.println("<a href='RSF.jsp'><button>Remove Student</button></a>");
        	out.println("<a href='RSF.jsp'><button>Remove Faculty</button></a>");
        	out.println("<a href='AF.jsp'><button>Add Faculty</button></a>");
        	out.println("<a href='AC.jsp'><button>Add Course</button></a>");
        	out.println("<a href='RC.jsp'><button>Remove Course</button></a>");
        	out.println("<a href='NOLR.jsp'><button>LR Incomplete</button></a>");
        	out.println("<a href='NOMR.jsp'><button>MR Incomplete</button></a>");
        	out.println("<a href='VS.jsp'><button>View Students</button></a>");
        	out.println("<a href='VPD0.jsp'><button>View Personal Details</button></a>");
        	out.println("<a href='VSOC.jsp'><button>View Students of Course</button></a>");
        	out.println("<a href='adminchangepass.html'><button>Change Password</button></a>");
        	out.println("<a href='temp.jsp'><button>LOGOUT</button></a>");
        	out.println("</center>");
        	out.println("<center><h1>Welcome Admin</h1></center>");
        }
        else
        {
        	out.println("<br><center><h3>Invalid UserName/Password</h3><br>");
           	out.println("<a href='temp.jsp'><button>RETRY</button></a></center>");
        }
    	
    }
    else
    {	
    Res=Stmt.executeQuery("select * from Login");
    String s1;
    int i=0;
    while(Res.next()){
    	s1=Res.getString("roll_no");
    	String s2=Res.getString("password");
    	   if(s.equals(s1)){
    		   if(s2.equals(s3)){
    			   i++;
    		   }
    	    }
    }
    if(i==0){
    	out.println("<br><center><h3>Invalid username or password</h3><br>");
    	out.println("<a href='temp.jsp'><button>RETRY</button></a></center>");
    }
    else{
    	out.println("<center>");
    	out.println("<a href='CR.jsp'><button>Course Registration</button></a>");
    	Res=Stmt.executeQuery("select weight from student where roll_no='"+s+"'");
    	Res.next();
        if(Res.getString("weight")==null){
    	out.println("<a href='MR.html'><button>Medical Registration</button></a>");
        }
        else{
        	out.println("<a href='MRcomp.jsp'><button>Medical Registration</button></a>");
        }
    	out.println("<a href='LR.jsp'><button>Library Registration</button></a>");
    	out.println("<a href='room.jsp'><button>Room</button></a>");
    	out.println("<a href='changepassword.html'><button>Change Password</button></a>");
    	out.println("<a href='about.html'><button>About Us</button></a>");
    	out.println("<a href='contact.html'><button>Contact Us</button></a>");
    	out.println("<a href='temp.jsp'><button>LOGOUT</button></a>");
    	out.println("<br><br>");
    	//out.println("<center>");
    	 Res1=Stmt1.executeQuery("select * from personal_details where clg_id='"+s+"'");
    	   Res1.next();
    	    	String s5=Res1.getString("first_name");
    	    	String s6=Res1.getString("last_name"); 
    	    	String s7=Res1.getString("middle_name"); 
    	    	out.println("<h2>Welcome "+s5+" "+s7+" "+s6+"</h2>");
    	    
    	    
    	    out.println("<br><br>");
    	    Res1=Stmt1.executeQuery("select * from student where roll_no='"+s+"'");
    	    out.println("<table>");
    	    Res1.next();
    	    	String s51=Res1.getString("roll_no");
    	    	String s61=Res1.getString("dept_id"); 
    	    	String s71=Res1.getString("year_of_joining"); 
    	    	out.println("<tr><th>ROLL NO</th><td>"+s51+"</td></tr>"+"<tr><th>DEPARTMENT</th><td>"+s61+"</td></tr><tr><th>YEAR OF JOINING</th><td>"+s71+"</td></tr>");
    	   
    	    Res1=Stmt1.executeQuery("select * from personal_details where clg_id=(select teacher_id from student where roll_no='"+s+"')");
    	    Res1.next();
    	    out.println("<tr><th>FACULTY ADVISOR</th><td>Dr."+Res1.getString("first_name")+" "+Res1.getString("middle_name")+" "+Res1.getString("last_name")+"</td></tr>");
    	    out.println("</table>");
    	    out.println("</center>");
            }
      } 

}

    catch (SQLException ex) {
         out.println("An error occurred. Maybe user/password is invalid");
    ex.printStackTrace();
}
%>
</body>


</html>