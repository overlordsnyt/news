package common;

import java.util.Arrays;

public class Dome {

	public static void main(String[] args) {
		String sql="select * from news where userid='傲娇';";
		int col=5;
		System.out.println(Arrays.deepToString(DBHandle.executeResult(sql,3, col)));
	}

}
