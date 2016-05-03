package gapp.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import gapp.model.Department;
import gapp.model.ExtraRecords;
import gapp.model.Program;
import gapp.model.User;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.ExtraRecordsDao;
import gapp.model.dao.ProgramDao;
import gapp.web.validator.DepartmentValidator;
import gapp.web.validator.ExtraRecordsValidator;
import gapp.web.validator.ProgramValidator;
import gapp.web.validator.RegisterValidator;

@Controller

public class AdminController {

	@Autowired
	private DepartmentDao departmentDao;

	@Autowired
	private ProgramDao programDao;

	@Autowired
	private ExtraRecordsDao extrarecordsDao;
	
	@Autowired
	private ProgramValidator prgValidator;
	
	@Autowired
	private ExtraRecordsValidator erValidator;
	
	@Autowired
	private DepartmentValidator deptValidator;

	@RequestMapping(value = "/ViewDepartments.html", method = RequestMethod.GET)
	public String ViewDepartment(ModelMap models) {

		List<Department> dept = departmentDao.getDepartment();

		models.put("dept", dept);
		return "ViewDepartments";
	}

	@RequestMapping(value = "/ViewDetails.html", method = RequestMethod.GET)
	public String ViewDetails(ModelMap models, Integer dept_id, HttpServletRequest request) {
		Department dept = departmentDao.getDepartmentByName(dept_id);

		models.put("dept", dept);
		return "ViewDetails";
	}

	@RequestMapping(value = "/AddDepartment.html", method = RequestMethod.GET)
	public String addDepartment(ModelMap model) {
		List<Department> displaydept = departmentDao.getDepartment();

		model.put("displaydept", displaydept);
		model.put("dept", new Department());
		return "AddDepartment";
	}

	@RequestMapping(value = "/AddDepartment.html", method = RequestMethod.POST)
	public String addDepartment(ModelMap model, @ModelAttribute("dept") Department dept,BindingResult result) {
		
		deptValidator.validate(dept, result);
		if (result.hasErrors()){
			List<Department> displaydept = departmentDao.getDepartment();
			model.put("displaydept", displaydept);
			model.put("dept", new Department());
			return "AddDepartment";
		}

		if (departmentDao.getDepartmentByDepartmentname(dept.getDept_name()).size() > 0) {
			model.put("error", "Department already exist");
			List<Department> displaydept = departmentDao.getDepartment();
			model.put("displaydept", displaydept);
			return "AddDepartment";
		} else {
			departmentDao.saveDepartment(dept);
			List<Department> displaydept = departmentDao.getDepartment();
			model.put("displaydept", displaydept);
			model.put("dept", new Department());
			return "AddDepartment";
			
		}
	}
	
	@RequestMapping(value = "/Add.html", method = RequestMethod.GET)
	public String Add(ModelMap models) {

		List<Department> dept = departmentDao.getDepartment();

		models.put("dept", dept);
		return "Add";
	}

	
	
	@RequestMapping(value = "/AddProgram.html", method = RequestMethod.GET)
	public String addProgram(ModelMap model, Integer dept_id) {
		model.put("prg", new Program());
		model.put("dept_id", dept_id);
		Department dept = departmentDao.getDepartmentByName(dept_id);
		model.put("dept", dept);
		return "AddProgram";
	}

	@RequestMapping(value = "/AddProgram.html", method = RequestMethod.POST)
	public String addProgram(ModelMap model, @ModelAttribute("prg") Program prg, HttpServletRequest request,BindingResult result) {
		Integer dept_id = Integer.parseInt(request.getParameter("dept_id"));
		prgValidator.validate(prg, result);
		if (result.hasErrors()){
			Department dept = departmentDao.getDepartmentByName(dept_id);
			model.put("dept", dept);
			return "AddProgram";
		}
		
		if (programDao.getProgramByProgramname(prg.getPrg_name()).size() > 0) {
			model.put("error", "Program already exist");
			return "AddProgram";
		} else {
			prg.setDept(departmentDao.getDepartmentByName(dept_id));
			programDao.saveProgram(prg);
			Department dept = departmentDao.getDepartmentByName(dept_id);
			model.put("dept", dept);
			model.put("prg", new Program());
			return "AddProgram";
		}
	}

	@RequestMapping(value = "/AddRequirement.html", method = RequestMethod.GET)
	public String addReq(ModelMap model, Integer dept_id) {
		model.put("req", new ExtraRecords());
		Department dept = departmentDao.getDepartmentByName(dept_id);
		model.put("dept", dept);
		return "AddRequirement";
	}

	@RequestMapping(value = "/AddRequirement.html", method = RequestMethod.POST)
	public String addReq(ModelMap model, @ModelAttribute("req") ExtraRecords req, HttpServletRequest request,BindingResult result) {
		Integer dept_id = Integer.parseInt(request.getParameter("dept_id"));
		erValidator.validate(req, result);
		if (result.hasErrors()){
			Department dept = departmentDao.getDepartmentByName(dept_id);
			model.put("dept", dept);
			return "AddRequirement";
		}
			
		
		/*if (extrarecordsDao.getExtraRecordsByName(req.getRec_name()).size() > 0) {
			model.put("error", "Additional Requirement already exist");
			return "AddRequirement";
		} else {*/
			req.setDept(departmentDao.getDepartmentByName(dept_id));
			extrarecordsDao.saveRequirement(req);
			Department dept = departmentDao.getDepartmentByName(dept_id);
			model.put("dept", dept);
			model.put("req", new ExtraRecords());
			return "AddRequirement";
		//}
	}
	
	@RequestMapping(value = "/Edit.html", method = RequestMethod.GET)
	public String edit(ModelMap model, Integer dept_id, @ModelAttribute("department") Department department, HttpServletRequest request) {
		dept_id=Integer.parseInt(request.getParameter("dept_id"));
		
		Department dept = departmentDao.getDepartmentByName(dept_id);
		model.put("dept", dept);
		model.put("department", department);
		return "Edit";
	}
	
	@RequestMapping(value = "/Edit.html", method = RequestMethod.POST)
	public String edit(ModelMap model, @RequestParam Integer dept_id, Integer er_id,@ModelAttribute("department") Department department,HttpServletRequest request){
	
		//dept_id=Integer.parseInt(request.getParameter("dept_id"));
		departmentDao.saveDepartment(department);
		Department dept = departmentDao.getDepartmentByName(dept_id);
		model.put("dept", dept);
		model.put("department", dept);
	return "redirect:Edit.html?dept_id="+dept_id;
	}
	
	@RequestMapping(value = "/RemovePrg.html", method = RequestMethod.GET)
	public String removeprg(ModelMap model, @RequestParam Integer prg_id,@RequestParam Integer dept_id, @ModelAttribute("department") Department department) {
	
		programDao.deleteProgram(programDao.getProgram(prg_id));
		Department dept = departmentDao.getDepartmentByName(dept_id);
		model.put("dept", dept);
		return "redirect:Edit.html?dept_id="+dept_id;
	}
	
	@RequestMapping(value = "/RemoveReq.html", method = RequestMethod.GET)
	public String removereq(ModelMap models, @RequestParam Integer er_id, @RequestParam Integer dept_id,@ModelAttribute("department") Department department) {
	
		extrarecordsDao.deleteRequirement(extrarecordsDao.getRecords(er_id));
		Department dept = departmentDao.getDepartmentByName(dept_id);
		models.put("dept", dept);
		return "redirect:Edit.html?dept_id="+dept_id;
	}
	

	
	

}
