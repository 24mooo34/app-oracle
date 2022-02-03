package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import dao.DBconnection;
import form.CalendarForm;
import logic.CalendarLogic;

@WebServlet("/CalendarServlet")
public class CalendarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//先月or来月表示用
		String stryear = request.getParameter("year");
		String strmonth = request.getParameter("month");

		CalendarLogic cLogic = new CalendarLogic();	//CalendarLogicの生成
		CalendarForm calendar = null;	//CalendarFromの生成
		//カレンダーの取得
		if(stryear != null  &&  strmonth != null) {	/*今月のカレンダーを取得している場合*/
					int year = Integer.parseInt(stryear);
					int month = Integer.parseInt(strmonth);
			if(month == 0) {	//今月が1月の場合
				month = 12;
				year--;	//昨年
			}
			if(month == 13) {	//今月が12月の場合
				month = 1;
				year++;	//来年
			}
			//今月から先月or来月を表示させる
			calendar = cLogic.createCalendar(year,month);
		}else {	/*ホーム画面を初回アクセスの場合*/
			//ホーム画面を初回表示させる
			calendar = cLogic.createCalendar();
		}
			
		//リクエストスコープに格納
		request.setAttribute("calendar", calendar);	

		//viewにフォワード
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/MonthCalendar.jsp");
		rd.forward(request, response);
						
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//viewにフォワード
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/DayCalendar.jsp");
		rd.forward(request, response);
	}		

}
