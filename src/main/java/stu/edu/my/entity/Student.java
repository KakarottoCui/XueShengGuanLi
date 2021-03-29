package stu.edu.my.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="mcy_student")
public class Student {
	private Integer id;
	private String name;
	private String username;
	private String password;
	private String sex;
	private String zw;
	private Integer sf;
	private Integer cj;
	@JsonIgnore
	private TbClass tbClass;
	@JsonIgnore
	private List<Grade> grade = new ArrayList<>();
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(length=20)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Column(length=20,nullable=false,unique=true)
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Column(length=1)
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getZw() {
		return zw;
	}
	public void setZw(String zw) {
		this.zw = zw;
	}
	public Integer getSf() {
		return sf;
	}
	public void setSf(Integer sf) {
		this.sf = sf;
	}
	@ManyToOne
	public TbClass getTbClass() {
		return tbClass;
	}
	public void setTbClass(TbClass tbClass) {
		this.tbClass = tbClass;
	}
	@OneToMany(mappedBy="student")
	public List<Grade> getGrade() {
		return grade;
	}
	public void setGrade(List<Grade> grade) {
		this.grade = grade;
	}
	public Integer getCj() {
		return cj;
	}
	public void setCj(Integer cj) {
		this.cj = cj;
	}
	public Student(Integer id, String name, String username, String password, String sex, String zw, Integer sf,
			TbClass tbClass, List<Grade> grade, Integer cj) {
		super();
		this.id = id;
		this.name = name;
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.zw = zw;
		this.sf = sf;
		this.tbClass = tbClass;
		this.grade = grade;
		this.cj = cj;
	}
	public Student() {
		super();
	}
}
