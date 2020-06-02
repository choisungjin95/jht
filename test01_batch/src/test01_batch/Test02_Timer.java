package test01_batch;

import java.util.Calendar;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

public class Test02_Timer {
	public static void main(String[] args) {
		TimerTask task=new TimerTask() {//�����ð����� �����ؾ��� job	
			@Override
			public void run() {
				System.out.println(new Date());
			}
		};
		Timer timer=new Timer(true);
		Calendar cal=Calendar.getInstance();//������ �ð��� ���� ������ ���³�¥��ü
		cal.set(2020,4,27,17,58,0);//������ �ð� ����
		//timer.scheduleAtFixedRate(task,new Date(cal.getTimeInMillis()),2000);
		timer.schedule(task, new Date(cal.getTimeInMillis()));
		try {
			Thread.sleep(120000);
		}catch(InterruptedException ie) {
			System.out.println(ie.getMessage());
		}
		System.out.println("���α׷�����...");
		timer.cancel();//Ÿ�̸�����
	}
}









