<%-- 
    Document   : reg-process
    Created on : 14 Nov, 2018, 8:10:51 PM
    Author     : HP
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String uname=request.getParameter("uname");
String email=request.getParameter("email");
String pswl=request.getParameter("pass");
String mbn=request.getParameter("mbn");
try
{
    Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/nandini", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into users1(uname,email,pswl,mbn)values('"+uname+"','"+email+"','"+pswl+"','"+mbn+"')");
out.println("Thank you for register ! Please <a href='index.html'>Login</a> to continue.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>

