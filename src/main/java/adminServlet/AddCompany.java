package adminServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.companyDao;
import com.db.DBConnect;

@WebServlet("/addCompany")
public class AddCompany extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String companyname = req.getParameter("companyName");
			companyDao dao = new companyDao(DBConnect.getConn());
			boolean f = dao.addCompany(companyname);
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("success", "Company Added");
				resp.sendRedirect("admin/companyList.jsp");
			} else {
				session.setAttribute("error", "Server Error");
				resp.sendRedirect("admin/companyList.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}