package com.mrkimfood.gonggam.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.ObjectWriter;
import org.codehaus.jackson.map.util.JSONPObject;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONObject;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mrkimfood.gonggam.service.CompanyService;
import com.mrkimfood.gonggam.util.UseJson;
import com.mrkimfood.gonggam.vo.CompanyVO;


@Controller
public class CompanyController {

	@Inject
	private CompanyService companyService;

	//메인페이지 연결(Main page)
	@RequestMapping("/mainPage")
	public String welcome() {
		return "mainPage";
	}
	
	// 회원가입 연결 (signUp Form Forwarding)
	@RequestMapping(value="/signUp", method = RequestMethod.GET)
	public String showSignUpForm() {
		return "member/signUp";
	}

	// 회원 정보 등록 (Member registration)
	@RequestMapping(value="/signUp", method = RequestMethod.POST)
	public void register(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CompanyVO member) throws IOException{
			System.out.println("// 회원 정보 등록 (Member registration)");

		try {
			System.out.println("register_try");
			companyService.registerMember(member);
			response.sendRedirect(request.getContextPath() + "/registerSuccess");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("failMessage", member);
			System.out.println("register_catch");
			response.sendRedirect(request.getContextPath() + "/registerFailure");
		}
	}
	@RequestMapping("/registerSuccess")
	public String registerSuccess(HttpServletRequest request, HttpServletResponse response){
		return "/member/registerSuccess";
	}
	
