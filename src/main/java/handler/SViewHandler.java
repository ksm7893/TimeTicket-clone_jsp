package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.LcateDTO;
import domain.SearchDTO;
import persistence.SearchDAOImpl;
import persistence.TopDAO;
import com.util.ConnectionProvider;
import com.util.DBConn;


public class SViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String sw = request.getParameter("searchword");
		
		Connection conn = ConnectionProvider.getConnection();
		SearchDAOImpl dao = new SearchDAOImpl(conn);
		System.out.println("SViewHandler 호출");
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();
		
		
		ArrayList<SearchDTO> searchlist = null;
		
		
		try {
			searchlist= dao.search(sw);
		} catch (SQLException e) {
			System.out.println("> EViewHandler.doGet() Exception");
			e.printStackTrace(); 
		}
		
		conn.close(); // 커넥션 풀 반환
		request.setAttribute("llist", llist);
		request.setAttribute("searchlist", searchlist);
		

		// 포워딩/=
		return "/timeticket/main/searchsum.jsp";
	}

}
