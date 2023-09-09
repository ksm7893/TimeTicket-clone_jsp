package sale.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import handler.CommandHandler;
import sale.service.SaleBannerDAO;
import sale.service.SaleBannerDTO;

public class SaleBannerHandler  implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ajax saleBanner핸들러 호출");
		Connection conn = ConnectionProvider.getConnection();
		
		JSONObject obj = new JSONObject();
		
		String type = request.getParameter("type");
		
		JSONArray saleArr = new JSONArray();
		
		SaleBannerDAO dao = new SaleBannerDAO();
		JSONObject timeobj = dao.timeselect(conn);
		saleArr.add(timeobj);
		JSONObject todayobj = dao.todayselect(conn);
		saleArr.add(todayobj);
		
		// {  "saleList" :    [ {   "timeList" : [  {},{} ]  } , {   "todayList" : [  {},{} ]  }]  }
		obj.put("saleList",saleArr);
		conn.close();
		return obj.toString();
	}

}
