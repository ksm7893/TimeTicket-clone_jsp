package handler;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import domain.LcateDTO;
import persistence.TopDAO;
import preview01.domain.Preview01DAOImpl;
import preview01.domain.Preview01DTO;
import preview02.domain.Preview02DAOImpl;
import preview02.domain.Preview02DTO;
import section01.domain.Section01DAOImpl;
import section01.domain.Section01DTO;
import section03.domain.Section03DAOImpl;
import section03.domain.Section03DTO;
import section04.domain.Section04DAOImpl;
import section04.domain.Section04DTO;
import timesale.domain.TimesaleDAOImpl;
import timesale.domain.TimesaleDTO;
import todaysale.domain.TodaysaleDAOImpl;
import todaysale.domain.TodaysaleDTO;


public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String tic_code= request.getParameter("tic_code");  
		
		Connection conn = ConnectionProvider.getConnection();
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();
		
		Section01DAOImpl vdao = new Section01DAOImpl(conn);
		Section01DTO vdto = null;
		
		TimesaleDAOImpl tvdao = new TimesaleDAOImpl(conn);
		TimesaleDTO tvdto = null;
		
		
		TodaysaleDAOImpl tdvdao = new TodaysaleDAOImpl(conn);
		TodaysaleDTO tdvdto = null;
		
		Preview01DAOImpl p1dao = new Preview01DAOImpl(conn);
		Preview01DTO p1dto = null;
		
		ArrayList<Preview02DTO> plist = null;
		Preview02DAOImpl p2dao = new Preview02DAOImpl(conn);
		
		Section03DAOImpl idao = new Section03DAOImpl(conn);
		Section03DTO idto = null;
		
		Section04DAOImpl pdao = new Section04DAOImpl(conn);
		Section04DTO pdto = null;
		

		
		try {
			vdto = vdao.view(tic_code);	 // 2096	
			tvdto = tvdao.timeview(tic_code);
			tdvdto = tdvdao.todayview(tic_code);// 2096		
			p1dto = p1dao.preview1(tic_code);
			plist = p2dao.preview2(tic_code);
			idto = idao.infoview(tic_code);
			pdto = pdao.placeview(tic_code);
		} catch (SQLException e) {
			System.out.println("> ViewHandler.doGet() Exception");
			e.printStackTrace();
		} 
		conn.close(); // 커넥션 풀 반환
		
		
		request.setAttribute("llist", llist);
		request.setAttribute("vdto", vdto);
		request.setAttribute("tvdto", tvdto);
		request.setAttribute("tdvdto", tdvdto);
		request.setAttribute("p1dto", p1dto);
		request.setAttribute("plist", plist);
		request.setAttribute("idto", idto);
		request.setAttribute("pdto", pdto);
		
		
		// 3. 포워딩
		return "/timeticket/detail/viewsum.jsp";

	}
}
