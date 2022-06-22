<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html style="background: url(/images/backgrounds/background3.jpg)">
    <head>
        <title>Create.Step4</title>
    </head>
<body>
<jsp:include page="additional.jsp"/></br>
    <c:if test="${name != null}">
    <center><h1></br><p class="text-danger"></i><s:message code="${name}"/><i></br>
    <a href="/create/3">
    <button type="button" class="btn btn-outline-danger">
    <s:message code="label.back"/></button></a>
    </center></h1>
    <figure hidden>
    </c:if>
<c:if test="${exc != null}">
    <div id="error">
<h5><p class="text-center text-primary"><s:message code="label.exc"/></p></h5>
    </div>
</c:if>
     <i><h1><p class="text-center text-danger"><s:message code="label.congratulations"/>!<br/></h1>
        <div class="progress">
          <div class="progress-bar progress-bar-striped progress-bar-animated bg-primary" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
        </div>
        <center>
        <h4><s:message code="label.step4"/></h4><hr>
<p class="text-danger"><s:message code="label.created"/> ${roll.name} !</p>
<s:message code="label.inside"/>:
        <c:forEach var="innerIngredient" items="${roll.inner.innerIngredients}">
        <img src="${innerIngredient.imgSource}" style="width: 10rem"class="img-thumbnail" alt=<s:message code="${innerIngredient.name}"/>>
        </c:forEach>
        <img src="/images/ingredients/rice.jpg" style="width: 10rem"class="img-thumbnail" alt=<s:message code="label.rice"/>> </br>
<s:message code="label.cover"/>:
                <c:forEach var="coverIngredient" items="${roll.cover.coverIngredients}">
                <img src="${coverIngredient.imgSource}" style="width: 10rem"class="img-thumbnail" alt=<s:message code="${coverIngredient.name}"/>>
                </c:forEach>
<br><p class="text-danger"><s:message code="label.total"/>: ${roll.price}BYN/${roll.weight} gr.<hr>
            <a href="/collection">
            <button type="button" class="btn btn-outline-danger"><s:message code="label.rollCollection"/></button></a>
            <a href="/">
            <button type="button" class="btn btn-outline-danger"><s:message code="label.returnOnMain"/></button></a>
            <a href="/menu">
            <button type="button" class="btn btn-outline-danger"><s:message code="label.menu"/></button></a>
           </center>
        </i>
    </body>
</html>