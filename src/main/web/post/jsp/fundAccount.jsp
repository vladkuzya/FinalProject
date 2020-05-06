<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Fund Account</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/style/st4.css" />">
</head>
<body>
	<c:if test="${not empty user}">
		<div class="head">
			<div class="profile">
				<div class="name">

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
						&nbsp;
            (<fmt:message key="label.role.client" />)&nbsp;
        </c:if>
        <p>
					</c:if>
					<fmt:message key="label.bill" />
					:
					<c:out value="${user.bill}" />
					<fmt:message key="label.grn" />
					.&nbsp;
				</div>
				<div class="b_admin">
					<c:set var="role" value="${userRole.name}" />

					<c:choose>
						<c:when test="${role == 'client'}">
							<form action="/FinalProject/controller" method="post">
								<input type="hidden" name="command" value="user"> <input
									type="submit" value="<fmt:message key="button.main"/>" />
							</form>
						</c:when>
						<c:otherwise>
							<form action="/FinalProject/controller" method="post">
								<input type="hidden" name="command" value="admin"> <input
									type="submit" value="<fmt:message key="button.main"/>" />
							</form>
						</c:otherwise>

					</c:choose>

					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="account"> <input
							type="submit" value="<fmt:message key="button.account"/>" />
					</form>

					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="logout"> <input
							type="submit" value="<fmt:message key="button.logOut"/>" />
					</form>
				</div>
			</div>
			<div class="content">
				<form action="/FinalProject/controller" method="post">
					<input type="hidden" name="command" value="replenish">
					<fmt:message key="label.amount_replenish" />
					: &nbsp; <input type="number" name="summa" value="0" size="6"
						min="1" max="10000" step="1" required> <input
						type="submit" value="<fmt:message key="button.replenish"/>">
				</form>
			</div>
		</div>



		</p>



	</c:if>
</body>
</html>
