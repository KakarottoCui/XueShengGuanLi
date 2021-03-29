package stu.edu.my.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import stu.edu.my.custom.CommonService;
import stu.edu.my.entity.TbClass;
import stu.edu.my.repository.TbClassRepository;

@Service
public class TbClassService extends CommonService<TbClass, Integer> {
	@Autowired
	private TbClassRepository tbClassDAO;

	public TbClass findByName(String name) {
		return tbClassDAO.findByName(name);
	}

	public Page<TbClass> findByNameLikeOrTeacherLike(String name, String teacher, Pageable pageable) {
		return tbClassDAO.findByNameLikeOrTeacherLike(name, teacher, pageable);
	}
}
