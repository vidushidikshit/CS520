package homework1;

import java.util.Comparator;
import java.util.Date;

public class Applicant {
	int id;
	String name;
	Date recieved;
	double gpa;
	String status;

	public Applicant(int id, String name, Date date, double gpa, String status) {
		this.id = id;
		this.name = name;
		this.recieved = date;
		this.gpa = gpa;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRecieved() {
		return recieved;
	}

	public void setRecieved(Date recieved) {
		this.recieved = recieved;
	}

	public double getGpa() {
		return gpa;
	}

	public void setGpa(double gpa) {
		this.gpa = gpa;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	/*//name in ascending order
	public static Comparator<Applicant> applicantComparator = new Comparator<Applicant>() {

		@Override
		public int compare(Applicant app1, Applicant app2) {
			// TODO Auto-generated method stub
			return app1.getName().compareTo(app2.getName());
		}
	};
	//gpa in descending order
	public static Comparator<Applicant> gpaComparator = new Comparator<Applicant>() {

		@Override
		public int compare(Applicant o1, Applicant o2) {
			// TODO Auto-generated method stub
			return (int) (o2.getGpa() - o1.getGpa());
		}
    };
    //status in ascending order
    public static Comparator<Applicant> statusComparator = new Comparator<Applicant>() {

		@Override
		public int compare(Applicant app1, Applicant app2) {
			// TODO Auto-generated method stub
			return app1.getStatus().compareTo(app2.getStatus());
		}
	};*/
    
    
}

