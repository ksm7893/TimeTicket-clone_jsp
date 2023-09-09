package sale.command;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import domain.LcateDTO;
import handler.CommandHandler;
import persistence.TopDAO;
import sale.service.SaleBannerDAO;
import sale.service.TodaySaleDAOImpl;

public class SaleHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Connection conn = ConnectionProvider.getConnection();
		System.out.println("sale핸들러 호출");
		
		//TOP 부분
		TopDAO tdao = new TopDAO(conn);
		ArrayList<LcateDTO> llist = tdao.select();	
		
		String contextPath = request.getContextPath();
		
		SaleBannerDAO dao = new SaleBannerDAO();
		String timeContent = dao.timeString(contextPath, conn);
		String todayContent = dao.todayString(contextPath,conn);
		
		TodaySaleDAOImpl tddao = new TodaySaleDAOImpl(conn);
		String todayList = tddao.todayList(contextPath);
		String timeList = tddao.timesaleList(contextPath);
		
		request.setAttribute("llist", llist);
		request.setAttribute("timecontent", timeContent);
		request.setAttribute("todaycontent", todayContent);
		request.setAttribute("todayList", todayList);
		request.setAttribute("timeList", timeList);
		
		conn.close();
		return "/timeticket/sale/salesum.jsp";
	}

}
