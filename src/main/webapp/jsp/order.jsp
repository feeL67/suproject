<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html style="background: url(images/backgrounds/background3.jpg)">
    <head>
        <title>Collection</title>
    </head>
<jsp:include page="additional.jsp"/>
  <c:if test="${orderedRolls != null}">
       <center><h1></br>
       <p class="text-danger"></i><s:message code="${orderedRolls}"/><i></br>
       <a href="/menu">
       <button type="button" class="btn btn-outline-danger">
       <s:message code="label.back"/></button></a>
       </center></h1>
       <figure hidden>
       </c:if>
<center>
                <i><h1><p class="text-danger text-center"><s:message code="label.checkout"/>:<hr></h1>
<s:message code="label.yourOrder"/>:
    <p class="text-danger text-center"><c:forEach var="roll" items="${order.orderedRolls}">
        ${roll.name} (${roll.price} BYN)</br>
         </c:forEach></p></i>
    <s:message code="label.total"/>: ${order.price} BYN. </br>
        <form method="post" action="/order">
    <s:message code="label.customerName"/>*:
        <input type="text" id="customerName" name="customerName" placeholder=<s:message code="label.nameExample"/>>
            <c:if test="${customerName != null}"><s:message code="${customerName}"/></c:if></br>
    <s:message code="label.deliveryToAddress"/> — 5 BYN, <img src="images/icons/90mins.jpg" alt="90mins" style="width:84px;height:84px;"></br>
    <h5><s:message code="label.specifyAddress"/></h5>
    <s:message code="label.address"/>*:
        <input type="text" id="customerAddress" name="customerAddress" placeholder=<s:message code="label.addressExample"/>>
            <c:if test="${customerAddress != null}"><s:message code="${customerAddress}"/></c:if></br>
    <s:message code="label.telephone"/>*:
        +375 <input type="text" id="customerPhoneNumber" name="customerPhoneNumber" placeholder="33-937-99-95">
            <c:if test="${customerPhoneNumber != null}"><s:message code="${customerPhoneNumber}"/></c:if></br>
    <s:message code="label.numberOfAppliances"/>*:
        <input type="number" name="numberOfAppliances" min="1" max="10" value="1" id="numberOfAppliances">
            <c:if test="${numberOfAppliances != null}"><s:message code="${numberOfAppliances}"/></c:if></br>
    <s:message code="label.payment"/>:<select name="payment">
                                   <option disabled><s:message code="label.selectPaymentMethod"/>:</option>
                                   <option value="Сash Payment"><s:message code="label.cashPayment"/></option>
                                   <option value="Сard Payment"><s:message code="label.cardPayment"/></option></select></br>
    <s:message code="label.comment"/>: <input type="text" id="comment" name="comment" placeholder=<s:message code="label.orderComment"/>></br>
    <br><button type="submit" class="btn btn-outline-danger"><s:message code="label.order"/></button>
    </form><hr>
              <a href="/">
              <button type="button" class="btn btn-outline-danger"><s:message code="label.returnOnMain"/></button></a><br>
</center>
</body>
</html>