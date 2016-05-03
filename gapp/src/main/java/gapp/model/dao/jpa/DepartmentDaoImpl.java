package gapp.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import gapp.model.Department;
import gapp.model.User;
import gapp.model.dao.DepartmentDao;

@Repository
public class DepartmentDaoImpl implements DepartmentDao {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<Department> getDepartment()
    {
        return entityManager.createQuery( "from Department order by dept_id", Department.class )
            .getResultList();
    }

	@Override
	public Department getDepartmentByName(Integer id) {
		
		
		Department results = entityManager.find( Department.class , id );
	        return results;
		
	}



	@Override
	@Transactional
	public void saveDepartment(Department dept) {
		entityManager.merge(dept);
		
	}

	@Override
	public List<Department> getDepartmentByDepartmentname(String dept_name) {

		String Query = "from Department d where d.dept_name= :dept_name";
		
		List<Department> results = entityManager.createQuery(Query,Department.class).setParameter("dept_name", dept_name).getResultList();
        return results;		
	}

	



}