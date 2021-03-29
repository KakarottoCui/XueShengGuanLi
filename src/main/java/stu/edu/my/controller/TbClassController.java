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

import stu.edu.my.entity.TbClass;
import stu.edu.my.service.TbClassService;

@Controller
@RequestMapping(value="tbClass")
public class TbClassController {
	@Autowired
	private TbClassService tbClassService;
	
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
		Page<TbClass> page;
		if("".equals(str) || str == null) {
			page = tbClassService.findAll(pageable);
		}else {
			page = tbClassService.findByNameLikeOrTeacherLike("%"+str+"%", "%"+str+"%", pageable);
		}
		map.put("tbClass", page.getContent());
		map.put("number", page.getNumber()+1);
		map.put("size", page.getSize());
		map.put("getTotalElements", page.getTotalElements());
		map.put("totalPages", page.getTotalPages());
		return "tbClass/main";
	}
	
	@RequestMapping(value="/cz")
	public String cz(String str, ModelMap map) {
		List<TbClass> tbClass = new ArrayList<>();
		if(str.equals(null)) {
			tbClass = tbClassService.findAll();
		}else {
			//tbClass = tbClassService.findByNameLikeOrTeacherLike("%"+str+"%", "%"+str+"%");
		}
		map.put("tbClass", tbClass);
		return "tbClass/main";
	}
	
	@RequestMapping(value="/edit")
	@ResponseBody
	public Object edit(Integer id) {
		System.out.println(id);
		HashMap<String, Object> result = new HashMap<>();
		TbClass model = new TbClass();
		if(id != null) {
			model = tbClassService.findById(id);
		}
		result.put("tbClass", model);
		return result;
	}
	
	@RequestMapping(value="name")
	@ResponseBody
	public Object name(String name) {
		HashMap<String, Object> result = new HashMap<>();
		TbClass tbClass = tbClassService.findByName(name);
		if(tbClass != null) {
			result.put("error", "此班级已添加！");
			return result;
		}
		return result;
	}
	
	@RequestMapping(value="/save")
	public String save(TbClass model) {
		tbClassService.save(model);
		return "redirect:main";
	}
	
	@RequestMapping(value="/delete")
	public String delete(Integer id) {
		tbClassService.deleteById(id);
		return "redirect:main";
	}
}
