package stu.edu.my.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stu.edu.my.custom.CommonService;
import stu.edu.my.entity.Student;
import stu.edu.my.repository.StudentRepository;

@Service
public class StudentService extends CommonService<Student, Integer> {
	@Autowired
	private StudentRepository studentDAO;

	public Student login(String username, String password) {
		//根据学号密码查找
		return studentDAO.findByUsernameAndPassword(username, password);
	}

	public List<Student> findByTbClassId(Integer id) {
		return studentDAO.findByTbClassId(id);
	}

	public Student findByUsername(String username) {
		return studentDAO.findByUsername(username);
	}

	public List<Student> findByNameLikeOrUsernameLikeOrSexLikeOrZwLike(String name, String username, String sex,
			String zw) {
		return studentDAO.findByNameLikeOrUsernameLikeOrSexLikeOrZwLike(name, username, sex, zw);
	}

	public List<Student> findByNameLikeOrUsernameLike(String name, String username) {
		return studentDAO.findByNameLikeOrUsernameLike(name, username);
	}

	public List<Student> findBySexLikeOrZwLike(String sex, String zw) {
		return studentDAO.findBySexLikeOrZwLike(sex, zw);
	}

}
