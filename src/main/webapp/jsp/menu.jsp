<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html style="background: url(images/backgrounds/background2.jpg) no-repeat center center fixed">
    <head>
        <title>Menu</title>
    </head>
<jsp:include page="additional.jsp"/>
     <a href="?lang=en"><img src="images/icons/usa.png" alt="English" style="width:42px;height:42px;"></a>
     <a href="?lang=ru"><img src="images/icons/rus.png" alt="Русский" style="width:42px;height:42px;"></a>
<center>
                <i><h1><p class="text-danger"><s:message code="label.menu"/>:<br/></h1></i><hr>
<form method="post" action="/menu">
    <div class="textcols">
        <c:forEach items="${menuRolls}" var="roll">
         <table>
            <div class="textcols-item">
                <tr align="center">
            <th><s:message code="${roll.name}"/>
            <input type="checkbox" name="orderedRolls" value="${roll.id}">
             <font color="D21B09"><h5>${roll.price}BYN</font>/${roll.weight} gr.</h5></th></tr>
                <tr align="center">
             <td><img src="${roll.imgSource}" style="width: 14rem;height:12rem"class="img-thumbnail" alt="${roll.name}"></br></td></tr>
     </div>
   </table>
 </c:forEach></div></br><hr style="border: 1px solid red;">
        <button type="submit" class="btn btn-outline-danger">
        <img src="images/icons/order.png" alt=<s:message code="label.order"/> style="width:42px;height:42px;"><s:message code="label.order"/></button><hr style="border: 1px solid red;">
             <i><h1><p class="text-danger text-center"><s:message code="label.rollCollection"/>:</h1></i>
   <table>
     <tr align="center">
          <th><p class="text-danger"<s:message code="label.name"/></th>
          <th><s:message code="label.inside"/>:</th>
          <th><s:message code="label.cover"/>:</th>
          <th><s:message code="label.weight"/></th>
          <th><s:message code="label.price"/></th>
          <th><s:message code="label.order"/></th>
     </tr>
   <c:forEach items="${createdRolls}" var="roll">
        <tr align="center">
              <td>${roll.name}</p></td>
              <td><c:forEach var="innerIngredient" items="${roll.inner.innerIngredients}">
              <img src="${innerIngredient.imgSource}" style="width: 8rem"class="img-thumbnail" alt=<s:message code="${innerIngredient.name}"/>>
              </c:forEach></td>
              <td> <c:forEach var="coverIngredient" items="${roll.cover.coverIngredients}">
              <img src="${coverIngredient.imgSource}" style="width: 8rem"class="img-thumbnail" alt=<s:message code="${coverIngredient.name}"/>>
              </c:forEach></td>
              <td> ${roll.weight}</td>
              <td> ${roll.price}</td>
              <td><input type="checkbox" name="orderedRolls" value="${roll.id}"></td>
          </tr>
     </c:forEach>
   </table><hr>
</form>
<a href="/">
<button type="button" class="btn btn-outline-danger"><s:message code="label.returnOnMain"/></button></a><br/>
</center>
</body>
</html>