package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;


import persistence.GongDAOImpl;
import persistence.TopDAO;
import domain.GongDTO;
import domain.LcateDTO;


public class GViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pseq = request.getParameter("noti_num");
		
		Connection conn = ConnectionProvider.getConnection();
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();
				
		GongDAOImpl dao = new GongDAOImpl(conn);
		GongDTO dto = null;
		try {
			
			dto = dao.view(pseq);
		} catch (SQLException e) {
			System.out.println("> GViewHandler.doGet() Exception");
			e.printStackTrace(); 
		}
		
		request.setAttribute("llist", llist);
		request.setAttribute("dto", dto);
		
		// 포워딩
		return "/timeticket/clientcenter/gview.jsp";
	}

}
