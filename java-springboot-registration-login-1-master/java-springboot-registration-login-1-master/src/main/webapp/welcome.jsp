<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="head_common.jsp"/>

    <title>Registration Confirmation</title>

<jsp:include page="head_files.jsp"/>

<div class="container">
<div class="row">
<div class="col-xs-12">

    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
		<h2>Registered Successfully</h2>
        <h2> <a  href="${contextPath}/login">Login</a></h2>

    </c:if>

</div>
</div>
</div><!-- /container -->
<jsp:include page="footer.jsp"/>
