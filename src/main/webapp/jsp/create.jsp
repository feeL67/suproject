<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html style="background: url(images/backgrounds/background3.jpg) no-repeat center center fixed">
    <head>
        <title>Create.Step1</title>
    </head>
    <body>
        <jsp:include page="additional.jsp"/>
     <a href="?lang=en"><img src="images/icons/usa.png" alt="English" style="width:42px;height:42px;"></a>
     <a href="?lang=ru"><img src="images/icons/rus.png" alt="Русский" style="width:42px;height:42px;"></a>
<center>
     <i><h1><p class="text-danger"><s:message code="label.createA"/>!<br/></h1>
     <div class="progress">
       <div class="progress-bar progress-bar-striped progress-bar-animated bg-danger" role="progressbar" style="width: 15%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
     </div>
     <h4><s:message code="label.step1"/></i><i></h4><hr>
<form method="post" action="/create">
<div class="textcols">
<c:forEach var="ingredient" items="${ingredients}">
    <table>
        <div class="textcols-item">
        <tr align="center">
            <td><img src="${ingredient.imgSource}" style="width: 15rem;height:12rem"class="img-thumbnail" alt="${ingredient.name}">
            <p class="text-danger"><s:message code="${ingredient.name}"/></br>
            <input type="checkbox" name="innerIngredients" value="${ingredient.id}"><font color="white"><s:message code="label.select"/></font></br>
            ${ingredient.price} BYN/${ingredient.weight} gr.</td></tr>
        </div>
    </table>
</c:forEach></div>
<br><button type="submit" class="btn btn-outline-danger"><s:message code="label.next"/></button>
</form>
            <hr><a href="/">
            <button type="button" class="btn btn-outline-danger">
            <s:message code="label.returnOnMain"/></button></a>
           </center><br>
        </i>
    </body>
</html>