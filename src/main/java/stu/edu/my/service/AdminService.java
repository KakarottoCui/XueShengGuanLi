package stu.edu.my.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import stu.edu.my.custom.CommonService;
import stu.edu.my.entity.Admin;
import stu.edu.my.repository.AdminRepository;

@Service
public class AdminService extends CommonService<Admin, Integer> {
	@Autowired
	private AdminRepository adminDAO;	

	public Admin login(String username, String password) {
		//根据学号密码查找
		return adminDAO.findByUsernameAndPassword(username, password);
	}
}
