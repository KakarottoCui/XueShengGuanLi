package stu.edu.my.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import stu.edu.my.entity.Student;
import stu.edu.my.entity.TbClass;
import stu.edu.my.service.StudentService;
import stu.edu.my.service.TbClassService;

@Controller
@RequestMapping(value="/student")
public class StudentController {
	@Autowired
	private StudentService studentDAO;
	@Autowired
	private TbClassService tbClassService;
	
	@RequestMapping(value="/main")
	public String main(ModelMap map) {
		List<TbClass> tbClass = tbClassService.findAll();
		map.put("tbClass", tbClass);
		return "student/main";
	}
	
	@RequestMapping(value="/ss")
	public String ss(String str, ModelMap map) {
		List<Student> student = new ArrayList<>();
		if(str.equals(null)) {
			student = studentDAO.findAll();
		}else {
			student = studentDAO.findByNameLikeOrUsernameLikeOrSexLikeOrZwLike("%"+str+"%", "%"+str+"%", "%"+str+"%", "%"+str+"%");
		}
		map.put("student", student);
		return "student/all";
	}
	
	@RequestMapping(value="/all")
	public String sx(Integer id, ModelMap map){
		List<Student> student = studentDAO.findByTbClassId(id);
		map.put("student", student);
		return "student/all";
	}
	
	@RequestMapping(value="/edit")
	@ResponseBody
	public Object edit(Integer id) {
		HashMap<String, Object> result = new HashMap<>();
		Student model = new Student();
		if(id != null) {
			model = studentDAO.findById(id);
		}
		result.put("student", model);
		return result;
	}
	
	@RequestMapping(value="username")
	@ResponseBody
	public Object name(String username) {
		HashMap<String, Object> result = new HashMap<>();
		Student student = studentDAO.findByUsername(username);
		if(student != null) {
			result.put("error", "此学号已注册！");
			return result;
		}
		return result;
	}
	
	@RequestMapping(value="/save")
	public String save(Student model, ModelMap map) {
		String pwd = model.getPassword().substring(0, model.getPassword().length()-1);
		model.setPassword(pwd);
		studentDAO.save(model);
		Integer id = model.getTbClass().getId();
		return "redirect:all?id="+id;
	}
	
	@RequestMapping(value="/delete")
	public String delete(Integer id, Integer bj_id) {
		studentDAO.deleteById(id);
		return "redirect:all?id="+bj_id;
	}
	
	@RequestMapping(value="/cz")
	public String cz(Integer id, Integer bj_id) {
		Student studnet = studentDAO.findById(id);
		studnet.setPassword("123456");
		studentDAO.save(studnet);
		return "redirect:all?id="+bj_id;
	}
	
	@RequestMapping(value="/bj_all")
	public String bj_all(Integer id, ModelMap map) {
		List<Student> list = studentDAO.findByTbClassId(id);
		map.put("bj_all", list);
		return "user/bj_all";
	}
	
	@RequestMapping(value="/xs_all")
	public String xs_all(Integer id, ModelMap map) {
		List<Student> list = studentDAO.findByTbClassId(id);
		map.put("xs_all", list);
		return "grade/xs_all1";
	}
}
