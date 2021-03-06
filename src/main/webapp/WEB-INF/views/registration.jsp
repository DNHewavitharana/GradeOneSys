<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML>
<html>
<head>
    <title>Create new User</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/main.css" />
    <link rel="stylesheet" href="${contextPath}/resources/assets/css/customize.css" />
    <script src="${contextPath}/resources/assets/js/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
    <script src="${contextPath}/resources/validator/validateUser.js"></script>

</head>
<body class="index">
<div id="page-wrapper">
    ${nav}
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </c:if>
    <section id="banner">
        <div class="inner">
            <form:form id="contact" method="POST" modelAttribute="userForm" class="form-signin">
                <h2 class="form-signin-heading">Create New User</h2>

                <span>${message}</span>

                <spring:bind path="username">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="username" class="form-control" placeholder="Username"
                                    autofocus="true"></form:input>
                        <form:errors path="username"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path = "occupation">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:select type ="text" path = "occupation" class="select_mate">
                            <form:option value="NO">Select Occupation </form:option>
                            <form:option value="data entry">Data Entry</form:option>
                            <form:option value="admin">Admin</form:option>
                            <form:option value="reviewer">Reviewer</form:option>
                            <form:option value="interviewer">Interviewer</form:option>
                        </form:select>
                        <form:errors path="occupation"></form:errors>
                    </div>
                </spring:bind>
                <spring:bind path="sch">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="text" path="sch" class="form-control" placeholder="School id"
                                    autofocus="true"></form:input>
                        <form:errors path="sch"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="password">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
                        <form:errors path="password"></form:errors>
                    </div>
                </spring:bind>

                <spring:bind path="passwordConfirm">
                    <div class="form-group ${status.error ? 'has-error' : ''}">
                        <form:input type="password" path="passwordConfirm" class="form-control"
                                    placeholder="Confirm your password"></form:input>
                        <form:errors path="passwordConfirm"></form:errors>
                    </div>
                </spring:bind>

                <button class="button special" type="submit">Submit</button>
            </form:form>


        </div>
    </section>
        <footer id="footer">
            <ul class="copyright">
                <li><strong>Grade One Evaluating System - Ministry Of Education</strong></li>
            </ul>
            <img width="130px" height="auto" src="${contextPath}/resources/images/Aurora-logo.png" alt="">
        </footer>
</div>
<script src="${contextPath}/resources/assets/js/jquery.dropotron.min.js"></script>
<script src="${contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
<script src="${contextPath}/resources/assets/js/jquery.scrollgress.min.js"></script>
<script src="${contextPath}/resources/assets/js/skel.min.js"></script>
<script src="${contextPath}/resources/assets/js/util.js"></script>
<script src="${contextPath}/resources/assets/js/main.js"></script>

</body>
</html>



