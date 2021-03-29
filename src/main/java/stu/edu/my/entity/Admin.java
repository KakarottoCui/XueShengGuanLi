package stu.edu.my.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="mcy_admin")
public class Admin {
	private Integer id;
	private String username;
	private String password;
	private String name;
	private Integer sf;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	@Column(length=20,nullable=false,unique=true)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSf() {
		return sf;
	}
	public void setSf(Integer sf) {
		this.sf = sf;
	}
	public Admin(Integer id, String username, String password, String name, Integer sf) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.name = name;
		this.sf = sf;
	}
	public Admin() {
		super();
	}
}
