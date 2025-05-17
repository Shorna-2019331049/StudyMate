/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import dao.userDao;
import entities.User;
import helper.ConnectionProvider;
import helper.Message;
import helper.profilePicHelper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
//            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
//            fetch all data from edit-profile
            String userName = request.getParameter("userName");
            System.out.println(userName + "done");
            String name = request.getParameter("name");
            String userPassword = request.getParameter("userPassword");
            Part part = request.getPart("userProfile");
            System.out.println(part);
            String imgName = part.getSubmittedFileName();
            System.out.println("img"+imgName+"name");

//            get the user from the session...
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setName(name);
            user.setUserName(userName);
            user.setUserPassword(userPassword);
            String oldFile = user.getProfile();
            if (!imgName.equals("")) {
                System.out.println("notNull");
                user.setProfile(imgName);
            }
//            update database...
            userDao userDao = new userDao(ConnectionProvider.getConnection());
            boolean f = userDao.updateUser(user);
            if (f) {
                System.out.println("updated to DB");
                String path = request.getRealPath("/") + "img" + File.separator + user.getProfile();

//                Delete
//                String pathOldFile = request.getRealPath("/") + "img" + File.separator + oldFile;
//             
//                if(!oldFile.equals("default.jpg"));
//                profilePicHelper.deleteFile(pathOldFile);
                if (!(imgName.equals(""))) {
                    if (profilePicHelper.saveFile(part.getInputStream(), path)) {
                        System.out.println("Profile updated");
//                    Message msg = new Message("Profile details updated..", "success", "alert-success") {
//                    };
//                    s.setAttribute("msg", msg);
                    } else {
                        System.out.println("No update");
//                    Message msg = new Message("Something went wrong!!", "error", "alert-danger") {
//                    };
//                    s.setAttribute("msg", msg);
                    }
                }

            } else {
                System.out.println("not updated");
//                Message msg = new Message("Something went wrong!!", "error", "alert-danger") {
//                };
//                s.setAttribute("msg", msg);
            }
            response.sendRedirect("adminProfile.jsp");

//            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
