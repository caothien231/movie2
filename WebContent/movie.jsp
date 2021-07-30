<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Movie</title>
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<c:if test="${!empty param.movies_id}">
	<sql:query var="movies"  dataSource="${applicationScope.oracleDataSource}">
      select * from movies
      where movies_id = ?
      <sql:param value="${param.movies_id}"></sql:param>
    </sql:query>
   
    
    <%@ include file="header.html"%>
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
				[<a href="movie.jsp?id=${movie.movies_id}">${movie.movie_title}</a>]
				</td>
			</tr>
		</c:forEach>

	</table>
 </c:if>
 
 <form action="review.jsp" method="post">
	    <input type="hidden" value="${param.movies_id}" name="id" />
		Review <br /> <input type="text" name="review" />
		<p />
		Rating <br /> <input type="number" name="rating"  required/>
		<p />
		<input type="submit" value="Submit Review" />
	</form>

<sql:query var="reviews"  dataSource="${applicationScope.oracleDataSource}">
      select * from reviews
      where movies_id = ?
      <sql:param value="${param.movies_id}"></sql:param>
    </sql:query>
<table width="100%" cellpadding="5pt" border="1pt">
		<tr>
			<th>review_id</th>
			<th>comment</th>
			<th>rating</th>
			<th></th>
		</tr>

		<c:forEach var="reviews" items="${reviews.rows}">
			<tr>
				<td>${reviews.review_id}</td>
				<td>${reviews.review_comment}</td>
				<td>${reviews.rating}</td>
				<td align="center">
				</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>