package gapp.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.ExtraRecords;
import gapp.model.Program;
import gapp.model.dao.ExtraRecordsDao;
import gapp.model.dao.ProgramDao;

@Repository
public class ExtraRecordsDaoImpl implements ExtraRecordsDao {

    @PersistenceContext
    private EntityManager entityManager;

	@Override
	public List<ExtraRecords> getExtraRecordsByName(String rec_name) {
		String Query = "from ExtraRecords r where r.rec_name=:rec_name";
		
		List<ExtraRecords> results = entityManager.createQuery(Query,ExtraRecords.class).setParameter("rec_name", rec_name).getResultList();
		
		return results;
	}

	@Override
	@Transactional
	public void saveRequirement(ExtraRecords req) {
		entityManager.merge(req);

	}

	@Override
	@Transactional
	public void deleteRequirement(ExtraRecords req) {
		entityManager.remove(req);
		
	}

	@Override
	public ExtraRecords getRecords(Integer id) {
		return entityManager.find( ExtraRecords.class, id );
		
	}



}