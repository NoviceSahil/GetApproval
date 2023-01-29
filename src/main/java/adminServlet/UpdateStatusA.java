package adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DBConnect;
import com.dao.NocDao;

@WebServlet("/updatestatusA")
public class UpdateStatusA extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));

			String comment = req.getParameter("comment");
			NocDao dao = new NocDao(DBConnect.getConn());
			HttpSession session = req.getSession();
			if (dao.updateCommentStatus(id, comment)) {
				session.setAttribute("success", "Comment Update");
				resp.sendRedirect("admin/nocA.jsp");
			} else {
				session.setAttribute("error", "Server error");
				resp.sendRedirect("admin/nocA.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
