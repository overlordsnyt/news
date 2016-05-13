package reg;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import common.DBHandle;

public class Register {
	protected String username,password,sex,profession,favourite,note,type;
	public Register(){}
//	public void execute(HttpServletRequest request){
//		type="1";
//		username=request.getParameter("username");
//		password=request.getParameter("password");
//		sex=request.getParameter("sex");
//		profession=request.getParameter("profession");
//		favourite=Arrays.toString(request.getParameterValues("favourite"));
//		note=request.getParameter("note");
//	}
	public Register(HttpServletRequest request){
		type="1";
		username=request.getParameter("username");
		password=request.getParameter("password");
		sex=request.getParameter("sex");
		profession=request.getParameter("profession");
		favourite=Arrays.toString(request.getParameterValues("favourite"));
		note=request.getParameter("note");
	}
	public boolean saveToDatabase(){
		boolean b=false;
		String sql=
				"insert into userinfo values('"
				+username+ "','"
				+password+ "','"
				+sex+ "','"
				+profession+ "','"
				+favourite+ "','"
				+note+ "','"
				+type+ "')";
		if(DBHandle.executeUpdate(sql)>0)b=true;
		return b;
	}
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
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getProfession() {
		return profession;
	}
	public void setProfession(String profession) {
		this.profession = profession;
	}
	public String getFavourite() {
		return favourite;
	}
	public void setFavourite(String favourite) {
		this.favourite = favourite;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
