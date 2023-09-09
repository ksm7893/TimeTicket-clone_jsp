package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;

import persistence.FreqDAOImpl;
import persistence.TopDAO;
import domain.FreqDTO;
import domain.LcateDTO;
import domain.PageDTO;

public class BViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String pseq = request.getParameter("freq_code");
		
		Connection conn = ConnectionProvider.getConnection();
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
		
		
		FreqDAOImpl dao = new FreqDAOImpl(conn);
		FreqDTO dto = null;
		try {
			
			dto = dao.view(pseq);
		} catch (SQLException e) {
			System.out.println("> ViewHandler.doGet() Exception");
			e.printStackTrace(); 
		}
		
		request.setAttribute("dto", dto);
		
		// 포워딩
		return "/timeticket/clientcenter/view.jsp";
	}

}
