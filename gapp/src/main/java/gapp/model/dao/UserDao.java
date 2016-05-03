package gapp.model.dao;

import java.util.List;

import gapp.model.User;

public interface UserDao {
	User getUser( Integer id );
	
	List<User> getUsers();
	
    User getUserByUsername(Integer username);
    
    User getUserByUsernamePassword(String username, String password);
    
    List<User> getUserByUsername(String username);
    
    void saveUser(User user);
    
    User getUserByRole(Integer role_id);
    
   User getUserForPasswordCheck(String username);
    
    

}