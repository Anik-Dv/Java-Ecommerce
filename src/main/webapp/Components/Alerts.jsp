<%@ include file="common_css_js.jsp"%>

<%
String mgs = (String) session.getAttribute("message");

if (mgs != null) {
%>
<div class="alert alert-success alert-dismissible fade show"
	role="alert">
	<strong><%=mgs%></strong>
	<button type="button" class="btn-close" data-bs-dismiss="alert"
		aria-label="Close"></button>
</div>
<%
session.removeAttribute("message");
}
%>