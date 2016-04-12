package homework1;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DisplayApplication")
public class DisplayApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplayApplication() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		List<Applicant> applicant = new ArrayList<Applicant>();
		DateFormat df = new SimpleDateFormat("M/d/yyyy");

		try {
			applicant.add(new Applicant(1, "John Doe", df.parse("10/21/2015"), 3.1, "Pending Review"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			applicant.add(new Applicant(2, "Jane Doe", df.parse("3/20/2015"), 0.0, "Application Incomplete"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			applicant.add(new Applicant(3, "Amy Smith", df.parse("3/1/2015"), 3.3, "Accepted"));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		getServletContext().setAttribute("applicant", applicant);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Applicant> applicant = (List<Applicant>) getServletContext().getAttribute("applicant");
		// by default application received on should be sorted in descending
		// order
		Collections.sort(applicant, new Comparator<Applicant>() {

			@Override
			public int compare(Applicant app1, Applicant app2) {
				// TODO Auto-generated method stub
				return app2.getRecieved().compareTo(app1.getRecieved());
			}
		});

		String param = request.getParameter("param");
		if (param == null) {
			getServletContext().setAttribute("applicant", applicant);

			request.getRequestDispatcher("homework1/DisplayApplication.jsp").forward(request, response);

		} else {
			if (param.equals("name")) {
				// name in ascending order
				Collections.sort(applicant, new Comparator<Applicant>() {

					@Override
					public int compare(Applicant app1, Applicant app2) {
						// TODO Auto-generated method stub
						return app1.getName().compareToIgnoreCase(app2.getName());
					}
				});
			}
			else if (param.equals("date")) {
				Collections.sort(applicant, new Comparator<Applicant>() {

					@Override
					public int compare(Applicant app1, Applicant app2) {
						// TODO Auto-generated method stub
						return app2.getRecieved().compareTo(app1.getRecieved());
					}
				});
			}
			
			else if (param.equals("gpa")) {
				// gpa in descending order
				Collections.sort(applicant, new Comparator<Applicant>() {

					@Override
					public int compare(Applicant o1, Applicant o2) {
						// TODO Auto-generated method stub
						  return new Double(o2.getGpa()).compareTo(o1.getGpa());
					}
				});
			} else {
				//status in ascending order
				Collections.sort(applicant, new Comparator<Applicant>() {

					@Override
					public int compare(Applicant app1, Applicant app2) {
						// TODO Auto-generated method stub
						return app1.getStatus().compareTo(app2.getStatus());
					}
				});
			}
			getServletContext().setAttribute("applicant", applicant);

			request.getRequestDispatcher("homework1/DisplayApplication.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// doGet(request, response);
	}

}
