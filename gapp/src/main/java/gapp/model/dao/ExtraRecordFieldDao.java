package gapp.model.dao;

import gapp.model.ExtraRecordField;

public interface ExtraRecordFieldDao {
	
	ExtraRecordField saveExtraRecordField(ExtraRecordField erfield);
	
	ExtraRecordField geterfeildById(Integer feild_id);
	}
