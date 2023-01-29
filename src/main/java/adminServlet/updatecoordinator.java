package adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.coordinator;
import com.dao.coordinatorDao;
import com.db.DBConnect;

@WebServlet("/updateCoordinator")
public class updatecoordinator extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String fullName = req.getParameter("fullName");
			String department = req.getParameter("department");
			String deptId = req.getParameter("deptId");
			String password = req.getParameter("password");
			String phoneNo = req.getParameter("phoneNo");
			String email = req.getParameter("email");

			coordinator d = new coordinator(id, fullName, department, deptId, password, phoneNo, email);
			coordinatorDao dao = new coordinatorDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			if (dao.updateCoordinator(d)) {
				session.setAttribute("success", "Coordinator Updated Successfully");
				resp.sendRedirect("admin/coordinator.jsp");
			} else {
				session.setAttribute("error", "Server Error");
				resp.sendRedirect("admin/coordinator.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}