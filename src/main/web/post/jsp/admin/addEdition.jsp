<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Add edition</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/style/st4.css" />">
</head>
<body>
	<c:if test="${not empty user and userRole.name == 'admin'}">
		<div class="head">
			<div class="profile">
				<div class="name">
					<img src="http://localhost:8080/FinalProject/post/jsp/admin/admin.png">
					<c:out value="${user.firstName} ${user.lastName}" />
					&nbsp;

					<c:if test="${not empty userRole}">
        (<fmt:message key="label.role.admin" />) &nbsp;
        <p>
					</c:if>
					<fmt:message key="label.bill" />
					:
					<c:out value="${user.bill}" />
					<fmt:message key="label.grn" />
					.&nbsp;
				</div>

				<div class="b_admin">
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="admin"> <input
							type="submit" value="<fmt:message key="button.main"/>" />
					</form>
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="account"> <input
							type="submit" value=" <fmt:message key="button.account"/>" />
					</form>
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="logout"> <input
							type="submit" value="<fmt:message key="button.logOut"/>" />
					</form>
				</div>
			</div>

			<div class="content">
				<fieldset id="registration_form">
					<legend>
						<fmt:message key="addEdition_jsp.legend.add_edition_form" />
					</legend>
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="addEdition" />
						<p>
							<fmt:message key="addEdition_jsp.label.name_edition" />
							: <input name="name" maxlength="100"
								pattern="[\sA-Za-zА-Яа-яЁё0-9]{2,}"
								title="<fmt:message key="title.name_edition"/>" required><br />
						</p>
						<p>
							<fmt:message key="addEdition_jsp.label.price_edition" />
							: <input type="number" name="price" value="0" size="6" min="1"
								max="10000" step="1" required><br />
						</p>
						<p>
							<fmt:message key="addEdition_jsp.label.category_edition" />
							: <input name="category" maxlength="50"
								pattern="[\sA-Za-zА-Яа-яЁё0-9]{2,}"
								title="<fmt:message key="title.category_edition"/>" required><br />
						</p>
						<p>
							<input type="submit"
								value="<fmt:message key="addEdition_jsp.button.add"/>">
					</form>
				</fieldset>
			</div>
		</div>

	</c:if>
</body>
</html>
