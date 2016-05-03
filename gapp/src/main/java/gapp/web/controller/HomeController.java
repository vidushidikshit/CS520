package gapp.web.controller;


import java.util.List;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import gapp.model.Application;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.RoleDao;
import gapp.model.dao.UserDao;
import gapp.web.validator.LoginValidator;
import gapp.web.validator.RegisterValidator;

@Controller
@SessionAttributes("user1")
public class HomeController {

	@Autowired
	UserDao userDao;

	@Autowired
	RoleDao roleDao;
	
	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private RegisterValidator userValidator;
	
	@Autowired
	private LoginValidator loginValidator;

	@RequestMapping(value = { "/index.html", "/Login.html" }, method = RequestMethod.GET)
	public String login(ModelMap model, User user) {
		model.put("user1", new User());
		return "Login";
	}

	@RequestMapping(value = { "/index.html", "/Login.html" }, method = RequestMethod.POST)
	public String login(@ModelAttribute User user, ModelMap model, HttpSession session,BindingResult result) throws Exception {
		
		loginValidator.validate(user, result);
		if (result.hasErrors())
			return "Login";
		
		if (userDao.getUserByUsername(user.getUsername()).size() > 0) {

			User user1 = userDao.getUserForPasswordCheck(user.getUsername());
			//User user2 = userDao.getUser(user.getUser_id());
			if (!user1.getPassword().equals(user.getPassword())) {
				model.put("message", "Invalid Password");
				return "Login";
			} else {

				if (user1.getRole().getRole_id() == 1) {
					session.setAttribute("user1", user1);
					return "redirect:Admin.html";
				} else if (user1.getRole().getRole_id() == 2) {
					session.setAttribute("user1", user1);
					return "redirect:Staff.html";
				} else {
					//session.setAttribute("user1", user1);
					model.put("user1", user1);
					//Exception ex = new Exception("Just kidding");
					//throw ex;
					//List<Application> application = applicationDao.getApplicationByUserId(user2.getUser_id());
					//model.put("application", application);
					return "redirect:Student.html";
				}
			}
		} else {
			model.put("message", "Invalid Account Details");
			return "Login";
		}

	}

	@RequestMapping(value = "/Register.html", method = RequestMethod.GET)
	public String register(ModelMap model, User user) {
		model.put("user", new User());
		model.put("user", user);
		return "Register";
	}

	@RequestMapping(value = "/Register.html", method = RequestMethod.POST)
	public String register(@ModelAttribute("user") User user, ModelMap model, BindingResult result) {
		userValidator.validate(user, result);
		if (result.hasErrors())
			return "Register";
		/*
		 * try{ user.setRole(roleDao.getRole(3)); userDao.saveUser(user); return
		 * "redirect:Login.html"; }catch(Exception ex){
		 * //System.out.println(ex.getMessage()); model.put("error",
		 * "Account already exist"); return"Register"; }
		 */

		if (userDao.getUserByUsername(user.getUsername()).size() > 0) {
			model.put("error", "Account already exist");
			return "Register";
		} else {
			user.setRole(roleDao.getRole(3));
			userDao.saveUser(user);
			return "redirect:Login.html";
		}

	}

	@RequestMapping(value = "/Admin.html", method = RequestMethod.GET)
	public String admin(ModelMap model) {

		return "Admin";
	}

	@RequestMapping(value = "/Staff.html", method = RequestMethod.GET)
	public String staff(ModelMap model) {

		return "Staff";
	}

	@RequestMapping(value = "/Student.html", method = RequestMethod.GET)
	public String student(ModelMap model, HttpSession session) {
		
	    //User user1 =  (User)session.getAttribute("user1");
		User user1 = (User)model.get("user1");
		
		//List<Application> app= user1.getApplication();
		List<Application> app = applicationDao.getApplicationByUserId(user1.getUser_id());
		model.put("application", app);
		
		return "Student";
	}

	@RequestMapping(value = "/logout.html", method = RequestMethod.GET)
	public String logout(SessionStatus session) {
		session.isComplete();
		return "redirect:Login.html";
	}
}
