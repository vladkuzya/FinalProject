<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mytag" uri="/WEB-INF/tags/tld/implicit.tld"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<title>Client</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/style/st4.css" />">
</head>
<body>
	<c:if test="${not empty user and userRole.name == 'client'}">
		<div class="head">
			<div class="profile">
				<div class="name">
					<img src="http://localhost:8080/FinalProject/post/jsp/client/user.png" />
					<c:out value="${user.firstName} ${user.lastName}" />
					&nbsp;
					<c:if test="${not empty userRole}">
        (<fmt:message key="label.role.client" />) &nbsp;
        </c:if>
					<p>
						<fmt:message key="label.bill" />
						:
						<c:out value="${user.bill}" />
						<fmt:message key="label.grn" />
						.&nbsp;
				</div>
				<div class="b_admin"></div>
			</div>
			<div class="content">
				<%@ include file="/WEB-INF/include/selectLanguage.jspf"%>
				<div class="b_cabinet">
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="account"> <input
							type="submit" value="<fmt:message key="button.account"/>" />
					</form>
				</div>

				<div class="b_logout">
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="logout"> <input
							type="submit" value="<fmt:message key="button.logOut"/>" />
					</form>
				</div>

				<%@ include file="/WEB-INF/include/searchAndSorting.jspf"%>


				<script>
        var sum = 0;
        var set = new Set();
        function total(id) {
            var cost = Number(document.getElementById(id).value);
            var status = document.getElementById("status");
            if (set.has(id)) {
                sum -= cost;
                set.delete(id);
            }
            else {
                sum += cost;
                set.add(id);
            }
            status.innerHTML = "<fmt:message key="label.total"/>: " + sum;
        }
        function getSum() {
            return sum;
        }
    </script>


				<fieldset>
					<legend>
						<fmt:message key="index_jsp.legend.edition" />
					</legend>
					<form action="/FinalProject/controller" method="post">
						<input type="hidden" name="command" value="subscribe">
						<c:forEach items="${editionList}" var="item">
							<p>
								<input type="checkbox" name="${item.id}" value="${item.price}"
									id="${item.id}" onclick="total(this.id)"> &nbsp; <b>"${item.name}"&nbsp;
								</b>
								<mytag:category id="${item.categoryId}" />
								&nbsp; ${item.price}
								<fmt:message key="label.grn" />
								.
							</p>

						</c:forEach>
						<p>
							<input type="submit"
								value="<fmt:message key="button.subscribe_edition"/>">&nbsp;
							<span id="status"></span>
						</p>
					</form>
				</fieldset>

			</div>
		</div>







	</c:if>
</body>
</html>
