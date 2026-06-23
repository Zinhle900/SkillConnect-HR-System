/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package za.ac.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
public class ReportServlet extends HttpServlet {
    @EJB private StudentFacadeLocal studentFacade;


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        List<Student> all = studentFacade.findAll();

        List<Student> qualified = new ArrayList<>();
        Map<Long, String> decisions = new HashMap<>();

        for (Student s : all) {

            String decision = studentFacade.getDecision(s);
            decisions.put(s.getId(), decision);

            if (decision != null && decision.contains("READY FOR REVIEW")) {
                qualified.add(s);
            }
        }

        request.setAttribute("students", qualified);
        request.setAttribute("decisions", decisions);

        request.getRequestDispatcher("report.jsp")
               .forward(request, response);
    }
    
}