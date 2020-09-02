<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<jsp:include page="head_common.jsp"/>

    <title>Registration Page</title>

<jsp:include page="head_files.jsp"/>

<div class="container">
<div class="row">
<div class="col-xs-12">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
        <h2 class="form-signin-heading">Registration</h2>
         
          <spring:bind path="firstname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input id="firstname" type="text" path="firstname" class="form-control" placeholder="firstname" autofocus="true"></form:input>
                <form:errors path="firstname"></form:errors>
            </div>
        </spring:bind>
        
          <spring:bind path="lastname">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input id="lastname" type="text" path="lastname" class="form-control" placeholder="lastname" autofocus="true"></form:input>
                <form:errors path="lastname"></form:errors>
            </div>
        </spring:bind>
       
        
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input id="email" type="email" path="username" class="form-control" placeholder="Email ID" autofocus="true"></form:input>
                <form:errors path="username"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="password">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <form:input id="password" type="password" path="password" class="form-control" placeholder="Password"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

       <button id="register" class="btn btn-primary btn-lg btn-block" type="submit">Register</button>
    </form:form>

</div>
</div>
</div><!-- /container -->
<jsp:include page="footer.jsp"/>
