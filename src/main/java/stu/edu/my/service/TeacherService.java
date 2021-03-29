package stu.edu.my.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import stu.edu.my.custom.CommonService;
import stu.edu.my.entity.Teacher;
import stu.edu.my.repository.TeacherRepository;

@Service
public class TeacherService extends CommonService<Teacher, Integer> {
	@Autowired
	private TeacherRepository teacherDAO;
	
	public Teacher login(String username, String password) {
		return teacherDAO.findByUsernameAndPassword(username, password);
	}

	public Teacher findByUsername(String username) {
		return teacherDAO.findByUsername(username);
	}

	public Page<Teacher> findByNameLikeOrUsernameLike(String name, String username, Pageable pageable) {
		return teacherDAO.findByNameLikeOrUsernameLike(name, username, pageable);
	}

}
