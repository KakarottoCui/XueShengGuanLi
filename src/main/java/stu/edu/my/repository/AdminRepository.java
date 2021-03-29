package stu.edu.my.repository;

import org.springframework.stereotype.Repository;

import stu.edu.my.custom.CommonRepository;
import stu.edu.my.entity.Admin;

@Repository
public interface AdminRepository extends CommonRepository<Admin, Integer> {
	public Admin findByUsernameAndPassword(String username, String password);
}
