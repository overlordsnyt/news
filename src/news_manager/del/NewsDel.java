package news_manager.del;

import common.DBHandle;

public class NewsDel {
	public static boolean judgeDel(String newsid){
		String sql="delete from news where newsid="+newsid+";";
		if(DBHandle.executeUpdate(sql)==1){
			return true;
		}
		return false;
	}

}
