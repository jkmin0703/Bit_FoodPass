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

public final class FPfooter_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
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

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<footer class=\"prodcthead\">\r\n");
      out.write("\t<ul class=\"text-center list-inline\">\r\n");
      out.write("\t\t<li><a href=\"http://www.therdoresoft.com/kr/legal\"\r\n");
      out.write("\t\t\tdata-slot-name=\"footerConfig\" data-feature-name=\"Footer Navigation\"\r\n");
      out.write("\t\t\tdata-display-name=\"사용 약관\">사용 약관</a></li>\r\n");
      out.write("\t\t<li><a href=\"http://www.theodoresoft.com/kr/privacy\"\r\n");
      out.write("\t\t\tdata-slot-name=\"footerConfig\" data-feature-name=\"Footer Navigation\"\r\n");
      out.write("\t\t\tdata-display-name=\"개인정보 취급방침\"> 개인정보 취급방침</a></li>\r\n");
      out.write("\t\t<li><a href=\"www.theodoresofr.com/kr/open/salespolicies\"\r\n");
      out.write("\t\t\tdata-slot-name=\"footerConfig\" data-feature-name=\"Footer Navigation\"\r\n");
      out.write("\t\t\tdata-display-name=\"판매 및 환불정책\" target=\"popup-w550-h600\"> 판매 및 환불정책</a></li>\r\n");
      out.write("\t</ul>\r\n");
      out.write("\r\n");
      out.write("\t<div class=\"text-center pricing\">\r\n");
      out.write("\t\t사업자등록번호 : 120-8X-XXXX | 통신판매업신고번호 : 제 2014-서울서초-0XXXX호 <br />대표이사 :\r\n");
      out.write("\t\t공감팀 | 주소 : 서울시 서초구 서초동 1327-33번지 지하 1층 스터디룸 <br />대표전화 : 080-XXX-XXXX\r\n");
      out.write("\t\t| 팩스 : 02-XXX-XXXX\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<p>\r\n");
      out.write("\t<center>theodoresoft copyright ⓒ theodoresoft corp. All Right\r\n");
      out.write("\t\tReserved.</center>\r\n");
      out.write("\t</p>\r\n");
      out.write("</footer>\r\n");
      out.write("<p></p>\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
}