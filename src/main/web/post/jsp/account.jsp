<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tags/tld/implicit.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Account</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/style/st4.css" />">
</head>
<body>
	<div class="head">
		<div class="profile">
			<div class="name">
				<c:if test="${empty user}">
					<c:redirect url="login.jsp" />
				</c:if>
				<c:if test="${not empty user}">
					<c:if test="${not empty userRole}">
						<c:if test="${userRole.name == 'admin'}">
							<img src="http://localhost:8080/FinalProject/post/jsp/admin/admin.png" />
							<c:out value="${user.firstName} ${user.lastName}" />
							&nbsp;
            (<fmt:message key="label.role.admin" />)&nbsp;
        </c:if>
						<c:if test="${userRole.name == 'client'}">
						<img src="http://localhost:8080/FinalProject/post/jsp/client/user.png" />
							<c:out value="${user.firstName} ${user.lastName}" />
           (<fmt:message key="label.role.client" />)&nbsp;
						</c:if>
						<p>
					</c:if>
					<fmt:message key="label.bill" />&nbsp;:
    <c:out value="${user.bill}" />
					<fmt:message key="label.grn" />.&nbsp;
    <c:set var="role" value="${userRole.name}" />
				</c:if>
				&nbsp;
			</div>
			<div class="b_admin">
				<c:choose>
					<c:when test="${role == 'client'}">
						<form action="/FinalProject/controller" method="post">
							<input type="hidden" name="command" value="user"> <input
								type="submit" value="<fmt:message key="button.main"/>" />
						</form>
					</c:when>
					<c:when test="${role == 'admin'}">
						<form action="/FinalProject/controller" method="post">
							<input type="hidden" name="command" value="admin"> <input
								type="submit" value="<fmt:message key="button.main"/>" />
						</form>

						<form action="/FinalProject/controller" method="post">
							<input type="hidden" name="command" value="admin"> <input
								type="submit" name="lock"
								value="<fmt:message key="button.lock_users"/>" />
						</form>
					</c:when>

				</c:choose>
				<form action="/FinalProject/controller" method="post">
					<input type="hidden" name="command" value="fundAccount"> <input
						type="submit" value="<fmt:message key="button.fund_account"/>">
				</form>

				<form action="/FinalProject/controller" method="post">
					<input type="hidden" name="command" value="openSettings"> <input
						type="submit" value="<fmt:message key="button.settings"/>">
				</form>

				<form action="/FinalProject/controller" method="post">
					<input type="hidden" name="command" value="logout"> <input
						type="submit" value="<fmt:message key="button.logOut"/>" />
				</form>
			</div>
		</div>

		<div class="content">
			<c:if test="${empty listSubscribeEdition}">
				<h3>
					<fmt:message key="account.label.have_not_subscribes" />
					!
				</h3>
			</c:if>

			<c:if test="${not empty listSubscribeEdition}">
				<fieldset>
					<legend>
						<fmt:message key="account.jsp.legend.my_subscriibes" />
					</legend>
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="unsubscribe">
						<c:forEach items="${listSubscribeEdition}" var="item">
							<p>
								<input type="checkbox" name="${item.id}" value="${item.price}">
								&nbsp; <b>"${item.name}"&nbsp;</b>
								<mytag:category id="${item.categoryId}" />
								&nbsp; ${item.price}
								<fmt:message key="label.grn" />
								.
							</p>
						</c:forEach>
						<p>
							<input type="submit"
								value="<fmt:message key="button.unsubscribe_edition"/>" />&nbsp;
						</p>
					</form>
				</fieldset>
			</c:if>
		</div>

	</div>




</body>
</html>
