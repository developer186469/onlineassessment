<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="head_common.jsp"/>

    <title>Online Assessment - Home Page</title>

<jsp:include page="head_files.jsp"/>

<div class="container">
<div class="row">
<div class="col-xs-12">

    <form method="POST" action="${contextPath}/login" class="form-signin">
        <h2 class="form-heading">Login</h2>

        <div class="form-group ${error != null ? 'has-error' : ''}">
            <span>${message}</span>
            <input name="username" id="username" type="email" class="form-control" placeholder="Email Id" required autofocus="true"/>
            <input name="Password" id="password" type="password" class="form-control" placeholder="Password" required/>
            <span>${error}</span>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

            <button id="login" class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
            <h4 class="text-center">New User?<a href="${contextPath}/registration">register here</a></h4>
        </div>
    </form>

</div>
</div>
</div><!-- /container -->
<jsp:include page="footer.jsp"/>
