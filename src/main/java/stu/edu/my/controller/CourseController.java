package stu.edu.my.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import stu.edu.my.entity.Course;
import stu.edu.my.service.CourseService;

@Controller
@RequestMapping(value="course")
public class CourseController {
	@Autowired
	private CourseService courseService;
	
	@RequestMapping(value="/main")
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
		Page<Course> page;
		if("".equals(str) || str == null) {
			page = courseService.findAll(pageable);
		}else {
			Pattern pattern = Pattern.compile("[0-9]*$");   //整数正则表达式
			Matcher isNum = pattern.matcher(str);   //是整数返回true,否则返回false 
			if(isNum.matches()) {
				Integer hour = Integer.parseInt(str);
				page = courseService.findByHour(hour, pageable);
			}else {
				page = courseService.findByNameLike("%"+str+"%", pageable);
			}
		}
		map.put("course", page.getContent());
		map.put("number", page.getNumber()+1);
		map.put("size", page.getSize());
		map.put("getTotalElements", page.getTotalElements());
		map.put("totalPages", page.getTotalPages());
		return "course/main";
	}
	@RequestMapping(value="/main2")
	public String main2(Integer hs, Integer ys, String str, ModelMap map) {
		Integer a = 0;
		Integer b = 10;
		if(hs != null) {
			b = hs;
		}
		if(ys != null) {
			a = ys-1;
		}
		Pageable pageable = PageRequest.of(a, b);
		Page<Course> page;
		if("".equals(str) || str == null) {
			page = courseService.findAll(pageable);
		}else {
			Pattern pattern = Pattern.compile("[0-9]*$");   //整数正则表达式
			Matcher isNum = pattern.matcher(str);   //是整数返回true,否则返回false
			if(isNum.matches()) {
				Integer hour = Integer.parseInt(str);
				page = courseService.findByHour(hour, pageable);
			}else {
				page = courseService.findByNameLike("%"+str+"%", pageable);
			}
		}
		map.put("course", page.getContent());
		map.put("number", page.getNumber()+1);
		map.put("size", page.getSize());
		map.put("getTotalElements", page.getTotalElements());
		map.put("totalPages", page.getTotalPages());
		return "course/main2";
	}
	
	@RequestMapping(value="/edit")
	@ResponseBody
	public Object edit(Integer id) {
		HashMap<String, Object> result = new HashMap<>();
		Course model = new Course();
		if(id != null) {
			model = courseService.findById(id);
		}
		result.put("course", model);
		return result;
	}
	
	@RequestMapping(value="/cz")
	public String cz(String str, ModelMap map) {
		List<Course> course = new ArrayList<>();
		if(str.equals(null)) {
			course = courseService.findAll();
		}else {
			course = courseService.findByNameLike("%"+str+"%");
		}
		map.put("course", course);
		return "course/main";
	}
	@RequestMapping(value="/czz")
	public String czz(String str, ModelMap map) {
		List<Course> course = new ArrayList<>();
		if(str.equals(null)) {
			course = courseService.findAll();
		}else {
			course = courseService.findByNameLike("%"+str+"%");
		}
		map.put("course", course);
		return "course/main2";
	}
	
	@RequestMapping(value="name")
	@ResponseBody
	public Object name(String name) {
		HashMap<String, Object> result = new HashMap<>();
		Course course = courseService.findByName(name);
		if(course != null) {
			result.put("error", "此课程已添加！");
			return result;
		}
		return result;
	}
	
	@RequestMapping(value="/save")
	public String save(Course model) {
		courseService.save(model);
		return "redirect:main";
	}
	
	@RequestMapping(value="/delete")
	public String delete(Integer id) {
		courseService.deleteById(id);
		return "redirect:main";
	}
}
