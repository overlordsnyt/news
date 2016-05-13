package common;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

public class Demo {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

//		String sqlNote="select note from userinfo where username='"+"斐济企鹅"+"';",
//				sqlType="select type from userinfo where username='"+"斐济企鹅"+"';";
//		String note=DBHandle.executeQuery(sqlNote);
//		String type=DBHandle.executeQuery(sqlType);
//		System.out.println(note);
//		System.out.println(type);
//		
//		String username="王企鹅";
//		Userinfo ui=new Userinfo();
//		ui.setInfoByUsername(username);
//		System.out.println(ui.getPassword());
		
//		Timestamp pubtime=new Timestamp(new Date().getTime());
//		System.out.println(pubtime);
		
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//		String d="2008-10-13 15:20:25";
//		try {
//			System.out.println(sdf.parse(d));
//			System.out.println(new Date());
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		String str="三角地哦期间电脑戏大神都去";
		System.out.println(Pattern.matches(".*(电脑游戏){1}.*", str));
	}

}
