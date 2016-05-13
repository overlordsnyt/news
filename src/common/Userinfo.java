package common;

import java.util.regex.Pattern;

public class Userinfo {
	private String username,password,sex,profession,favourite,note,type;
	public void setInfoByUsername(String username){
		this.username=username;
		//写在属性栏会因为复制顺序而出错，无法读取username的值
		String 
		sqlPassword="select password from userinfo where username='"+username+"';",
		sqlSex="select sex from userinfo where username='"+username+"';",
		sqlProfession="select profession from userinfo where username='"+username+"';",
		sqlFavourite="select favourite from userinfo where username='"+username+"';",
		sqlNote="select note from userinfo where username='"+username+"';",
		sqlType="select type from userinfo where username='"+username+"';";
		password=DBHandle.executeQuery(sqlPassword);
		sex=DBHandle.executeQuery(sqlSex);
		profession=DBHandle.executeQuery(sqlProfession);
		favourite=DBHandle.executeQuery(sqlFavourite);
		note=DBHandle.executeQuery(sqlNote);
		type=DBHandle.executeQuery(sqlType);
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
	
	public static String transSex(String sexValue){
		if(!Pattern.matches("[\\d]{1}", sexValue))return sexValue;
		int s=Integer.parseInt(sexValue);
		if(s==0)return "男";
		if(s==1)return "女";
		return "";
	}
	public static String transType(String typeValue){
		if(!Pattern.matches("[\\d]{1}", typeValue))return typeValue;
		int t=Integer.parseInt(typeValue);
		if(t==0)return "管理员";
		if(t==1)return "一般用户";
		return "";
	}
	public static boolean judgeFavourite1(String favourite){
		return Pattern.matches(".*(电脑网络){1}.*", favourite);
	}
	public static boolean judgeFavourite2(String favourite){
		return Pattern.matches(".*(影视娱乐){1}.*", favourite);
	}
	public static boolean judgeFavourite3(String favourite){
		return Pattern.matches(".*(棋牌娱乐){1}.*", favourite);
	}
}
