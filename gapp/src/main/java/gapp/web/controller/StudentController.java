package gapp.web.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.postgresql.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import gapp.model.Application;
import gapp.model.ApplicationStatus;
import gapp.model.Department;
import gapp.model.EducationalBackground;
import gapp.model.ExtraRecordField;
import gapp.model.ExtraRecords;
import gapp.model.Program;
import gapp.model.User;
import gapp.model.dao.ApplicationDao;
import gapp.model.dao.DepartmentDao;
import gapp.model.dao.EducationalBackgroundDao;
import gapp.model.dao.ExtraRecordFieldDao;
import gapp.model.dao.ExtraRecordsDao;
import gapp.model.dao.ProgramDao;
import gapp.model.dao.StatusDao;
import gapp.model.dao.UserDao;
import gapp.web.validator.ApplicationValidator;
import gapp.web.validator.RegisterValidator;

@Controller
@SessionAttributes({ "applicant", "user1", "educationalbackground", "additionalrecords" })
public class StudentController {
	@Autowired
	private UserDao userDao;

	@Autowired
	private ApplicationDao applicationDao;

	@Autowired
	private DepartmentDao departmentDao;

	@Autowired
	private ProgramDao programDao;

	@Autowired
	private EducationalBackgroundDao edubackDao;

	@Autowired
	private ExtraRecordFieldDao erfeildDao;

	@Autowired
	private ExtraRecordsDao extrarecDao;

	@Autowired
	private StatusDao statusDao;

	@Autowired
	private ApplicationValidator applicationValidator;

	@Autowired
	private ServletContext context;

	@RequestMapping(value = "/ViewAppDetails.html", method = RequestMethod.GET)
	public String viewAppDet(ModelMap model, @ModelAttribute Application applicant) {
		User user1 = (User) model.get("user1");

		Application app = applicationDao.getApplication(applicant.getApplication_id());
		model.put("application", app);
		model.put("user1", user1);

		return "ViewAppDetails";
	}

	@RequestMapping(value = "/NewApplication.html", method = RequestMethod.GET)
	public String newApplication(ModelMap model) {

		List<Department> dept = departmentDao.getDepartment();
		model.put("applicant", new Application());
		User user1 = (User) model.get("user1");
		// model.put("user1", user1);
		model.put("department", dept);
		return "NewApplication";

	}

