<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
		<c:if test="${!empty param.rating}">
					
						<sql:update dataSource="${applicationScope.oracleDataSource}"
							var="count">
							insert into reviews values(review_id_seq.nextval,?,?,?)
							<sql:param value="${param.id}" />
							<sql:param value="${param.review}" />
							<sql:param value="${param.rating}" />
						</sql:update>
						
						<c:if test="${count > 0}">
							<h3>[${param.title}] has been added successfully!</h3>
						</c:if>
						
						<c:if test="${count == 0}">
							<h3>Sorry! [${param.title}] could not be added due to error!</h3>
						</c:if>
					<c:redirect url="movie.jsp?movies_id=${param.id}"></c:redirect>
					</c:if>
					
	
</body>
</html>

		
