package adminServlet;

import java.io.IOException;
import com.dao.coordinatorDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.entity.coordinator;

@WebServlet("/addcoordinator")

public class addCoordinator extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String fullName = req.getParameter("fullName");
			String department = req.getParameter("department");
			String deptId = req.getParameter("deptId");
			String password = req.getParameter("password");
			String phoneNo = req.getParameter("phoneNo");
			String email = req.getParameter("email");

			coordinator c = new coordinator(fullName, department, deptId, password, phoneNo, email);

			coordinatorDao dao = new coordinatorDao(DBConnect.getConn());
			HttpSession session = req.getSession();

			if (dao.registerCoordinator(c)) {
				session.setAttribute("success", "Coordinator Added Successfully");
				resp.sendRedirect("admin/coordinator.jsp");
			} else {
				session.setAttribute("error", "Something went Wrong");
				resp.sendRedirect("admin/coordinator.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
