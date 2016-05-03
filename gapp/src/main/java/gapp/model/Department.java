package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "departments")
public class Department implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int dept_id;

	@Column(nullable = false)
	private String dept_name;

	@OneToMany(mappedBy="dept", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Program> programs;
	
	@OneToMany(mappedBy = "dept", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<ExtraRecords> er;
	
	@OneToMany(mappedBy = "dept", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Application> application;
	
	private boolean enabled = true;

	public List<Application> getApplication() {
		return application;
	}

	public void setApplication(List<Application> application) {
		this.application = application;
	}

	public int getDept_id() {
		return dept_id;
	}

	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public List<ExtraRecords> getEr() {
		return er;
	}

	public void setEr(List<ExtraRecords> er) {
		this.er = er;
	}

	public List<Program> getPrograms() {
		return programs;
	}

	public void setPrograms(List<Program> programs) {
		this.programs = programs;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
}
