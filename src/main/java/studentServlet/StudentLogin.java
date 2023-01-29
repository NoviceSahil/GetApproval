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

@WebServlet("/studentlogin")

public class StudentLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");

			HttpSession session = req.getSession();

			studentDao dao = new studentDao(DBConnect.getConn());
			student student_id = dao.login(email, password);

			if (student_id != null) {

				session.setAttribute("studentObj", student_id);

				resp.sendRedirect("Home.jsp");
			} else {
				session.setAttribute("error", "Invalid Email and Password");
				resp.sendRedirect("Student.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
