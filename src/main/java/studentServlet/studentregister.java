package studentServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.studentDao;
import com.db.DBConnect;
import com.entity.student;

@WebServlet("/student_register")

public class studentregister extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String fullName = req.getParameter("fullName");
			String roll_no = req.getParameter("roll_no");
			String email = req.getParameter("email");
			String branch = req.getParameter("branch");
			String password = req.getParameter("password");

			student s = new student(fullName, roll_no, email, branch, password);

			studentDao dao = new studentDao(DBConnect.getConn());

			HttpSession session = req.getSession();

			boolean f = dao.register(s);

			if (f) {
				session.setAttribute("success", "Registered Successfully");
				resp.sendRedirect("Student.jsp");
			} else {
				session.setAttribute("error", "Something wrong on Server");
				resp.sendRedirect("signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
