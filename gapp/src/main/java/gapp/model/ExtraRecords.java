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
@Table(name = "extra_records")
public class ExtraRecords implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private int rec_id;
	
	private String rec_name;

	private String rec_type;
	
	private boolean required;
	
	private boolean enabled = true;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Department dept;
	
	@OneToMany(mappedBy="extrarec", cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private List<ExtraRecordField> er_value;
	
	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public int getRec_id() {
		return rec_id;
	}

	public void setRec_id(int rec_id) {
		this.rec_id = rec_id;
	}

	public String getRec_name() {
		return rec_name;
	}

	public void setRec_name(String rec_name) {
		this.rec_name = rec_name;
	}

	public String getRec_type() {
		return rec_type;
	}

	public void setRec_type(String rec_type) {
		this.rec_type = rec_type;
	}

	public boolean isRequired() {
		return required;
	}

	public void setRequired(boolean required) {
		this.required = required;
	}

	public List<ExtraRecordField> getEr_value() {
		return er_value;
	}

	public void setEr_value(List<ExtraRecordField> er_value) {
		this.er_value = er_value;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
}