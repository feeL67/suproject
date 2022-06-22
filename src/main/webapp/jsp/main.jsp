<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html style="background: url(images/backgrounds/background1.jpg) no-repeat center center fixed">
    <head>
        <title>MainPage</title>
    </head>
    <body>
<jsp:include page="additional.jsp"/>
     <a href="?lang=en"><img src="images/icons/usa.png" alt="English" style="width:42px;height:42px;"></a>
     <a href="?lang=ru"><img src="images/icons/rus.png" alt="Русский" style="width:42px;height:42px;"></a>
             <center>
                <h1><p class="text-danger"><s:message code="label.hello"/><br/></h1>
                <a href="/menu">
                <button type="button" class="btn btn-outline-danger"><s:message code="label.menu"/></button></a>
                <a href="/create">
                <button type="button" class="btn btn-outline-danger"><s:message code="label.create"/></button></a>
                <a href="/collection">
                <button type="button" class="btn btn-outline-danger"><s:message code="label.rollCollection"/></button></a><br>
                <h4><p class="text-danger"><s:message code="label.slogan"/></h4>
            </center>
    </body>
</html>