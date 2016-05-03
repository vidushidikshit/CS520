package gapp.model.dao.jpa;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Department;
import gapp.model.ExtraRecordField;
import gapp.model.dao.ExtraRecordFieldDao;

@Repository
public class ExtraRecordFeildDaoImpl implements ExtraRecordFieldDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	@Transactional
	public ExtraRecordField saveExtraRecordField(ExtraRecordField erfield) {
		return entityManager.merge(erfield);
	}

	@Override
	public ExtraRecordField geterfeildById(Integer feild_id) {
		return entityManager.find( ExtraRecordField.class , feild_id );
	}

	
}