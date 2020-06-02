package test01_batch;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class Test02_Timer {
	public static void main(String[] args) {
		TimerTask task=new TimerTask() {//일정시간마다 수행해야할 job	
			@Override
			public void run() {
				System.out.println(new Date());
			}
		};
		Timer timer=new Timer(true);
		Calendar cal=Calendar.getInstance();//실행할 시간에 대한 정보를 갖는날짜객체
		cal.set(2020,4,27,17,58,0);//실행할 시간 설정
		//timer.scheduleAtFixedRate(task,new Date(cal.getTimeInMillis()),2000);
		timer.schedule(task, new Date(cal.getTimeInMillis()));
		try {
			Thread.sleep(120000);
		}catch(InterruptedException ie) {
			System.out.println(ie.getMessage());
		}
		System.out.println("프로그램종료...");
		timer.cancel();//타이머해제
	}
}









