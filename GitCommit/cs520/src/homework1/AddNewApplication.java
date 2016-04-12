package homework1;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddNewApplication")
public class AddNewApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNewApplication() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		request.getRequestDispatcher("homework1/AddNewApplication.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		List<Applicant> applicant = (List<Applicant>) getServletContext().getAttribute("applicant");
		String name = request.getParameter("name").trim();
		String date = request.getParameter("date").trim();
		double gpa1;
		String gpa = request.getParameter("gpa").trim();
		
		if (gpa.isEmpty())
			gpa1 = 0.0;
		else
			gpa1 = Double.parseDouble(gpa);
		
		String status = request.getParameter("status");
		// DateFormat df = new SimpleDateFormat("M/d/yyyy");
		DateFormat df = new SimpleDateFormat("M/d/yyyy");
		Date date1;
		try {
			date1 = df.parse(date);
			applicant.add(new Applicant(applicant.size() + 1, name, date1, gpa1, status));
			getServletContext().setAttribute("applicant", applicant);
			response.sendRedirect("DisplayApplication");
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			// e1.printStackTrace();
			request.setAttribute("errormessage", e1.getMessage());
			request.getRequestDispatcher("homework1/AddNewApplication.jsp").forward(request, response);
		}
	}

}
