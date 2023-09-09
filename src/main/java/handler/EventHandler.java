package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.EdetailDTO;
import domain.LcateDTO;
import persistence.EventDAOImpl;
import persistence.TopDAO;
import com.util.ConnectionProvider;
import com.util.DBConn;



public class EventHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("event핸들러 호출");
		ArrayList<EdetailDTO> elist = null;

		Connection conn = ConnectionProvider.getConnection();
		EventDAOImpl dao = new EventDAOImpl(conn);
		
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
		
		
try {
	elist = dao.select();
} catch (Exception e) {
	System.out.print(e.toString());
}
						
		conn.close(); // 커넥션 풀 반환

		request.setAttribute("elist", elist);
		request.setAttribute("llist", llist);
		
		return "/timeticket/event/eventsum.jsp";
	}

}

