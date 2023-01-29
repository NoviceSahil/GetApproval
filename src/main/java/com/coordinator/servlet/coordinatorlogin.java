package com.coordinator.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.coordinatorDao;
import com.dao.studentDao;
import com.db.DBConnect;
import com.entity.coordinator;
import com.entity.student;

@WebServlet("/coordinatorlogin")

public class coordinatorlogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		coordinatorDao dao = new coordinatorDao(DBConnect.getConn());
		coordinator co = dao.login(email, password);

		if (co != null) {

			session.setAttribute("coordinatorObj", co);
			resp.sendRedirect("coordinator/home.jsp");
		} else {
			session.setAttribute("error", "Invalid Email and Password");
			resp.sendRedirect("Coordinator.jsp");
		}
	}

}
