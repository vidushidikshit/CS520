package gapp.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="extra_record_field")
public class ExtraRecordField implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private int record_feild_id;
	
	@Column(nullable = true)
	private String feild_value;
	
	@Column(nullable = true)
	private byte[] fileupload;
	
	@Column(nullable = true)
	private String fileupload_name;
	
	private boolean enabled =true;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private ExtraRecords extrarec;
	
	@ManyToOne(cascade={CascadeType.PERSIST, CascadeType.MERGE})
	private Application application;

	public int getRecord_feild_id() {
		return record_feild_id;
	}

	public void setRecord_feild_id(int record_feild_id) {
		this.record_feild_id = record_feild_id;
	}

	public String getFeild_value() {
		return feild_value;
	}

	public void setFeild_value(String feild_value) {
		this.feild_value = feild_value;
	}

	public ExtraRecords getExtrarec() {
		return extrarec;
	}

	public void setExtrarec(ExtraRecords extrarec) {
		this.extrarec = extrarec;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	

	public byte[] getFileupload() {
		return fileupload;
	}

	public void setFileupload(byte[] fileupload) {
		this.fileupload = fileupload;
	}

	public String getFileupload_name() {
		return fileupload_name;
	}

	public void setFileupload_name(String fileupload_name) {
		this.fileupload_name = fileupload_name;
	}
	
	
}
