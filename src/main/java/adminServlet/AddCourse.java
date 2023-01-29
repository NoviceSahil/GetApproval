package adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.courseDao;
import com.db.DBConnect;
import com.entity.student;

@WebServlet("/addcourse")
public class AddCourse extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String courName = req.getParameter("courName");

		courseDao dao = new courseDao(DBConnect.getConn());
		boolean f = dao.addCourse(courName);

		HttpSession session = req.getSession();

		if (f) {

			session.setAttribute("success", "Course Added");
			resp.sendRedirect("admin/home.jsp");
		} else {
			session.setAttribute("error", "Something Wrong !!");
			resp.sendRedirect("admin/home.jsp");
		}

	}

}
