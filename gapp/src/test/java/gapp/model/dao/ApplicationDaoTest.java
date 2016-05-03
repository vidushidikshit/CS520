package gapp.model.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests;
import org.testng.annotations.Test;

@Test(groups = "ApplicationDaoTest")
@ContextConfiguration(locations = "classpath:applicationContext.xml")
public class ApplicationDaoTest extends AbstractTransactionalTestNGSpringContextTests {

	@Autowired
	ApplicationDao appDao;
	@Autowired
	DepartmentDao  deptDao;
	
	//Test Case 2 by getting objects from different classes and comparing by id
	@Test
    public void getDepartment()
    {
        //assert appDao.getApplicationByDepartment(deptDao.getDepartmentByName(1), "Fall2016").size()==1;
    }
	//Test Case 2 by join Query and comparing by name 
	@Test
	 public void getApplication()
    {
      //  assert appDao.getApplications("Accounting", "Fall2016").size()==1;
    }
	
	//Test Case 3  
	@Test
	public void getApplicationByUser()
	{
		//assert appDao.getApplicationByUser("student1@localhost.localdomain").size()==1;
	}
}
