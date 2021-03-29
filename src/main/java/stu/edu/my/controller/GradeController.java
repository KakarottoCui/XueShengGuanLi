package stu.edu.my.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import stu.edu.my.entity.Course;
import stu.edu.my.entity.Grade;
import stu.edu.my.entity.Student;
import stu.edu.my.entity.TbClass;
import stu.edu.my.service.CourseService;
import stu.edu.my.service.GradeService;
import stu.edu.my.service.StudentService;
import stu.edu.my.service.TbClassService;

@Controller
@RequestMapping(value="/grade")
public class GradeController {
	@Autowired
	private GradeService gradeService;
	@Autowired
	private TbClassService tbClassService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="grcj")
	public String grcj(Integer id, ModelMap map) {
		List<Grade> grade = gradeService.findByStudentId(id);
		map.put("grcj", grade);
		return "user/grcj";
	}
	
	@RequestMapping(value="entering")
	public String entering(ModelMap map) {
		List<TbClass> tbClass = tbClassService.findAll();
		List<Course> course = courseService.findAll();
		map.put("tbClass", tbClass);
		map.put("course", course);
		return "grade/entering";
	}
	
	@RequestMapping(value="xs_all")
	public String xs_all(Integer tbClass_id, Integer course_id, ModelMap map) {
		List<Student> student = studentService.findByTbClassId(tbClass_id);
		Course course = courseService.findById(course_id);
		List<Grade> grade = gradeService.findByStudentTbClassIdAndCourseId(tbClass_id, course_id);
		for (Student s : student) {
			for (Grade g : grade) {
				if((course.getId() == g.getCourse().getId()) && (s.getId() == g.getStudent().getId())) {
					s.setCj(g.getGrade());
					break;
				}
			}
		}
		map.put("student", student);
		return "grade/xs_all";
	}
	
	@RequestMapping(value="save")
	public void save(Integer grade, Integer kc_id, Integer xs_id) {
		Grade g = gradeService.findByStudentIdAndCourseId(xs_id, kc_id);
		Grade cj = new Grade();
		cj.setGrade(grade);
		cj.setCourse(courseService.findById(kc_id));
		cj.setStudent(studentService.findById(xs_id));
		if(g == null) {
			gradeService.save(cj);			
		}else {
			cj.setId(g.getId());
			gradeService.save(cj);			
		}
	}
	
	@RequestMapping(value="/updata1")
	public void updata1(Integer grade, Integer id) {
		Grade g = gradeService.findById(id);
		g.setGrade(grade);
		gradeService.save(g);
	}
	
	@RequestMapping(value="updata")
	public String updata(ModelMap map) {
		List<TbClass> tbClass = tbClassService.findAll();
		map.put("tbClass", tbClass);
		return "grade/updata";
	}
	
	@RequestMapping(value="xg")
	public String xg(Integer id, ModelMap map) {
		List<Grade> grade = gradeService.findByStudentId(id);
		map.put("grade", grade);
		return "grade/xg";
	}
	
	@RequestMapping(value="bj_all")
	public String bj_all(Integer id, ModelMap map) {
		List<Grade> grade = gradeService.findByStudentTbClassId(id);
		map.put("grade", grade);
		return "grade/bj_all";
	}
}
