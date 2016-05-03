package gapp.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="application")
public class Application implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int application_id;
	
	@Column(nullable = false)
	private String term;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private User detail;
	
	private String fname;
	
	private String lname;
	
	private String email;
	
	@Column(name = "cin", nullable = true , unique = true)
	private long CIN;
	
	@Column(nullable = false)
	private long phone;
	
	@Column(nullable = false)
	private boolean gender;
	
	@Column(nullable = false)
	private Date dob;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Department dept;
	
	@Column(nullable = false)
	private String citizenship;
	
	@OneToMany(mappedBy="application", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<EducationalBackground> degree;
	
	@Column(nullable = false)
	private int toefl;
	
	private String submit_date;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private ApplicationStatus status;
	
	@OneToMany(mappedBy="application", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<ExtraRecordField> er_value;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Program program;
	
	@OneToMany(mappedBy="application", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<LogHistory> log;

	public List<ExtraRecordField> getEr_value() {
		return er_value;
	}

	public void setEr_value(List<ExtraRecordField> er_value) {
		this.er_value = er_value;
	}

	public int getApplication_id() {
		return application_id;
	}

	public void setApplication_id(int application_id) {
		this.application_id = application_id;
	}

	public String getTerm() {
		return term;
	}

	public void setTerm(String term) {
		this.term = term;
	}

	public User getDetail() {
		return detail;
	}

	public void setDetail(User detail) {
		this.detail = detail;
	}

	

	public long getCIN() {
		return CIN;
	}

	public void setCIN(long cIN) {
		CIN = cIN;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}


	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}


	public String getCitizenship() {
		return citizenship;
	}

	public void setCitizenship(String citizenship) {
		this.citizenship = citizenship;
	}


	public List<EducationalBackground> getDegree() {
		return degree;
	}

	public void setDegree(List<EducationalBackground> degree) {
		this.degree = degree;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public ApplicationStatus getStatus() {
		return status;
	}

	public void setStatus(ApplicationStatus status) {
		this.status = status;
	}

	public int getToefl() {
		return toefl;
	}

	public void setToefl(int toefl) {
		this.toefl = toefl;
	}

	public Program getProgram() {
		return program;
	}

	public void setProgram(Program program) {
		this.program = program;
	}

	public List<LogHistory> getLog() {
		return log;
	}

	public void setLog(List<LogHistory> log) {
		this.log = log;
	}

	
	public String getSubmit_date() {
		return submit_date;
	}

	public void setSubmit_date(String submit_date) {
		this.submit_date = submit_date;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	
}