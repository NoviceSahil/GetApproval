package adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.coordinatorDao;
import com.db.DBConnect;

@WebServlet("/deletecoordinator")

public class deletecoordinator extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int id = Integer.parseInt(req.getParameter("id"));

		coordinatorDao dao = new coordinatorDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.deletecoordinator(id)) {
			session.setAttribute("success", "Coordinator Deleted Successfully");
			resp.sendRedirect("admin/coordinator.jsp");
		} else {
			session.setAttribute("error", "Something went Wrong");
			resp.sendRedirect("admin/coordinator.jsp");
		}
	}

}
