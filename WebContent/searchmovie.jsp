<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List Of Books</title>
<link rel="stylesheet" href="styles.css" />
</head>
<body>
			<%@ include file="header.html"%>
			<h2>Search Movies</h2>	
			<form action="searchmovie.jsp" method="post">
					Title <br /> <input type="text" name="movie_title"
						required /> <input type="submit" value="Search" />
			</form>
			<p />
			<c:if test="${!empty param.movie_title}">
					<sql:query var="movies"
						dataSource="${applicationScope.oracleDataSource}">
			           select * from movies
			           where  instr(upper(movie_title),?) >= 1
			           order by movies_id
			          <sql:param value="${param.movie_title.toUpperCase()}" />
					
					</sql:query>
					
					<c:if test="${movies.rowCount == 0}">
						<h3>Sorry! No movie found!</h3>
					</c:if>
			
					<c:if test="${movies.rowCount > 0}">
					<table width="100%" cellpadding="5pt" border="1pt">
						<tr>
							<th>title</th>
							<th>director</th>
							<th>actors</th>
							<th></th>
						</tr>
				
						<c:forEach var="movie" items="${movies.rows}">
							<tr>
								<td>${movie.movie_title}</td>
								<td>${movie.director}</td>
								<td>${movie.actors}</td>
								<td align="center">
								[<a href="movie.jsp?movies_id=${movie.movies_id}">${movie.movie_title}</a>]
								</td>
							</tr>
						</c:forEach>
				
					</table>
					</c:if>
				</c:if>
</body>
</html>
