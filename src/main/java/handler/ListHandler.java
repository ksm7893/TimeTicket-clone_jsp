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
import persistence.GongDAOImpl;
import persistence.TopDAO;
import domain.FreqDTO;
import domain.GongDTO;
import domain.LcateDTO;
import domain.PageDTO;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("list핸들러 호출");
		
		int currentPage = 1; // 현재 페이지 번호
		int numberPerPage = 10; // 한 페이지에 출력할 게시글 수
		int numberOfPageBlock = 5;
		int total = 0; // 총 레코드 수
		
		Connection conn = ConnectionProvider.getConnection();
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();
		
		String pd = "board_notice";
		 pd =  request.getParameter("tb") == null ? "board_faq" : request.getParameter("tb");		 
		try {
			currentPage = Integer.parseInt(request.getParameter("currentpage"));
		} catch (Exception e) {}
		
		// 자주묻는 질문 페이징 처리
		if (pd.equals("board_faq")) {
			int currentPage1 = 1; // 현재 페이지 번호
			int numberPerPage1 = 8; // 한 페이지에 출력할 게시글 수
			int numberOfPageBlock1 = 4;
			int total1 = 0; // 총 레코드 수
		}
		

		ArrayList<GongDTO> glist = null; 
		ArrayList<FreqDTO> flist = null;
		

		if ( pd.equals("board_notice") ) {
			// 공지사항 
			GongDAOImpl dao = new GongDAOImpl(conn);
			glist = dao.selectGong(currentPage, numberPerPage);
			total = dao.getTotal( );
			request.setAttribute("list", glist);
		}else if (pd.equals("board_faq")) {
			FreqDAOImpl dao = new FreqDAOImpl(conn);
			flist = dao.selectFreq(currentPage, numberPerPage);
			total = dao.getTotal( );
			request.setAttribute("list", flist);
		}else if (pd.equals("board_private")) {
			
		} 

		conn.close(); // 커넥션 풀 반환

		//

		// PageDTO
		PageDTO pdto = new PageDTO(currentPage, numberPerPage, numberOfPageBlock, total);

		request.setAttribute("llist", llist);
		request.setAttribute("pdto", pdto);

		// 포워딩
		// 리다이렉트 할거면 null로 준다
		return "/timeticket/clientcenter/list.jsp";
	}

}
