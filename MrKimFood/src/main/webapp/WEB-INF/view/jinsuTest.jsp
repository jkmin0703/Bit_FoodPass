<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
<jsp:include page="com/header.jsp"></jsp:include>
 -->
 
<jsp:include page="com/header.jsp"></jsp:include>

<!-- body -->
<div class="main">

<p>
[JSP]<br/>
<%=request.getServerName() %><br/>
<%=request.getServerPort() %><br/>
<%=request.getRequestURI() %><br/>
contextPath: <%=request.getContextPath()%><br/>
<img src="http://placehold.it/200x100">123
</p>

 <p>
[JSTL]<br/>
1) request<br/>
${pageContext.request.serverName}<br/>
${pageContext.request.serverPort}<br/>
${pageContext.request.requestURI}<br/><br/>

2) response<br/>
${pageContext.response.characterEncoding}<br/>
 </p>

</div>
 
<jsp:include page="com/footer.jsp"></jsp:include>