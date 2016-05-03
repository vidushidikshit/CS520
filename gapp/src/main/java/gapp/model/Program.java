package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "programs")
public class Program implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private int prg_id;
	
	private String prg_name;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Department dept;
	
	@OneToMany(mappedBy="program")
	private List<Application> application;
	
	private boolean enabled = true;
	
	public List<Application> getApplication() {
		return application;
	}

	public void setApplication(List<Application> application) {
		this.application = application;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public int getPrg_id() {
		return prg_id;
	}

	public void setPrg_id(int prg_id) {
		this.prg_id = prg_id;
	}

	public String getPrg_name() {
		return prg_name;
	}

	public void setPrg_name(String prg_name) {
		this.prg_name = prg_name;
	}

	
	
}
