/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.47
 * Generated at: 2016-12-14 14:29:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.com;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class FPheader_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
 request.setCharacterEncoding("utf-8"); 
      out.write('\r');
      out.write('\n');
 response.setContentType("text/html; charset=utf-8"); 
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"utf-8\">\r\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\r\n");
      out.write("<title>FOOD-PASS</title>\r\n");
      out.write("\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/lib/jquery.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/bootstrap.min.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/js/respond.js\"></script>\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/lib/jquery-1.11.2.min.js\"></script>\r\n");
      out.write("\r\n");
      out.write("<link rel=\"icon\" href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/css/mycss/food-PassFavicons.ico\">\r\n");
      out.write("\r\n");
      out.write("<!-- Bootstrap -->\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/css/nomalize.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/css/bootstrap.min.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/css/bootstrap.css\" rel=\"stylesheet\">\r\n");
      out.write("<link href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/img/com/food-PassFavicons.ico\" rel=\"icon\">\r\n");
      out.write("\r\n");
      out.write("<!-- 개인 작성 -->\r\n");
      out.write("<script src=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/lib/ajax/com_ajax.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\t$(document).ready(function(){\r\n");
      out.write("\t\t\r\n");
      out.write("\t\tvar hasId = false;\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//idCheck 변수를 클릭\r\n");
      out.write("\t\t$(\"#ID\").focusout(function(){\r\n");
      out.write("\t\t\t// json 형태의 데이터를 담는다.\r\n");
      out.write("\t\t\tif($(\"#ID\").val() == \"\"){\r\n");
      out.write("\t\t\t\t$(\"#IdStateInfo\").empty();\r\n");
      out.write("\t\t\t\t$(\"#IdStateInfo\").html(\"<p style='color:red;'>아이디를 입력해 주시기 바랍니다.<p>\");\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t\tvar sendData = {\r\n");
      out.write("\t\t\t\t\tid : $(\"#ID\").val()\r\n");
      out.write("\t\t\t\t};\r\n");
      out.write("\t\t\t\tconsole.log(sendData);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t//데이터를 String 형태로 변환\r\n");
      out.write("\t\t\t\tvar json_data = JSON.stringify(sendData);\r\n");
      out.write("\t\t\t\tconsole.log(json_data);\r\n");
      out.write("\t\t\t\t\r\n");
      out.write("\t\t\t\t//Jsonp로 Ajax 통신을 한다.\r\n");
      out.write("\t\t\t\t$.ajax({\r\n");
      out.write("\t\t\t\t\ttype:\"GET\",\r\n");
      out.write("\t\t\t\t\turl:\"/ajax/member/IdCheck\",\r\n");
      out.write("\t\t\t\t\tdataType:\"jsonp\",\r\n");
      out.write("\t\t\t\t\tdata : {\r\n");
      out.write("\t\t\t\t\t\t\"data\" : encodeURIComponent(json_data)\r\n");
      out.write("\t\t\t\t\t},\r\n");
      out.write("\t\t\t\t\tsuccess : function(data) {\r\n");
      out.write("\t\t\t\t\t\t// 통신이 성공적으로 이루어졌을 때 이 함수를 타게 된다.\r\n");
      out.write("\t\t                 console.log(data);\r\n");
      out.write("\t\t\t\t\t\tif(data.hasId === true){\r\n");
      out.write("\t\t\t\t\t\t\tconsole.log(\"아이디: O\");\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#IdStateInfo\").empty();\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#IdStateInfo\").html(\"<p style='color:red;'>해당 아이디는 이미 사용중입니다.<p>\");\r\n");
      out.write("\t\t\t\t\t\t\thasId = true;\r\n");
      out.write("\t\t\t\t\t\t}else{\r\n");
      out.write("\t\t\t\t\t\t\tconsole.log(\"아이디: X\");\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#IdStateInfo\").empty();\r\n");
      out.write("\t\t\t\t\t\t\t$(\"#IdStateInfo\").html(\"<p>사용 가능한 아이디 입니다.<p>\");\r\n");
      out.write("\t\t\t\t\t\t\thasId = false;\r\n");
      out.write("\t\t\t\t\t\t}\r\n");
      out.write("\t\t           },\r\n");
      out.write("\t\t           error : function(xhr, status, error) {\r\n");
      out.write("\t\t                 alert(\"에러발생\");\r\n");
      out.write("\t\t           }\r\n");
      out.write("\t\t\t\t});\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t})\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t//회원가입 버튼을 클릭\r\n");
      out.write("\t\t$(\"#signUp_saveBtn\").click(function(){\r\n");
      out.write("\r\n");
      out.write("\t\t\tvar licenseNumCheck = true;\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//사업자 등록번호에 숫자값만 들어가 있는지 체크\r\n");
      out.write("\t\t\tif($(\"#licenseNum\").val() !=\"\"){ \r\n");
      out.write("\t\t\t\tfor(var i=0;i<$(\"#licenseNum\").val().length;i++){\r\n");
      out.write("\t\t\t\t\tvar l_char=$(\"#licenseNum\").val().substr(i,1);\r\n");
      out.write("\t\t\t\t\tif( !(l_char.charCodeAt(0)>47 && l_char.charCodeAt(0)<58) ){\r\n");
      out.write("\t\t\t\t\t\tlicenseNumCheck = false;\r\n");
      out.write("\t\t\t\t\t\tbreak;\r\n");
      out.write("\t\t\t\t\t}\r\n");
      out.write("\t\t\t\t}\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\t\r\n");
      out.write("\t\t\t//조건문 실행 실행\r\n");
      out.write("\t\t\tif($(\"#ID\").val()==\"\"){\r\n");
      out.write("\t\t\t\talert(\"아이디를 입력해 주시기 바랍니다.\");\r\n");
      out.write("\t\t\t\t$(\"#ID\").focus();\r\n");
      out.write("\t\t\t}else if(hasId == true){\r\n");
      out.write("\t\t\t\talert(\"이미 사용중인 아이디입니다.\\n\"+\r\n");
      out.write("\t\t\t\t\t\"다른 아이디를 입력해 주시기 바랍니다.\");\r\n");
      out.write("\t\t\t\t$(\"#ID\").focus();\r\n");
      out.write("\t\t\t}else if($(\"#Password\").val() ==\"\" || $(\"#PasswordCheck\").val()==\"\" || $(\"#Password\").val() !== $(\"#PasswordCheck\").val()){\r\n");
      out.write("\t\t\t\talert(\"비밀번호가 일치하지 않습니다. \\n\"+\r\n");
      out.write("\t\t\t\t\t\"비밀번호를 올바르게 입력해 주십시오.\");\r\n");
      out.write("\t\t\t\t$(\"#Password\").val(\"\");\r\n");
      out.write("\t\t\t\t$(\"#PasswordCheck\").val(\"\");\r\n");
      out.write("\t\t\t\t$(\"#Password\").focus();\r\n");
      out.write("\t\t\t}else if($(\"#businessName\").val()==\"\"){\r\n");
      out.write("\t\t\t\talert(\"법인명을 입력하지 않았습니다. \\n\"+\r\n");
      out.write("\t\t\t\t\t\"법인명을 입력해 주세요.\");\r\n");
      out.write("\t\t\t\t$(\"#businessName\").focus();\r\n");
      out.write("\t\t\t}else if($(\"#licenseNum\").val()==\"\" || $(\"#licenseNum\").val().length!=10 || licenseNumCheck == false){\r\n");
      out.write("\t\t\t\talert(\"사업자 등록번호를 올바로 입력하지 않았습니다.\\n\"+\r\n");
      out.write("\t\t\t\t\t\"사업자 등록번호를 다시 입력해 주세요.\");\r\n");
      out.write("\t\t\t\t$(\"#licenseNum\").focus();\r\n");
      out.write("\t\t\t}else if( $(\"#presidant\").val()==\"\"){\r\n");
      out.write("\t\t\t\talert(\"대표자 명을 입력해 주세요.\");\r\n");
      out.write("\t\t\t\t$(\"#presidant\").focus();\r\n");
      out.write("\t\t\t}else{\r\n");
      out.write("\t\t\t\t$(\"#signUpForm\").submit();\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t})\r\n");
      out.write("\t});\r\n");
      out.write("\t\r\n");
      out.write("\tfunction initRegMember(){\r\n");
      out.write("\t\t$(\"#ID\").val(\"\");\r\n");
      out.write("\t\t$(\"#IdStateInfo\").empty();\r\n");
      out.write("\t\t$(\"#Password\").val(\"\");\r\n");
      out.write("\t\t$(\"#PasswordCheck\").val(\"\");\r\n");
      out.write("\t\t$(\"#businessName\").val(\"\");\r\n");
      out.write("\t\t$(\"#licenseNum\").val(\"\");\r\n");
      out.write("\t\t$(\"#presidant\").val(\"\");\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<div class=\"container\">\r\n");
      out.write("\t\t<header class=\"prodcthead\">\r\n");
      out.write("\t\t<h1>\r\n");
      out.write("\t\t\t<b><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/\">FOOD-PASS</a></b>\r\n");
      out.write("\t\t</h1>\r\n");
      out.write("\t\t<div class=\"sns pull-right\">\r\n");
      out.write("\t\t\t<ul>\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/\" class=\"foodpass\">홈</a></li>\r\n");
      out.write("\t\t\t\t");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t");
      if (_jspx_meth_c_005fif_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t\t\t<li><a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/company/customerCenter/FAQ\" class=\"foodpass\">고객센터</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t</header>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t <div class=\"modal fade\" id=\"signUpModal\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\">\r\n");
      out.write("\t\t  <div class=\"modal-dialog\">\r\n");
      out.write("\t\t    <div class=\"modal-content\">\r\n");
      out.write("\t\t      <div class=\"modal-header\">\r\n");
      out.write("\t\t        <button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">×</button>\r\n");
      out.write("\t\t        <h4 class=\"modal-title\"><b>Membership Join</b></h4>\r\n");
      out.write("\t\t      </div>\r\n");
      out.write("\t\t      <div class=\"modal-body\">\r\n");
      out.write("\t\t      \t\t<br/><br/>\r\n");
      out.write("\t\t\t\t\t<div class=\"row\" style=\"margin-left:-15px;\">\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t\t<form id=\"signUpForm\" class=\"form-horizontal\" role=\"form\" action=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
      out.write("/signUp\" method=\"post\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label for=\"ID\" class=\"col-lg-3 control-label\">ID</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-lg-8\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"ID\" class=\"form-control\" name=\"id\" placeholder=\"ID\" maxlength=\"10\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label for=\"IdStateInfo\" class=\"col-lg-3 control-label\"></label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div\tclass=\"col-lg-9\" id=\"IdStateInfo\"></div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label for=\"Password\" class=\"col-lg-3 control-label\">Password</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-lg-8\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"password\" id=\"Password\" class=\"form-control\" name=\"pw\" placeholder=\"Password\" maxlength=\"10\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-lg-8 col-md-offset-3\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"password\" id=\"PasswordCheck\" class=\"form-control\" placeholder=\"Password 확인\" maxlength=\"10\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label for=\"businessName\" class=\"col-lg-3 control-label\">법인 명</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-lg-8\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"businessName\" class=\"form-control\" name=\"businessName\" placeholder=\"법인명\" maxlength=\"20\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label for=\"licenseNum\" class=\"col-lg-3 control-label\">사업자 등록번호</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-lg-8\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"licenseNum\" class=\"form-control\" name=\"licenseNum\" placeholder=\"사업자 등록번호 10자리 ( - 생략)\" maxlength=\"10\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"form-group\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<label for=\"presidant\" class=\"col-lg-3 control-label\">대표자 명</label>\r\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"col-lg-8\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<input type=\"text\" id=\"presidant\" class=\"form-control\" name=\"presidant\" placeholder=\"대표자 명\" maxlength=\"20\">\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</form>\r\n");
      out.write("\t\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t      </div>\r\n");
      out.write("\t\t      <div class=\"modal-footer\">\r\n");
      out.write("\t\t        <button type=\"button\" id=\"signUp_saveBtn\" class=\"btn btn-primary\">Save changes</button>\r\n");
      out.write("\t\t        <button type=\"button\" id=\"signUp_closeBtn\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\r\n");
      out.write("\t\t      </div>\r\n");
      out.write("\t\t    </div><!-- /.modal-content -->\r\n");
      out.write("\t\t  </div><!-- /.modal-dialog -->\r\n");
      out.write("\t\t</div><!-- /.modal -->");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /WEB-INF/view/com/FPheader.jsp(151,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ empty member.id }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t<li><a href=\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
        out.write("/login\" class=\"foodpass\">로그인</a></li>\r\n");
        out.write("\t\t\t\t<li><a href=\"#signUpModal\" class=\"foodpass\" data-toggle=\"modal\" onclick=\"initRegMember()\">회원가입</a></li>\r\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }

  private boolean _jspx_meth_c_005fif_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f1 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f1.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f1.setParent(null);
    // /WEB-INF/view/com/FPheader.jsp(155,4) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f1.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${ not empty member.id }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f1 = _jspx_th_c_005fif_005f1.doStartTag();
    if (_jspx_eval_c_005fif_005f1 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        out.write("\r\n");
        out.write("\t\t\t\t<li><a href=\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
        out.write("/logout\" class=\"foodpass\">로그아웃</a></li>\r\n");
        out.write("\t\t\t\t<li><a href=\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
        out.write("/company/myShopList\" class=\"foodpass\">내 가게</a></li>\r\n");
        out.write("\t\t\t\t<li><a href=\"");
        out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false));
        out.write("/myPage\" class=\"foodpass\">내 정보</a></li>\r\n");
        out.write("\t\t\t\t");
        int evalDoAfterBody = _jspx_th_c_005fif_005f1.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f1);
    return false;
  }
}
