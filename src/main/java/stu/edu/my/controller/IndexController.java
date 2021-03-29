package stu.edu.my.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import stu.edu.my.entity.Admin;
import stu.edu.my.entity.Student;
import stu.edu.my.entity.Teacher;
import stu.edu.my.service.AdminService;
import stu.edu.my.service.StudentService;
import stu.edu.my.service.TeacherService;

@Controller
public class IndexController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private AdminService adminService;
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value= {"/index", "/"}, method=RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value= "/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value= "updata")
	public String updata() {
		return "user/updata";
	}
	
	@RequestMapping(value= "xg")
	public String xg(String pad, Integer sf, Integer id) {
		if(sf == 0) {
			Student model = studentService.findById(id);
			model.setPassword(pad);
			studentService.save(model);
			return "redirect:tc";
		}else if(sf == 1){
			Admin model = adminService.findById(id);
			model.setPassword(pad);
			adminService.save(model);
			return "redirect:tc";
		}else if(sf == 2) {
			Teacher model = teacherService.findById(id);
			model.setPassword(pad);
			teacherService.save(model);
			return "redirect:tc";
		}
		return null;
	}
	
	@RequestMapping(value= "tc")
	public String tc(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:index";
	}
	
	@RequestMapping(value= "/login", method=RequestMethod.POST)
	public String login(String account, String password, String identity, HttpSession session) {
		if(identity.equals("学生")) {
			Student student = studentService.login(account, password);
			if(student == null) {
				session.removeAttribute("user");
				return "redirect:index";
			}else {
				session.setAttribute("user", student);
				return "redirect:index";
			}
		}else if(identity.equals("管理员")) {
			Admin admin = adminService.login(account, password);
			if(admin == null) {
				session.removeAttribute("user");
				return "redirect:index";
			}else {
				session.setAttribute("user", admin);
				return "redirect:index";
			}
		}else if(identity.equals("老师")) {
			Teacher teacher = teacherService.login(account, password);
			if(teacher == null) {
				session.removeAttribute("user");
				return "redirect:index";
			}else {
				session.setAttribute("user", teacher);
				return "redirect:index";
			}
		}
		return null;
	}
}
