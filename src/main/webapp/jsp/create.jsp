<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<html style="background: url(images/backgrounds/background2/.jpg)">
    <head>
        <title>Create.Step1</title>
    </head>
    <body>
        <jsp:include page="additional.jsp"/>
     <a href="?lang=en"><img src="images/lang/usa.png" alt="English" style="width:42px;height:42px;"></a>
     <a href="?lang=ru"><img src="images/lang/rus.png" alt="Русский" style="width:42px;height:42px;"></a>
     <i><h1><p class="text-center text-danger"><s:message code="label.createA"/>!<br/></h1>
     <div class="progress">
       <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
     </div>
     <center>
     <h4><s:message code="label.step1"/></i><span>&#x1F609</span><i><h4><hr>

<form method="post" action="/create">

<h4><c:forEach var="ingredient" items="${ingredients}">
    <div class="card"style="width: 15rem;">
      <img src="${ingredient.imgSource}" class="card-img-top" alt=<s:message code="${ingredient.name}"/>>
      <div class="card-body">
        <h5 class="card-title"><s:message code="${ingredient.name}"/></h5>
        <p class="card-text"><small class="text-danger">${ingredient.price} BYN/${ingredient.weight} gr.</small></p>
        <input type="checkbox" name="innerIngredients" value="${ingredient.id}"><s:message code="label.select"/>
      </div>
</div>
</c:forEach></br>

<button type="submit" class="btn btn-outline-danger"><s:message code="label.next"/></button>
</form></h4>

            <a href="/">
            <button type="button" class="btn btn-outline-danger">
            <s:message code="label.returnOnMain"/></button></a>
           </center><br>
        </i>
    </body>
</html>