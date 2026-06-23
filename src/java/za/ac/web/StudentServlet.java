/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import za.entities.Student;
import za.entities.StudentFacadeLocal;

/**
 *
 * @author tswar
 */
public class StudentServlet extends HttpServlet {
@EJB private StudentFacadeLocal studentFacade;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
          if (studentFacade == null) {
            throw new RuntimeException("EJB NOT INJECTED - check deployment");
        }

         Student s = new Student();

        s.setName(request.getParameter("name"));
        s.setSkills(request.getParameter("skills"));
        s.setProjects(request.getParameter("projects"));
        s.setLanguages(request.getParameter("languages"));
        s.setCertifications(request.getParameter("certifications"));

        studentFacade.create(s);

         
        response.sendRedirect("success.html");
    }
       
}