	@RequestMapping(value = "/dropdown.html", method = RequestMethod.GET)
	public String dropdown(ModelMap model, @RequestParam("dept") Integer dept, HttpServletResponse response) {
		// System.out.println("hii control is here");
		// System.out.println(dept);

		Department deptObj = departmentDao.getDepartmentByName(dept);
		String jsoncall = null;
		List<Program> prg = deptObj.getPrograms();
		List<String> names = new ArrayList<String>();

		for (Program prog : prg) {
			names.add(prog.getPrg_name());
		}

		jsoncall = new Gson().toJson(names);
		response.setContentType("application/json");
		try {
			response.getWriter().write(jsoncall);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

	@RequestMapping(value = "/NewApplication.html", method = RequestMethod.POST)
	public String newApplication(ModelMap model, @ModelAttribute Application applicant, 
			@RequestParam Integer user_id/*, BindingResult result*/) {
		
		/*applicationValidator.validate(applicant, result);
		if (result.hasErrors()){
			model.put("errormsg", "Wrong Information Added");
			return "NewApplication";
		}
			*/
		
		
		applicant.setDept(departmentDao.getDepartmentByName(applicant.getDept().getDept_id()));
		applicant.setProgram(programDao.getProgramByName(applicant.getProgram().getPrg_name()));
		User user = (User)model.get("user1");
		applicant.setDetail(userDao.getUser(user.getUser_id()));

		/*
		 * DateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd"); //get
		 * current date time with Date() Date date = new Date();
		 */
		applicant.setStatus(statusDao.getStatusById(7));
		Application savedApplication = applicationDao.saveApplication(applicant);
		model.put("applicant", savedApplication);
		return "redirect:EducationalBackground.html";

	}

	@RequestMapping(value = "/EducationalBackground.html", method = RequestMethod.GET)
	public String eucationalbackground(ModelMap model, @ModelAttribute EducationalBackground educationalbackground) {
		User user1 = (User) model.get("user1");
		Application app1 = applicationDao.getApplication(((Application) model.get("applicant")).getApplication_id());
		model.put("educationalbackground", new EducationalBackground());
		model.put("app", app1);
		model.put("edu", app1.getDegree());
		return "EducationalBackground";
	}

	private File getFileDirectory() {

		String path = context.getRealPath("/WEB-INF/FilesUploaded");

		return new File(path);

	}

	/*
	 * @RequestMapping(value = "/doUploadFile.html", method =
	 * RequestMethod.POST) public String douploadfile(ModelMap
	 * model, @ModelAttribute EducationalBackground educationalbackground,
	 * HttpServletRequest request, @RequestParam MultipartFile fileUp )throws
	 * Exception {
	 * 
	 * System.out.println("File Name is:"+fileUp.getBytes());
	 * fileUp.transferTo(new
	 * File(getFileDirectory(),fileUp.getOriginalFilename()));
	 * 
	 * 
	 * System.out.println("Saving file: " + fileUp.getOriginalFilename());
	 * educationalbackground.setFilename(application_id + filename);
	 * educationalbackground.setTranscript(fileUp.getBytes())
	 * edubackDao.saveEduBack(educationalbackground);
	 * model.put("educationalbackground", educationalbackground);
	 * 
	 * model.put("educationalbackground", new EducationalBackground());
	 * 
	 * 
	 * return "EducationalBackground"; }
	 */

	@RequestMapping(value = "/EducationalBackground.html", method = RequestMethod.POST)
	public String eucationalbackground(ModelMap model, @ModelAttribute EducationalBackground educationalbackground,
			HttpServletRequest request, @RequestParam MultipartFile transcriptone, @RequestParam Integer user_id,
			@RequestParam Integer application_id, @RequestParam String action) throws IOException {

		educationalbackground.setFilename(application_id + transcriptone.getOriginalFilename());
		educationalbackground.setTranscript(transcriptone.getBytes());
		// edubackDao.saveEduBack(educationalbackground);
		//System.out.println(application_id);
		Application app = applicationDao.getApplication(application_id);
		educationalbackground.setApplication(app);
		List<EducationalBackground> ListEdu = new ArrayList<EducationalBackground>();
		ListEdu.add(educationalbackground);
		// edubackDao.saveEduBack(educationalbackground);

		app.setDegree(ListEdu);
		app = applicationDao.saveApplication(app);
		// app = applicationDao.getApplication(app.getApplication_id());
		model.put("applicant", app);
		model.put("degree", app.getDegree());

		if ((action.equals("add"))) {
			List<EducationalBackground> eduDisplay = edubackDao.geteduBackByApplicationId(application_id);
			model.put("edu", eduDisplay);
			model.put("educationalbackground", new EducationalBackground());
			//Put additional records object here.... 
			return "EducationalBackground";
		} else {
			Department depter = app.getDept();
			model.put("deptforer", depter);
			model.put("additionalrecords", new ExtraRecordField());
			return "redirect:AdditionalRecords.html?application_id=" + application_id + "&user_id=" + user_id;
		}

	}

	@RequestMapping(value = "/download.html", method = RequestMethod.GET)
	public String download(ModelMap model, @ModelAttribute EducationalBackground educationalbackground,
			HttpServletResponse response, @RequestParam int ebid) {
		try {
			EducationalBackground edu = edubackDao.getEducationalbackground(ebid);
			response.setHeader("Content-Disposition", "inline;filename=\"" + edu.getFilename() + "\"");
			OutputStream out = response.getOutputStream();
			// response.setContentType(doc.getContentType());

			FileCopyUtils.copy(edu.getTranscript(), out);
			out.flush();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}

	@RequestMapping(value = "/delete.html", method = RequestMethod.GET)
	public String removeprg(ModelMap model, @RequestParam Integer ebid, @RequestParam Integer application_id) {
		//System.out.println(ebid);
		edubackDao.deleteEdu(edubackDao.getEducationalbackground(ebid));

		return "redirect:EducationalBackground.html?application_id=" + application_id;
	}

	@RequestMapping(value = "/AdditionalRecords.html", method = RequestMethod.GET)
	public String AddAdditionalRecords(ModelMap model, @RequestParam Integer application_id,
			@RequestParam(required = false) Integer user_id) {
		Application app = applicationDao.getApplication(application_id);
		// if condition app
		Department deptforer = app.getDept();
		User user = userDao.getUser(user_id);
		model.put("user", user);
		model.put("app", app);
		model.put("erv", app.getEr_value());
		model.put("deptforer", deptforer);

		return "AdditionalRecords";

	}

	@RequestMapping(value = "/upload.html", method = RequestMethod.POST)
	public String upload(ModelMap model, @ModelAttribute ExtraRecordField additionalrecords,
			@RequestParam Integer application_id, @RequestParam(required = false) Integer user_id,
			@RequestParam(required = false) MultipartFile fileupload1, @RequestParam(required = false) Integer rec_id,
			@RequestParam(required = false) MultipartFile fileupload2, @RequestParam(required = false) Integer reid,@RequestParam String action)
					throws IOException {
	//	System.out.println("FILE IS COMMING TO CONTROLLER");
		if((action.equals("save3"))){
			ExtraRecordField erfeild = erfeildDao.geterfeildById(reid);
			erfeild.setFileupload_name(fileupload2.getOriginalFilename());
		additionalrecords.setFileupload(fileupload2.getBytes());
			erfeildDao.saveExtraRecordField(erfeild);
			return "redirect:AdditionalRecords.html?application_id=" + application_id + "&user_id=" + user_id;
		}
		List<ExtraRecordField> erList = new ArrayList<ExtraRecordField>();
		Application app = applicationDao.getApplication(application_id);
		additionalrecords.setApplication(app);
		additionalrecords.setFileupload_name(fileupload1.getOriginalFilename());
		additionalrecords.setFileupload(fileupload1.getBytes());
		ExtraRecords extrarec = extrarecDao.getRecords(rec_id);
		additionalrecords.setExtrarec(extrarec);
		erList.add(additionalrecords);
		app.setEr_value(erList);
		app = applicationDao.saveApplication(app);
		return "redirect:AdditionalRecords.html?application_id=" + application_id + "&user_id=" + user_id;

	}

	@RequestMapping(value = "/downloaderv.html", method = RequestMethod.GET)
	public String downloaderv(ModelMap model, HttpServletResponse response, @RequestParam int erv_id) {
		try {
			ExtraRecordField er = erfeildDao.geterfeildById(erv_id);
			response.setHeader("Content-Disposition", "inline;filename=\"" + er.getFileupload_name() + "\"");
			OutputStream out = response.getOutputStream();
			// response.setContentType(doc.getContentType());

			FileCopyUtils.copy(er.getFileupload(), out);
			out.flush();
			out.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

		return null;

	}

	@RequestMapping(value = "/AdditionalRecords.html", method = RequestMethod.POST)
	public String getAdditionalRecords(ModelMap model, @ModelAttribute ExtraRecordField additionalrecords,
			@RequestParam Integer application_id, @RequestParam String action,
			@RequestParam(required = false) String value, @RequestParam(required = false) Integer rec_id,
			@RequestParam(required = false) Integer user_id, @RequestParam(required = false) Integer record_id)
					throws IOException {
	//	System.out.println("here i am");
		List<ExtraRecordField> erList = new ArrayList<ExtraRecordField>();
		Application app = applicationDao.getApplication(application_id);
		additionalrecords.setApplication(app);

		if ((action.equals("save2"))) {
			ExtraRecords extrarec = extrarecDao.getRecords(rec_id);
			additionalrecords.setExtrarec(extrarec);
			erList.add(additionalrecords);
			app.setEr_value(erList);
			app = applicationDao.saveApplication(app);
			model.put("app", app);
			return "redirect:AdditionalRecords.html?application_id=" + application_id + "&user_id=" + user_id;
		} else if ((action.equals("save3"))) {
			ExtraRecordField erfeild = erfeildDao.geterfeildById(record_id);
			erfeild.setFeild_value(value);
			erfeildDao.saveExtraRecordField(erfeild);
			return "redirect:AdditionalRecords.html?application_id=" + application_id + "&user_id=" + user_id;
		}
		// app = applicationDao.saveApplication(app);
		if ((action.equals("save"))) {
			// app.setStatus(status);
			List<Application> applist = applicationDao.getApplicationByUser(userDao.getUser(user_id));
			model.put("applist", applist);
			return "redirect:Student.html";
		} else {

			Application appsubmit = applicationDao.getApplication(application_id);
			appsubmit.setStatus(statusDao.getStatusById(6));
			DateFormat dateFormat = new SimpleDateFormat("M-d-yyyy");
			Date date = new Date();
			appsubmit.setSubmit_date(dateFormat.format(date));
			applicationDao.saveApplication(appsubmit);
			List<Application> applist = applicationDao.getApplicationByUser(userDao.getUser(user_id));
			model.put("applist", applist);

			return "redirect:Student.html";
		}

	}

	@RequestMapping(value = "/EditApplication", method = RequestMethod.GET)
	public String editApplication(ModelMap model, @ModelAttribute Application applicant,
			@RequestParam Integer application_id) {
		Application app = applicationDao.getApplication(application_id);
		Department dept = app.getDept();
		User useredit = app.getDetail();
		// model.put("app", app);
		model.put("dept", dept);
		model.put("applicant", app);
		model.put("useredit", useredit);

		return "EditApplication";

	}

	@RequestMapping(value = "/EditApplication", method = RequestMethod.POST)
	public String editApplication1(ModelMap model, @ModelAttribute Application applicant,
			@RequestParam(required = false) Integer application_id, @RequestParam Integer user_id,
			@RequestParam String action, HttpServletRequest request) throws ParseException {
		String dob = request.getParameter("dob");
		// Application app = applicationDao.getApplication(application_id);
		DateFormat df = new SimpleDateFormat("M/d/yyyy");
		Date date1 = new Date();
		date1 = df.parse(dob);

		Application application = applicationDao.getApplication(applicant.getApplication_id());

		application.setFname(applicant.getFname());
		application.setLname(applicant.getLname());
		application.setEmail(applicant.getEmail());
		application.setTerm(applicant.getTerm());
		application.setCIN(applicant.getCIN());
		application.setCitizenship(applicant.getCitizenship());
		application.setPhone(applicant.getPhone());
		application.setDob(date1);
		application.setToefl(applicant.getToefl());
		application.setGender(applicant.isGender());

		application.setProgram(programDao.getProgram(applicant.getProgram().getPrg_id()));
		application.setDetail(userDao.getUser(user_id));
		application.setDegree(edubackDao.geteduBackByApplicationId(application_id));
		application.setStatus(statusDao.getStatusById(7));

		// Application oldapp= applicationDao.getApplication(application_id);
		// List<ExtraRecordField> older = new ArrayList<>();
		// older.add((ExtraRecordField) oldapp.getEr_value());
		// applicant.setEr_value(older);
		applicationDao.saveApplication(application);
		Application appSave = application;
		model.put("applicant", appSave);
		if ((action.equals("save1"))) {

			return "redirect:EditApplication.html?application_id=" + application_id;
		} else {
			return "redirect:EducationalBackground.html?application_id=" + application_id;

		}

	}

	@RequestMapping(value = "/EditEduBack", method = RequestMethod.GET)
	public String editeduback(ModelMap model, @ModelAttribute EducationalBackground educationalbackground,
			@RequestParam Integer application_id, @RequestParam Integer ebid) {

		EducationalBackground eduedit = edubackDao.getEducationalbackground(ebid);
		// System.out.println("edit get"+ebid);
		Application app = applicationDao.getApplication(application_id);
		model.put("eduedit", eduedit);
		model.put("app", app);
		model.put("ebid", ebid);
		model.put("application_id", application_id);
		return "EditEduBack";

	}

	@RequestMapping(value = "/EditEduBack", method = RequestMethod.POST)
	public String editeduback(ModelMap model, @RequestParam Integer application_id, @RequestParam Integer ebid,
			@RequestParam(required = false) MultipartFile transcriptone) throws IOException {
	//	System.out.println("hello");
		if (transcriptone.isEmpty()) {

			return "redirect:EducationalBackground.html?ebid=" + ebid;

		} else {
			EducationalBackground edu = edubackDao.getEducationalbackground(ebid);
			edu.setFilename(application_id + transcriptone.getOriginalFilename());
			edu.setTranscript(transcriptone.getBytes());
			EducationalBackground edu1 = edubackDao.saveEduBack(edu);
			// model.put("edu", edu1);

			return "redirect:EducationalBackground.html?ebid=" + ebid;

		}

	}

}
