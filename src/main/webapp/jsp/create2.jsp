<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html style="background: url(images/backgrounds/background2/.jpg)">
    <head>
        <title>Create.Step2</title>
     </head>
     <body>
        <jsp:include page="additional.jsp"/></br>
       <c:if test="${innerIngredients != null}">
       <center><h1></br>
       <p class="text-danger"></i><s:message code="${innerIngredients}"/><i></br>
       <a href="/create">
       <button type="button" class="btn btn-outline-danger">
       <s:message code="label.back"/></button></a>
       </center></h1>
       <figure hidden>
       </c:if>

     <i><h1><p class="text-center text-danger"><s:message code="label.createB"/>!<br/></h1>
        <div class="progress">
          <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <center>
        <h4><s:message code="label.step2"/><h4><hr>

        <p class="text-center text-danger"><s:message code="label.inside"/>:

        <c:forEach var="innerIngredient" items="${rollInner.innerIngredients}">
        <img src="${innerIngredient.imgSource}" style="width: 10rem"class="img-thumbnail" alt=<s:message code="${innerIngredient.name}"/>>
        </c:forEach>
        <h5><p class="text-center text-warning"><s:message code="label.total"/>: ${rollInner.price}BYN/${rollInner.weight} gr.</h5>

<form method="post" action="/create/2">
<h4><c:forEach var="cover" items="${covers}">
    <div class="card"style="width: 15rem;">
      <img src="/${cover.imgSource}" class="card-img-top" alt=<s:message code="${cover.name}"/>>
      <div class="card-body">
        <h5 class="card-title"><s:message code="${cover.name}"/></h5>
        <p class="card-text"><small class="text-danger">${cover.price} BYN/${cover.weight} gr.</small></p>
        <input type="radio" name="coverIngredients" value="${cover.id}"><s:message code="label.select"/>
      </div>
</div>
</c:forEach></br>
<button type="submit" class="btn btn-outline-danger"><s:message code="label.next"/></button>
</form></h4>

            <a href="/create">
            <button type="button" class="btn btn-outline-danger">
            <s:message code="label.back"/></button></a>
            <a href="/">
            <button type="button" class="btn btn-outline-danger">
            <s:message code="label.returnOnMain"/></button></a>
           </center><br>
        </i>
    </body>
</html>