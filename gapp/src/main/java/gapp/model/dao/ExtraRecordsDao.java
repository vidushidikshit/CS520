package gapp.model.dao;

import java.util.List;
import gapp.model.ExtraRecords;


public interface ExtraRecordsDao {
	 
	List<ExtraRecords> getExtraRecordsByName(String rec_name);

	void saveRequirement( ExtraRecords req);
	
	void deleteRequirement(ExtraRecords req);
	
	ExtraRecords getRecords(Integer id);
	}
