package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "UserDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class UserDaoTest extends AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    UserDao userDao;
    @Autowired
	ApplicationDao appDao;
    
    // Test case 3 by different method
    @Test
    public void getDepartment()
    {
        assert appDao.getApplicationByUser(userDao.getUserByUsername(4)).size()==1;
    }
    
}