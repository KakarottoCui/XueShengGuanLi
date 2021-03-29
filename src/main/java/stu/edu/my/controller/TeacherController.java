package stu.edu.my.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import stu.edu.my.entity.Teacher;
import stu.edu.my.service.TeacherService;

@Controller
@RequestMapping(value="teacher")
public class TeacherController {
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping(value="main")
	public String main(Integer hs, Integer ys, String str, ModelMap map) {
		Integer a = 0;
		Integer b = 10;
		if(hs != null) {
			b = hs;
		}
		if(ys != null) {
			a = ys-1;
		}
		Pageable pageable = PageRequest.of(a, b);
		Page<Teacher> page;
		if("".equals(str) || str == null) {
			page = teacherService.findAll(pageable);
		}else {
			page = teacherService.findByNameLikeOrUsernameLike("%"+str+"%", "%"+str+"%", pageable);
		}
		map.put("teacher", page.getContent());
		map.put("number", page.getNumber()+1);
		map.put("size", page.getSize());
		map.put("getTotalElements", page.getTotalElements());
		map.put("totalPages", page.getTotalPages());
		return "teacher/main";		
	}
	
	@RequestMapping(value="/ss")
	public String ss(String str, ModelMap map) {
		List<Teacher> teacher = new ArrayList<>();
		if(str.equals(null)) {
			teacher = teacherService.findAll();
		}else {
			//teacher = teacherService.findByNameLikeOrUsernameLike("%"+str+"%", "%"+str+"%");
		}
		map.put("teacher", teacher);
		return "teacher/main";
	}

	@RequestMapping(value="/edit")
	@ResponseBody
	public Object edit(Integer id) {
		HashMap<String, Object> result = new HashMap<>();
		Teacher model = new Teacher();
		if(id != null) {
			model = teacherService.findById(id);
		}
		result.put("teacher", model);
		return result;
	}
	
	@RequestMapping(value="name")
	@ResponseBody
	public Object name(String username) {
		HashMap<String, Object> result = new HashMap<>();
		Teacher teacher = teacherService.findByUsername(username);
		if(teacher != null) {
			result.put("error", "此用户已添加！");
			return result;
		}
		return result;
	}
	
	@RequestMapping(value="/save")
	public String save(Teacher model) {
		String pwd = model.getPassword().substring(0, model.getPassword().length()-1);
		model.setPassword(pwd);
		model.setSf(2);
		teacherService.save(model);
		return "redirect:main";
	}
	
	@RequestMapping(value="/delete")
	public String delete(Integer id) {
		teacherService.deleteById(id);
		return "redirect:main";
	}
	
	@RequestMapping(value="/cz")
	public String cz(Integer id, Integer bj_id) {
		Teacher teacher = teacherService.findById(id);
		teacher.setPassword("123456");
		teacherService.save(teacher);
		return "redirect:main";
	}
	
}
