import java.io.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.sql.ResultSet;

/**
 *
 * @author hp
 */
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException
    {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out=res.getWriter();
        String username = req.getParameter("uname");
        String pass = req.getParameter("pswl");
        
        String s1="";
        String s2="";
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/nandini","root","");
        Statement st=con.createStatement();
        
        ResultSet rs= st.executeQuery("Select * from users1");
        
        int flag=0;
        while(rs.next())
        {
            s1=rs.getString("uname");
            s2=rs.getString("pswl");
            
            if(username.equals(s1)&&pass.equals(s2))
            {
              //  out.print("Welcome"+"\n");
                flag=1;
           
               
            }
            else if(username.equals("admin")&&pass.equals("admin123"))
            {
                flag=2;
            }
            else
            {
                
            }
        }
            if(flag==1)
            {
                 res.sendRedirect("home.html");
            }
            else if(flag==2)
            {
                 res.sendRedirect("home.html");
            }
            else{
                 res.sendRedirect("index.html");
                
        }
        }
        catch (IOException  |  ClassNotFoundException   | SQLException  e)
        {
          //  out.print(e);
        }
    }
}
   
