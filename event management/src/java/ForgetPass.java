
import java.io.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.ResultSet;


public class ForgetPass extends HttpServlet {
   
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException,ServletException {
        res.setContentType("text/html; charset=UTF-8");
        //PrintWriter out=res.getWriter();
        String username = req.getParameter("uname");
        String pass=req.getParameter("pswl");
        String sl = "";
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nandini", "root", "");
            Statement st=con.createStatement();
            
            ResultSet rs = st.executeQuery("Select uname,pswl from users1 where uname='"+username+"'");
            if(rs.next())
            {
                String query="UPDATE users1 SET pswl = '"+pass+"' where uname='"+username+"'";
                int i=st.executeUpdate(query);
                res.sendRedirect("index.html");
            }
            else
            {
                res.sendRedirect("forget.html");
            }
        }
        catch(ClassNotFoundException | SQLException e)
        {
            //out.print(e);
        }
    }
}
            