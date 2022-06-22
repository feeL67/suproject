<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html style="background: url(/images/backgrounds/background3.jpg) no-repeat center center fixed">
    <head>
        <title>Create.Step2</title>
     </head>
     <body>
       <jsp:include page="additional.jsp"/>
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
        <h4><s:message code="label.step2"/></h4><hr>
        <s:message code="label.inside"/>:
        <c:forEach var="innerIngredient" items="${rollInner.innerIngredients}">
        <img src="${innerIngredient.imgSource}" style="width: 10rem"class="img-thumbnail" alt=<s:message code="${innerIngredient.name}"/>>
        </c:forEach></br>
        <p class="text-center text-warning"><s:message code="label.total"/>: ${rollInner.price}BYN/${rollInner.weight} gr.<hr>
<form method="post" action="/create/2">
<div class="textcols">
<c:forEach var="cover" items="${covers}">
<table>
<div class="textcols-item">
        <tr align="center">
 <td><img src="${cover.imgSource}" style="width: 15rem;height:12rem"class="img-thumbnail" alt="${cover.name}">
            <p class="text-warning"><s:message code="${cover.name}"/></br>
            <input type="radio" name="coverIngredients" value="${cover.id}"><font color="white"><s:message code="label.select"/></font></br>
            ${cover.price} BYN/${cover.weight} gr.</td></tr>
        </div>
    </table>
</c:forEach></div>
<button type="submit" class="btn btn-outline-danger"><s:message code="label.next"/></button><hr>
</form>
            <a href="/create">
            <button type="button" class="btn btn-outline-danger"><s:message code="label.back"/></button></a>
            <a href="/">
            <button type="button" class="btn btn-outline-danger"><s:message code="label.returnOnMain"/></button></a>
           </center><br>
        </i>
    </body>
</html>