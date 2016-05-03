package gapp.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import gapp.model.User;
import gapp.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

    @PersistenceContext
    private EntityManager entityManager;    

    @Override
    public User getUser( Integer id )
    {
        return entityManager.find( User.class, id );
    }
    
    @Override
    public List<User> getUsers()
    {
        return entityManager.createQuery( "from User order by id", User.class )
            .getResultList();
    }
    
    
	@Override
	public User getUserByUsername(Integer username) {
		User results= entityManager.find(User.class, username);
		
		
		return results;
	}

	@Override
	@Transactional
	public void saveUser(User user) {
		entityManager.merge(user);
	}

	@Override
	public User getUserByUsernamePassword(String username, String password) {
		String Query = "from User u where u.username= :username and u.password = :password";
		
	
	return entityManager.createQuery(Query,User.class).setParameter("username", username).setParameter("password", password).getSingleResult();
	
	        
	}

	@Override
	public List<User> getUserByUsername(String username) {
		String Query = "from User u where u.username= :username";
		
		List<User> results = entityManager.createQuery(Query,User.class).setParameter("username", username).getResultList();
        return results;		
	}
	
	

	@Override
	public User getUserByRole(Integer role_id) {
			String Query = "from User u where u.role.role_id= :role_id";
		
		User results = (User) entityManager.createQuery(Query,User.class).setParameter("role_id", role_id);
        return results;	
	}

	@Override
	public User getUserForPasswordCheck(String username) {

		String Query = "from User u where u.username= :username";
		
		User results = entityManager.createQuery(Query,User.class).setParameter("username", username).getSingleResult();
        return results;		
	}

	
	

    

}