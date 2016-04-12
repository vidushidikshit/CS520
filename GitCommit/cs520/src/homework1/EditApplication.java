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

/**
 * Servlet implementation class EditApplication
 */
@WebServlet("/EditApplication")
public class EditApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditApplication() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
		int id = Integer.parseInt(request.getParameter("id"));
		request.setAttribute("id", id);
		request.getRequestDispatcher("homework1/EditApplication.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// doGet(request, response);
		List<Applicant> applicant = (List<Applicant>) getServletContext().getAttribute("applicant");
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name").trim();
		String date = request.getParameter("date").trim();
		double gpa1;
		String gpa = request.getParameter("gpa").trim();
		if(gpa.isEmpty())
			gpa1=0.0;
		else
			gpa1=Double.parseDouble(gpa);
		String status = request.getParameter("status");
		// DateFormat df = new SimpleDateFormat("M/d/yyyy");
		DateFormat df = new SimpleDateFormat("M/d/yyyy");
		Date date1 = new Date();
		try {
			date1 = df.parse(date);
			for(Applicant applicants:applicant){
				if(applicants.getId()==id){
					applicants.setId(id);
					applicants.setName(name);
					applicants.setRecieved(date1);
					applicants.setGpa(gpa1);
					applicants.setStatus(status);
					
				}
			}
			getServletContext().setAttribute("applicant", applicant);
			response.sendRedirect("DisplayApplication");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			//e1.printStackTrace();
			request.setAttribute("errormessage", e1.getMessage());
			request.setAttribute("id", id);
			request.getRequestDispatcher("homework1/EditApplication.jsp").forward(request, response);
			
		}
		//System.out.println("hello");
		
	
	}

}
