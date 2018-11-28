<%-- 
    Document   : welcome
    Created on : 14 Nov, 2018, 8:27:27 PM
    Author     : HP
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOGIN</title>
    </head>
    <body>
        <%
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            
            
            
            try
            {
                String myUrl = "jdbc:mysql://localhost:3306/nandini";
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection(myUrl,"root","");
            //out.println("Hello 1");
                String query = "Select uname,pswl from users1 where uname='"+uname+"' and pswl ='"+pass+"'";
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery(query);
                
               if(rs.next())
                {
                    out.println("Logged in successfully");
                   out.print("Hello "+uname);}
               else
                   out.println("Username or Password does not exists");
                st.close();
            }
            catch(ClassNotFoundException e)
            {
                out.print(e);
            }
            catch(SQLException e)
            {
                out.print(e);
            }
            
           %>
            <p>
            Today's Date:<%=(new java.util.Date())%>
            
        </p>
    </body>
</html>
