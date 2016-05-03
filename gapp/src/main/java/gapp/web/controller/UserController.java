package gapp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import gapp.model.dao.DepartmentDao;
import gapp.model.dao.UserDao;

@Controller
public class UserController {

    @Autowired
    private DepartmentDao departmentDao;

    @RequestMapping("/users.html")
    public String users( ModelMap models )
    {
        models.put( "department",departmentDao.getDepartment());
        return "users";
    }

}
