package gapp.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import gapp.model.Role;
import gapp.model.User;
import gapp.model.dao.RoleDao;

@Repository
public class RoleDaoImpl implements RoleDao{

	
	@PersistenceContext
    private EntityManager entityManager;
	
	@Override
	public Role getRole(Integer id) {
		return entityManager.find(Role.class, id );
		
	}

}
