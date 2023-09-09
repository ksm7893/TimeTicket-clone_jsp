package view.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import view.service.ViewDAO;
import handler.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class ViewajaxHandler  implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("> ajax ViewajaxHandler 핸들러 호출..............");
		Connection conn = ConnectionProvider.getConnection();
		
		 
		
		String tic_code = request.getParameter("tic_code");
		String type = request.getParameter("type"); // 1, 2,3,4,
		String jsonData;
		
		
		ViewDAO dao = new ViewDAO();
		
		if( type.equals("1")) {
			jsonData  = dao.view(conn, tic_code);	  
			return jsonData;
		} else if(type.equals("2")) {
			jsonData = dao.viewplace(conn, tic_code);
			return jsonData;
		}
		
		return "";
	}

}
