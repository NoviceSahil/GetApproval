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

@WebServlet("/changespassword")

public class change_spassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int sid = Integer.parseInt(req.getParameter("sid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");

		studentDao dao = new studentDao(DBConnect.getConn());
		HttpSession session = req.getSession();

		if (dao.checkOldPassword(sid, oldPassword)) {

			if (dao.changePassword(sid, newPassword)) {
				session.setAttribute("success", "Password Changed Sucessfully");
				resp.sendRedirect("change_spassword.jsp");

			} else {
				session.setAttribute("error", "Server Error");
				resp.sendRedirect("change_spassword.jsp");
			}
		} else {
			session.setAttribute("error", "Old Password Incorrect");
			resp.sendRedirect("change_spassword.jsp");
		}

	}
}
