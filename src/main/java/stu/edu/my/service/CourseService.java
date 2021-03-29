package stu.edu.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import stu.edu.my.custom.CommonService;
import stu.edu.my.entity.Course;
import stu.edu.my.repository.CourseRepository;

@Service
public class CourseService extends CommonService<Course, Integer> {
	@Autowired
	private CourseRepository courseDAO;

	public Course findByName(String name) {
		return courseDAO.findByName(name);
	}
	
	public List<Course> findByNameLike(String str) {
		return courseDAO.findByNameLike(str);
	}

	public Page<Course> findByNameLike(String name, Pageable pageable) {
		return courseDAO.findByNameLike(name, pageable);
	}

	public Page<Course> findByHour(Integer hour, Pageable pageable) {
		return courseDAO.findByHour(hour, pageable);
	}
}
