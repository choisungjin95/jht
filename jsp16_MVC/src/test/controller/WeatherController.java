package test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/weather.do")
public class WeatherController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String day=req.getParameter("day");
		String result="";
		if(day.equals("1")) {
			result="맑음";
		}else if(day.equals("2")) {
			result="비가 많이 옴";
		}
		req.setAttribute("result",result);
		req.getRequestDispatcher("/showWeather.jsp").forward(req, resp);
	}
}









