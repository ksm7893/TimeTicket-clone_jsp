package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;
import com.util.DBConn;
import persistence.BannerDAOImpl;
import persistence.MainTicDAO;
import persistence.ReviewDAO;
import persistence.TopDAO;
import domain.BannerDTO;
import domain.LcateDTO;
import domain.MainTicDTO;
import domain.ReviewDTO;
import persistence.TopDAO;

public class MainHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		String tic_code = request.getParameter("tic_code") != null? request.getParameter("tic_code"):"";
		String lcate_code = request.getParameter("lcate_code") != null? request.getParameter("lcate_code"):"";
	
		System.out.println("MainHandler 호출");
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
		
		//Banner 부분
		BannerDAOImpl bdao = new BannerDAOImpl(conn);
		ArrayList<BannerDTO> list = bdao.banner();
		
		//Main 부분 - 신규, 체험/여가, 전시회, 원데이 클래스, 어린이뮤지컬, 타임세일
		MainTicDAO mtdao = new MainTicDAO(conn);
		ArrayList<MainTicDTO> newlist = mtdao.selectNew();
		ArrayList<MainTicDTO> l3list = mtdao.selectLcate3();
		ArrayList<MainTicDTO> l2list = mtdao.selectLcate2();
		ArrayList<MainTicDTO> l5list = mtdao.selectLcate5();
		ArrayList<MainTicDTO> kidslist = mtdao.selectKids();
		ArrayList<MainTicDTO> tslist = mtdao.selectTimesale();
		
		//Review 부분
		ReviewDAO rvdao = new ReviewDAO(conn);
		ArrayList<ReviewDTO> rvlist = rvdao.selectReview();
		
		request.setAttribute("llist", llist);
		request.setAttribute("newlist", newlist);
		request.setAttribute("l3list", l3list);
		request.setAttribute("l2list", l2list);
		request.setAttribute("l5list", l5list);
		request.setAttribute("kidslist", kidslist);
		request.setAttribute("tslist", tslist);
		request.setAttribute("rvlist", rvlist);
		request.setAttribute("blist", list);
		
		conn.close(); // 커넥션 풀 반환

		// 3. 포워딩
		return "/timeticket/main/main.jsp";
		
	}
}
