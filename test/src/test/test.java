package test;

import java.util.ArrayList;

public class test {
	public static void main(String[] args) {
		String content="1234aasd\r\nsad\r\n#������ \r\n#����� ����\r\n�ٶ�<br>";
		String[] str=content.split("\\s");
		ArrayList<String> list=new ArrayList<String>();
		for(String s:str) {
			if(s.contains("#")) {
				s.trim();
				list.add(s);
			}
		}
		for(String l:list) {
			System.out.println(l);
		}
	}
}








