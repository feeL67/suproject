<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html style="background: url(images/backgrounds/background3.jpg)">
    <head>
        <title>Order2</title>
    </head>
<jsp:include page="additional.jsp"/>
<center>
                <i><h1><p class="text-danger text-center"><s:message code="label.checkout"/>:</h1><hr>
<p class="text-center text-warning"><s:message code="label.processed"/><hr>
              <a href="/">
              <button type="button" class="btn btn-outline-danger"><s:message code="label.returnOnMain"/></button></a><br>
</center>
</body>
</html>