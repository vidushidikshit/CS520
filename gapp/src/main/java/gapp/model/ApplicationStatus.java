package gapp.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "appstatus")
public class ApplicationStatus implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int status_id;

	private String status_name;
	
	@OneToMany(mappedBy="status", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<Application> application;

	public int getStatus_id() {
		return status_id;
	}

	public void setStatus_id(int status_id) {
		this.status_id = status_id;
	}

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

	public List<Application> getApplication() {
		return application;
	}

	public void setApplication(List<Application> application) {
		this.application = application;
	}

	
	
	

	

}
