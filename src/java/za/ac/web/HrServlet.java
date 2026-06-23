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
public class HrServlet extends HttpServlet {
@EJB private StudentFacadeLocal studentFacade;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
List<Student> allStudents = studentFacade.findAll();
List<Student> filtered = new ArrayList<>();

Map<Long, String> decisions = new HashMap<>();

for (Student s : allStudents) {

    String decision = studentFacade.getDecision(s);
    decisions.put(s.getId(), decision);

    // ONLY KEEP READY FOR REVIEW
    if ("READY FOR REVIEW".equals(decision)) {
        filtered.add(s);
    }
}

request.setAttribute("students", filtered);
request.setAttribute("decisions", decisions);

request.getRequestDispatcher("hr.jsp").forward(request, response);
    }
    }