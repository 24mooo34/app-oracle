package controller;

import java.io.IOException;
//import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import form.ScheduleForm;
import logic.ScheduleLogic;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//フィールド		
	private ScheduleForm formSkd = new ScheduleForm();	//ScheduleFormの生成（全処理共通）		
	private ScheduleLogic sLogic = new ScheduleLogic();	//ScheduleLogicの生成（DB処理共通）
 	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
/* doGet① * カレンダーから予定追加画面に遷移（予定の新規追加）**/
		if(request.getParameter("process").equals("新規追加")) {
			//セッション取得
			HttpSession session = request.getSession();	
			//セッション破棄
			if(session != null ) {
				session.invalidate();
			}	
			//予定追加画面へ転送
			request.getRequestDispatcher("Schedule_Add.jsp").forward(request, response);		
		}

/* doGet② * 入力内容の編集* */
		if(request.getParameter("process").equals("編集")) {
			request.setCharacterEncoding("UTF-8");
				//セッション取得
				HttpSession session = request.getSession();		
				
		/* doGet②-1 * 予定追加確認画面から予定追加画面に遷移（入力内容の修正）**/
				if(request.getParameter("処理").equals("追加編集")) {
					formSkd = (ScheduleForm) session.getAttribute("formAdd"); 
					//セッションスコープ再セット
					request.setAttribute("formAdd", formSkd);
					//予定追加画面へ転送
					request.getRequestDispatcher("Schedule_Add.jsp").forward(request, response);
				}
				
		/* doGet②-2 * 予定更新確認画面から予定更新画面に遷移（入力内容の修正）**/
				if(request.getParameter("処理").equals("更新編集")) {
					formSkd = (ScheduleForm) session.getAttribute("formUp"); 
					//セッションスコープ再セット
					request.setAttribute("formUp", formSkd);
					//予定更新画面へ転送
					request.getRequestDispatcher("Schedule_Update.jsp").forward(request, response);
				}								
		}				
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

/* doPost① * 入力内容の確認 * */
		if(request.getParameter("process").equals("内容確認")) {				
			//セッション開始
			HttpSession session = request.getSession();			
			//**パラメータをsetする**
				//予定タイトル
				formSkd.setFormTitle(request.getParameter("skdTitle"));
				//開始年月日
				formSkd.setFormStartYear(request.getParameter("startYear"));
				formSkd.setFormStartMonth(request.getParameter("startMonth"));
				formSkd.setFormStartDay(request.getParameter("startDay"));		
				//終了年月日
				formSkd.setFormEndYear(request.getParameter("endYear"));
				formSkd.setFormEndMonth(request.getParameter("endMonth"));
				formSkd.setFormEndDay(request.getParameter("endDay"));
				//時刻
				formSkd.setFormStartHour(request.getParameter("startHour"));
				formSkd.setFormStartMinute(request.getParameter("startMinute"));
				formSkd.setFormEndHour(request.getParameter("endHour"));
				formSkd.setFormEndMinute(request.getParameter("endMinute"));
				//人・場所・メモ・色
				formSkd.setFormPerson(request.getParameter("person"));
				formSkd.setFormPlace(request.getParameter("place"));
				formSkd.setFormMemo(request.getParameter("memo"));		    
				formSkd.setFormColor(request.getParameter("color").substring(0, 4));	//カラーコード
				formSkd.setFormColorName(request.getParameter("color").substring(4));	//色名

		/* doPost①-1  * 予定追加画面から予定追加確認画面に遷移 * */
				if(request.getParameter("処理").equals("追加確認")) {
					//入力情報をセッションにset
					session.setAttribute("formAdd", formSkd);		
					//リクエストスコープに格納
					request.setAttribute("formAdd", formSkd);	
					//viewにフォワード
					RequestDispatcher rd = request.getRequestDispatcher("Schedule_AddCheck.jsp");
					rd.forward(request, response);	
				}
		/* doPost①-2  * 予定更新画面から予定更新確認画面に遷移 * */	
				if(request.getParameter("処理").equals("更新確認")) {
					//予定idをset
					formSkd.setFormSkd_id(request.getParameter("id"));
					//入力情報をセッションにset
					session.setAttribute("formUp", formSkd);		
					//リクエストスコープに格納
					request.setAttribute("formUp", formSkd);	
					//viewにフォワード
					RequestDispatcher rd = request.getRequestDispatcher("Schedule_UpdateCheck.jsp");
					rd.forward(request, response);	
				}

			}
		
/* doPost② * DB処理 *  */
			if(request.getParameter("process").equals("DB処理")) {
				
		/*②-1（予定追加）* 予定追加確認画面から予定追加完了画面に遷移 *  */
				if(request.getParameter("処理").equals("DB追加")) {
					//セッション取得
					HttpSession session = request.getSession();
					formSkd = (ScheduleForm) session.getAttribute("formAdd"); 				
					//予定追加ロジック
					sLogic.addSchedule(formSkd);				
					//セッション破棄
					if(session != null ) {
						session.invalidate();
					}								
					//viewにフォワード
					RequestDispatcher rd = request.getRequestDispatcher("Schedule_AddComplete.html");
					rd.forward(request, response);	
				}
		/*②-2（予定更新） * 予定更新確認画面から予定更新完了画面に遷移 *  */
				if(request.getParameter("処理").equals("DB更新")) {
					//セッション取得
					HttpSession session = request.getSession();
					formSkd = (ScheduleForm) session.getAttribute("formUp"); 				
					//予定更新ロジック
					sLogic.upSchedule(formSkd);		
					//セッション破棄
					if(session != null ) {
						session.invalidate();
					}	
					//viewにフォワード
					RequestDispatcher rd = request.getRequestDispatcher("Schedule_UpdateComplete.html");
					rd.forward(request, response);	
				}
		/*②-3（予定削除） * 予定確認画面から予定削除完了画面に遷移 *  */
				if(request.getParameter("処理").equals("DB削除")) {
					//予定id
					formSkd.setFormSkd_id(request.getParameter("id"));
					//ロジックを呼ぶ
					sLogic.delSchedule(formSkd);
					//viewにフォワード
					RequestDispatcher rd = request.getRequestDispatcher("Schedule_DeleteComplete.html");
					rd.forward(request, response);	
				}				
			}

/* doPost③  * カレンダーから予定確認画面に遷移（予定の参照） * */		
			if(request.getParameter("process").equals("参照")) {
				//セッション取得
				HttpSession session = request.getSession();
				//予定id
				formSkd.setFormSkd_id(request.getParameter("id"));
				//ロジックを呼ぶ
				ScheduleForm formRead = sLogic.readSchedule(formSkd);				
				//取得した予定をセッションにset
				session.setAttribute("formUp", formRead);		
				//リクエストスコープに格納
				request.setAttribute("formRead", formRead);	
								
				//viewにフォワード
				RequestDispatcher rd = request.getRequestDispatcher("Schedule_Read.jsp");
				rd.forward(request, response);					
			}
			

/* doPost④  * 予定確認画面から予定更新画面に遷移（予定の更新） * */					
			if(request.getParameter("process").equals("更新")) {
				request.setCharacterEncoding("UTF-8");
				//セッション取得
				HttpSession session = request.getSession();
				formSkd = (ScheduleForm) session.getAttribute("formUp"); 
				//セッションスコープ再セット
				request.setAttribute("formUp", formSkd);
				//予定追加画面へ転送
				request.getRequestDispatcher("Schedule_Update.jsp").forward(request, response);		
			}
	
	}
		
}