	@RequestMapping("/registerFailure")
	public String registerFailure(HttpServletRequest request, HttpServletResponse response){
		return "member/registerFailure";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String showloginForm() {
		return "member/log-in";
	}

	// 로그인 실행 (member login)
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String doLogin(@ModelAttribute CompanyVO member,
			@RequestParam(required=false) String saveId,
			@RequestParam(required=false) String redirect,
			HttpServletRequest request,
			HttpServletResponse response) {

		CompanyVO coMember = null;

		try {
			coMember = companyService.checkLogin(member); // 회원정보를 coMember 에 담기
			if (coMember != null) {
				HttpSession session = request.getSession();
				session.setAttribute("member", coMember);
				
				if (saveId != null) {
					Cookie cookie = new Cookie("loginId", coMember.getId());
					response.addCookie(cookie);
					System.out.println(saveId);
				}else{
					Cookie cookie = new Cookie("loginId", "");
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}

				if (redirect != null && !redirect.trim().equals("")) {
					System.out.println("리더렉트 들어옴!!!");
					response.sendRedirect(request.getContextPath() + redirect);

				} else {
					System.out.println("redirect is null");
					System.out.println(redirect);
					response.sendRedirect(request.getContextPath() + "/");
				}

				return null;

			}
			request.setAttribute("loginMessage", "Login Failed");

		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("loginMessage", "Occurrence of Login Error");
		}

		return "member/log-in";
	}
	
	//회원 로그인 확인
	@RequestMapping("/members")
	public ModelAndView showMembers(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 로그인 여부 확인(login check)
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			response.sendRedirect(request.getContextPath() + "/login?redirect=member/myPage");
			return null;
		}
		// 회원목록 조회
		List<CompanyVO> memberList = null;
		try {
			memberList = companyService.getMemberList();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ModelAndView("/member/myPage", "members", memberList);
	}

	//로그아웃 (member logout)
	@RequestMapping (value="/logout")
	public void logOut(HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}

		response.sendRedirect(request.getContextPath() + "/");

	}
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public ModelAndView showMyPage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		
		if (authAndRedirect(request, response)) {
			HttpSession session = request.getSession();
			return new ModelAndView("/member/myPage", "member", session.getAttribute("member"));
		} else {
			return null;
		}
	}
	
	@RequestMapping("/modify")	//회원관리 수정-> 나진수
	public ModelAndView modifyMemberForm(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//로그인 체크
		if (!authAndRedirect(request, response)) {	// 로그인 되지 않은 상태
			return null;
		}
		HttpSession session = request.getSession();
		Integer loginMemberId = ((CompanyVO) session.getAttribute("member")).getMemberId();
		CompanyVO member = companyService.selectLoginMember(loginMemberId);
		member.setPw("");	//pw는 노출되면 안되기때문에 값을 서버에서 제거해서 클라이언트에 보냄.
		return new ModelAndView("/member/modify", "member", member);
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public void modifyMember(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CompanyVO member) throws Exception{
		HttpSession session = request.getSession();
		Integer loginMemberId = ((CompanyVO)session.getAttribute("member")).getMemberId();
		member.setMemberId(loginMemberId);
		
		//회원 정보를 수정
		companyService.modifyMember(member);
		
		//수정된 디비에서 다시 회원정보를 얻어온다.
		CompanyVO modifiedMember = companyService.selectLoginMember(loginMemberId);
		session.setAttribute("member", modifiedMember);
		
		//myPage로 이동
		response.sendRedirect(request.getContextPath() + "/myPage");
	}
	
//	@RequestMapping(value="/{task}")
//	public ModelAndView modifyMyInfo(
//			@PathVariable String task,
//			@ModelAttribute CompanyVO member,
//			HttpServletRequest request,
//			HttpServletResponse response) throws IOException {
//		
//		//	로그인 체크
//		if (!authAndRedirect(request, response)) {
//			// 로그인 되지 않은 상태
//			return null;
//		}
//		
//		if (task.equals("modify")) {
//			if (request.getMethod().equals("GET")) {
//				HttpSession session = request.getSession();
//				member = (CompanyVO) session.getAttribute("member");
//				return new ModelAndView("member/modify", "member", member);
//			} else if (request.getMethod().equals("POST")) {
//				
//				// 서비스를 통해 회원 정보 수정
//				try {
//					CompanyVO modifiedMember = companyService.modifyMember(member);
//					HttpSession session = request.getSession();
//					session.setAttribute("member", modifiedMember);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//				// mypage로 이동시킴
//				response.sendRedirect(request.getContextPath() + "/myPage");
//				return null;
//			} else {
//				response.sendRedirect(request.getContextPath() + "/myPage");
//				return null;
//			}
//		}
//		
//		return null;
//	}
	
	@RequestMapping("/passwordChange") 	//비밀번호 변경처리: 나진수
	public String passwordChangeForm(HttpServletRequest request, HttpServletResponse response) throws IOException{
		if (!authAndRedirect(request, response)) {	// 로그인 되지 않은 상태
			return null;
		}
		return "/member/passwordChange";
	}
	
	@RequestMapping(value="/passwordChange", method=RequestMethod.POST)
	public void passwordChange(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute CompanyVO companyVO) throws Exception{
		//로그인 체크
		if (!authAndRedirect(request, response)) {	// 로그인 되지 않은 상태
			return;
		}
		HttpSession session = request.getSession();
		Integer loginMemberId = ((CompanyVO)session.getAttribute("member")).getMemberId();
		companyVO.setMemberId(loginMemberId);
		
		//회원 정보를 수정
		companyService.modifyMember(companyVO);
		
		//수정된 디비에서 다시 회원정보를 얻어온다.
		CompanyVO modifiedMember = companyService.selectLoginMember(loginMemberId);
		session.setAttribute("member", modifiedMember);
		
		//myPage로 이동
		response.sendRedirect(request.getContextPath() + "/myPage");
	}
	
	@RequestMapping("/hasDeleteMember")
	public void hasDeleteMember(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//로그인 체크
		if (!authAndRedirect(request, response)) {	// 로그인 되지 않은 상태
			return;
		}
		
		//회원탈퇴 여부 판단 메세지
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter writer = response.getWriter();
		writer.append("<!DOCTYPE html>");
		writer.append("<html>");
		writer.append("<head>");
		writer.append("<script type='text/javascript'>");
		writer.append(" if (confirm('회원을 탈퇴하시겠습니까?')) { ");
		writer.append("location.replace('"+request.getContextPath()+"/deleteMember');");
		writer.append(" } else { ");
		writer.append(" window.history.go(-1) ");
		writer.append(" }");
		writer.append("</script>");
		writer.append("</head>");
		writer.append("<body>");
		writer.append("</body>");
		writer.append("</html>");
		
		writer.close();
	}
	
	@RequestMapping("/deleteMember")
	public void deleteMember(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//로그인 체크
		if (!authAndRedirect(request, response)) {	// 로그인 되지 않은 상태
			return;
		}
		System.out.println("삭제 처리");
		
		//1. Session에서 memberId를 얻어온다
		HttpSession session = request.getSession();
		Integer loginMemberId = ((CompanyVO)session.getAttribute("member")).getMemberId();
		
		//2. memberId에 해당하는 회원을 삭제처리한다.
		int isDeleteMember = companyService.deleteMember(loginMemberId);

		if(isDeleteMember ==1){
			if (session != null) {
				session.invalidate();	//3. 로그아웃 처리를 한다.
			}
			response.sendRedirect(request.getContextPath() + "/GoodByMember");	//4. 페이지를 /company로 이동시킨다.

		}else{
			System.err.println("[Error] 회원 삭제 처리가 되지 않음");
		}
	}
	
	@RequestMapping("/GoodByMember")
	public String GoodByMember(HttpServletRequest request, HttpServletResponse response){
		return "/member/GoodByeMembership";
	}
	
	@RequestMapping("/json/jsonTest")
	public @ResponseBody String memberList(HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam(required=false) String callback) throws JsonGenerationException, JsonMappingException, IOException{

		JSONPObject obj = new JSONPObject(callback, response);
		
		List<CompanyVO> memberList = null;
		try {
			memberList = companyService.getMemberList();
			obj = new JSONPObject(callback, memberList);
		} catch (Exception e) {
			e.printStackTrace();
		}

		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = ow.writeValueAsString(obj);
		
		System.out.println(json);
		
		return json;
	}
	
	@RequestMapping("/ajax/member/IdCheck")
	public @ResponseBody String memberIdCheck(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="data", required=false) String encData, @RequestParam(required=false) String callback ) throws JsonParseException, JsonMappingException, IOException{
		System.out.println(encData);
		
		//1.인코딩된 jsonData를 디코딩
		String jsonData = URLDecoder.decode(encData, "UTF-8");
		System.out.println(jsonData);
		
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> inputMap = mapper.readValue(jsonData, new TypeReference<Map<String, Object>>(){});
		String checkId = (String) inputMap.get("id");
		System.out.println(checkId);
		
		//2.아이디가 있는지 체크(있다: true, 없다: false)
		Boolean hasId = companyService.IdCheck(checkId);
		System.out.println(hasId);
		
		//3.처리 완료 후 반환할 데이터 작성
		Map<String,Object> models = new HashMap<String, Object>();
		models.put("hasId", hasId);
		
		JSONPObject jsonObj = new JSONPObject(callback, models);
		String outJsonStr = mapper.writeValueAsString(jsonObj);
		System.out.println(outJsonStr);
		
		return outJsonStr;
	}
	
	@RequestMapping("/PasswordCheck/MyInfo/modify")
	public ModelAndView myInfoModifyPasswordCheck(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//로그인 확인처리
		if (!authAndRedirect(request, response)) {
			return null;
		}
		
		Map<String, Object> models = new HashMap<String, Object>();
		String path = "/modify";
		models.put("goPath", path);
		return new ModelAndView("/com/passwordConfirm", "models", models);
	}
	
	@RequestMapping("/ajax/loginMember/PwCheck")
	public @ResponseBody String loginMemberPwCheck(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="data", required=false) String encData, @RequestParam(required=false) String callback ) throws JsonParseException, JsonMappingException, IOException{
		
		//1.인코딩된 jsonData를 디코딩
		String jsonData = URLDecoder.decode(encData, "UTF-8");
		
		//2. 입력된 password가 현제 로그인된 사용자의 password와 같은지 확인한다.
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> inputMap = mapper.readValue(jsonData, new TypeReference<Map<String, Object>>(){});
		String inputPassword = (String)inputMap.get("pw");
		System.out.println("입력받은 pw:"+inputPassword);
		HttpSession session = request.getSession(false);
		CompanyVO user = (CompanyVO)session.getAttribute("member");
		System.out.println("세션의 pw:"+user.getPw());
		Boolean hasPw;	//password 판단값을 담는 변수(같다: true, 다름: false)
		if(inputPassword.equals(user.getPw())){
			hasPw = true;
		}else{
			hasPw = false;
		}
		
		//3. password가 같은지 다른지를 판단하는 내용을 클라이언트 쪽으로 반환
		Map<String,Object> models = new HashMap<String, Object>();
		models.put("hasPw", hasPw);
		
		JSONPObject jsonObj = new JSONPObject(callback, models);
		String outJsonStr = mapper.writeValueAsString(jsonObj);
		System.out.println(outJsonStr);
		
		return outJsonStr;
	}
	
	@RequestMapping("/PasswordCheck/MyInfo/Delete")
	public ModelAndView myInfoDeletePasswordCheck(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//로그인 확인처리
		if (!authAndRedirect(request, response)) {
			return null;
		}
				
		Map<String, Object> models = new HashMap<String, Object>();
		String path = "/hasDeleteMember";
		models.put("goPath", path);
		return new ModelAndView("/com/passwordConfirm", "models", models);
	}
	

	/*기업회원관련 Util 메소드*/
	public static boolean authAndRedirect(
			HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		// 로그인 체크
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			// 로그인 되지 않은 상태
			response.sendRedirect(request.getContextPath() + "/login?redirect="
					+ URLEncoder.encode(request.getRequestURI(), "UTF-8"));
			return false;
		}
		return true;
	}
	
	public static boolean authAndRedirect(
			HttpServletRequest request,
			HttpServletResponse response,
			String redirectUrl) throws IOException {
		// 로그인 체크
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("member") == null) {
			// 로그인 되지 않은 상태
			response.sendRedirect(request.getContextPath() + "/login?redirect="
					+ URLEncoder.encode(redirectUrl, "UTF-8"));
			return false;
		}
		
		return true;
	}
	
	//나진수 -> 로그인memberId를 얻기위한 util 메소드
	public static Integer getLoginMember(HttpServletRequest request){
		HttpSession session = request.getSession(false);
		CompanyVO loginMember = null;
		
		if(session != null && session.getAttribute("member") != null){
			loginMember = (CompanyVO) session.getAttribute("member");
			Integer memberNo = loginMember.getMemberId();
			return memberNo;
			
		}else{
			return null;
		}
		
	}
}
