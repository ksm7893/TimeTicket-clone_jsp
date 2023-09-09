package ajax.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import net.sf.json.JSONObject;
import handler.CommandHandler;
import view.service.CalendarTimeDAO;

public class CalendarHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		System.out.println("ajaxCaledarHandler 호출");
		String tic_code = request.getParameter("tic_code");
		int year = 0;
		int month = 0;
		int date = 0;
		String time = request.getParameter("time");
		try {
			 year = Integer.parseInt(request.getParameter("year"));
			 month = Integer.parseInt(request.getParameter("month"));
			 date = Integer.parseInt(request.getParameter("date"));
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		
		System.out.printf("%s / %d %d %d / %s",tic_code,year,month,date,time);
		JSONObject obj=null;
		CalendarTimeDAO dao = new CalendarTimeDAO();
		if(time == null) {
			obj = dao.timeSelect(year, month, date, tic_code, conn);
		}else {
			obj = dao.gwonSelect(year,month,date,time,tic_code,conn);
		}
		conn.close();
		return obj.toString();
	}

}
