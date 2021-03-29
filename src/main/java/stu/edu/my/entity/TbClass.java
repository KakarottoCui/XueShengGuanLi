package stu.edu.my.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="mcy_class")
public class TbClass {
	private Integer id;
	private String name;
	private String teacher;
	@JsonIgnore
	private List<Student> student = new ArrayList<>();
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=20,nullable=false,unique=true)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	@OneToMany(cascade=CascadeType.ALL, mappedBy="tbClass")
	public List<Student> getStudent() {
		return student;
	}
	public void setStudent(List<Student> student) {
		this.student = student;
	}
	public TbClass(Integer id, String name, String teacher, List<Student> student) {
		super();
		this.id = id;
		this.name = name;
		this.teacher = teacher;
		this.student = student;
	}
	public TbClass() {
		super();
	}
}
