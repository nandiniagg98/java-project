/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.http.*;

/**
 *
 * @author hp
 */
public class registration extends HttpServlet {


    public void processRequest(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        res.setContentType("text/html;charset=UTF-8");
        PrintWriter out = res.getWriter();
        try{
        String ename2 = req.getParameter("ename");
        String sname2 = req.getParameter("uname");
        String date2 = req.getParameter("date");
        String place2 = req.getParameter("place");    
        String time2 = req.getParameter("time");
        String con2 = req.getParameter("con");
        
        Class.forName("com.mysql.jdbc.Driver");
            try (Connection cons = DriverManager.getConnection("jdbc:mysql://localhost:3306/nandini","root","")) {
                Statement st=cons.createStatement();
                String query="insert into users4(ename,uname,date,place,time,con)" + "values(?,?,?,?,?,?)";
                
                PreparedStatement ps=cons.prepareStatement(query);
                ps.setString(1,ename2);
                ps.setString(2,sname2);
                ps.setString(3,date2);
                ps.setString(4,place2);
                ps.setString(5,time2);
                ps.setString(6,con2);
                
                
                ps.execute();
                  }
       res.sendRedirect("home.html");
    //   ResultSet rs = ps.executeQuery();
       
}
        catch(Exception e)
        {
        out.println("error!");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
