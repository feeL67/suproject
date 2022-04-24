<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html style="background: url(images/backgrounds/background2/.jpg)">
    <head>
        <title>Create.Step3</title>
     </head>
     <body>
        <jsp:include page="additional.jsp"/></br>
       <c:if test="${coverIngredients != null}">
       <center><h1></br>
       <p class="text-danger"></i><s:message code="${coverIngredients}"/><i></br>
       <a href="/create/2">
       <button type="button" class="btn btn-outline-danger">
       <s:message code="label.back"/></button></a>
       </center></h1>
       <figure hidden>
       </c:if>

     <i><h1><p class="text-center text-danger"><s:message code="label.createC"/>!<br/></h1>
        <div class="progress">
          <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" role="progressbar" style="width: 90%" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <center>
        <h4><s:message code="label.step3"/><h4><hr>

<p class="text-center text-danger"><s:message code="label.inside"/>:
        <c:forEach var="innerIngredient" items="${rollInner.innerIngredients}">
        <img src="${innerIngredient.imgSource}" style="width: 10rem"class="img-thumbnail" alt=<s:message code="${innerIngredient.name}"/>>
        </c:forEach> </br>

<s:message code="label.cover"/>:
         <c:forEach var="coverIngredient" items="${rollCover.coverIngredients}">
         <img src="/${coverIngredient.imgSource}" style="width: 10rem"class="img-thumbnail" alt=<s:message code="${coverIngredient.name}"/>>
         </c:forEach>

<h5><p class="text-center text-success"><s:message code="label.total"/>: ${roll.price}BYN/${roll.weight} gr.</h5>

<form method="post" action="/create/3">
<s:message code="label.name"/>: <input type="text" name="name">
<button type="submit" class="btn btn-outline-danger"><s:message code="label.next"/></button>
</form></h4>
            <a href="/create/2">
            <button type="button" class="btn btn-outline-danger">
            <s:message code="label.back"/></button></a>
            <a href="/">
            <button type="button" class="btn btn-outline-danger">
            <s:message code="label.returnOnMain"/></button></a>
           </center>
        </i>
    </body>
</html>