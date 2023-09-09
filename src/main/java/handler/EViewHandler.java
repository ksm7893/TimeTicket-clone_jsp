package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.CompetitionDTO;
import domain.EdetailDTO;
import domain.JackpotDTO;
import domain.LcateDTO;
import persistence.EventDAOImpl;
import persistence.TopDAO;
import com.util.ConnectionProvider;
import com.util.DBConn;


public class EViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pseq = request.getParameter("eve_code");
		
		Connection conn = ConnectionProvider.getConnection();
		EventDAOImpl dao = new EventDAOImpl(conn);
		EdetailDTO edto = null;
		CompetitionDTO dto = null;
		ArrayList<JackpotDTO> jlist=null;
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
		
		
		try {
			dto = dao.competition(pseq);
			edto = dao.detail(pseq);
			jlist= dao.jackpot(pseq);
		} catch (SQLException e) {
			System.out.println("> EViewHandler.doGet() Exception");
			e.printStackTrace(); 
		}
		conn.close(); // 커넥션 풀 반환
		request.setAttribute("dto", dto);
		request.setAttribute("edto", edto);
		request.setAttribute("jlist", jlist);
		request.setAttribute("llist", llist);
		// 포워딩
		return "/timeticket/event/eviewsum.jsp";
	}

}
