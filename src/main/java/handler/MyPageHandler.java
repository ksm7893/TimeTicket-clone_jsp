package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.ConnectionProvider;
import com.util.DBConn;
import persistence.MainTicDAO;
import persistence.ReviewDAO;
import persistence.TopDAO;
import persistence.UsableticketCountDAO;
import domain.LcateDTO;
import domain.MainTicDTO;
import domain.ReviewDTO;
import domain.UsableticketCountDTO;
import member.service.MemberDTO;
import persistence.TopDAO;

public class MyPageHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		String tic_code = request.getParameter("tic_code") != null? request.getParameter("tic_code"):"";
		String lcate_code = request.getParameter("lcate_code") != null? request.getParameter("lcate_code"):"";
	
		System.out.println("MyPageHandler 호출");
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
		
		//세션가져오기
		HttpSession logs = request.getSession();
		MemberDTO dto = (MemberDTO) logs.getAttribute("meminfo");
		
		//Review 부분
		ReviewDAO rvdao = new ReviewDAO(conn);
		ArrayList<ReviewDTO> rvlist = rvdao.selectReview();
		
		//이용가능 티켓개수
		UsableticketCountDAO utc = new UsableticketCountDAO(conn);
		ArrayList<UsableticketCountDTO> useablelist = utc.selectUsableTic(dto.getmem_id());
		
				
		request.setAttribute("llist", llist);
		request.setAttribute("rvlist", rvlist);
		request.setAttribute("useablelist", useablelist);
		
		conn.close(); // 커넥션 풀 반환

		// 3. 포워딩
		return "/timeticket/mypage/review.jsp";
		
	}
}
