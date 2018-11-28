<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<title>event management</title>
<style type="text/css">
body{
  margin:0;
    height: 100%;
    width: 100%;
}
	.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  font-family: verdana;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  transition: .5s ease;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
  transition: .5s ease;
}
.dropdown {
    float: left;
    overflow: hidden;
    transition: .5s;
}

.dropdown .dropbtn {
    font-size: 17px;    
    border: none;
    outline: none;
    color: #f2f2f2;
    background-color: inherit;
    padding: 14px 16px;
    font-family: verdana;
    margin: 0;
    transition: .5s;
}
.dropdown-content {
  transition: .5s ease;
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.8);
    z-index: 1;
}

.dropdown-content a {

    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
}

.dropdown-content a:hover {
    background-color: #ddd;
}
.dropdown:hover .dropdown-content {
    display: block;
}
table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;;
    border-collapse: collapse;
    width: 100%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body bgcolor="#eaecee"><center>
<marquee bgcolor=pink>we are here to manage your events....</marquee>
<h1 style="border: 2px solid pink;border-radius: 20px; text-align: center; width: 40%; background-color: rgba(242,222,220,0.7); font-size: 40px; font-family: verdana; font-weight: lighter; letter-spacing: 4px;color: #f48679;margin-top: 5px;"> EVENTS DONE</h1></center>
<nav class="topnav">
<a href="home.html">Home</a>
<a href="register.html">Sign Up</a>
<a href="contact.html">Contact us</a>
<a href="gallery.html">Gallery</a>
<a href="#event">Events</a>
<a href="registration1.html">Register</a>
<a href="about.html">About Us</a>
<a href="services.html">Our Services</a>
<div class="dropdown">
<button class="dropbtn">Events History</button>
<div class="dropdown-content">
 <a href="show.jsp">totals events</a>
<a href="upcoming.jsp">Upcoming events</a>
<a href="history.jsp">Events done till Date</a>
</div>

</div>
</div>
</nav>
<center>
<table border="1">
    <tr>
        <th><b><h1>User Name</b></h1></th>
        <th><b><h1>Event Name</b></h1></th>
        <th><b><h1>Event Date</b></h1></th>
        <th><b><h1>Event Place</b></h1></th>
        <th><b><h1>Event Time</b></h1></th>
        
    </tr>
   
        <% 
            try{
                String url="jdbc:mysql://localhost:3306/nandini";
                Class.forName("com.mysql.jdbc.Driver");
                 Connection conn=DriverManager.getConnection(url,"root","");
                 String query="select * from users4 where date <= CURRENT_DATE ";
                Statement st=conn.createStatement();
                ResultSet rs=st.executeQuery(query);
        while(rs.next())
        {
        %>
        <tr>
            <td><%=rs.getString("uname")%></td>
            <td><%=rs.getString("ename")%></td>
            <td><%=rs.getString("date")%></td>
            <td><%=rs.getString("place")%></td>
            <td><%=rs.getString("time")%></td>
           
        </tr>
        <%
            }
}
catch(Exception e)
{
e.printStackTrace();
}
  %>  
    
    
</table>
</center>
