package etc;

public class MyElClass {
	public String getGender(String number) {
		String returnStr ="";
		int beginIdx = number.indexOf("-")+1;
		String genderStr = number.substring(beginIdx, beginIdx+1);
		int genderInt = Integer.parseInt(genderStr);
		if(genderInt == 1 || genderInt== 3 ) {
			returnStr = "남자";
		}else if(genderInt==2 || genderInt==4) {
			returnStr = "여자";
		}else {
			returnStr = "주민번호 오류";
		}
		return returnStr;
	}
	
	public String getGender() {
		System.out.println("getGender()호출");
		return getGender("001225-300000");
	}
	
	public static boolean isNumber(String value) {
		char[] charArr = value.toCharArray();
		for(int i=0; i<charArr.length; i++) {
			if(!(charArr[i]>'0' && charArr[i]<'9')) {
				return false;
			}
		}
		return true;
	}
	
	public static String showGugudan(int limitDan) {
		StringBuffer sb = new StringBuffer();
		try {
			sb.append("<table border='1'>");
			for(int i=2; i<=limitDan; i++) {
				sb.append("<tr>");
				for(int j=1; j<=9; j++) {
					sb.append("<td>"+i+"*"+j+"="+i*j+"</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
		}catch(Exception e){
			e.printStackTrace();
			
		}
		return sb.toString();
	}
	
}
