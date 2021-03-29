package stu.edu.my.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import stu.edu.my.custom.CommonRepository;
import stu.edu.my.entity.Student;

@Repository
public interface StudentRepository extends CommonRepository<Student, Integer> {
	
	public Student findByUsernameAndPassword(String username, String password);

	public List<Student> findByTbClassId(Integer id);

	public Student findByUsername(String username);

	public List<Student> findByNameLikeOrUsernameLikeOrSexLikeOrZwLike(String name, String username, String sex, String zw);

	public List<Student> findByNameLikeOrUsernameLike(String name, String username);

	public List<Student> findBySexLikeOrZwLike(String sex, String zw);
	
}
