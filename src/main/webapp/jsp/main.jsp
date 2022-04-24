<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
        <title>MainPage</title>
    </head>
    <body>
<jsp:include page="additional.jsp"/>
     <a href="?lang=en"><img src="images/lang/usa.png" alt="English" style="width:42px;height:42px;"></a>
     <a href="?lang=ru"><img src="images/lang/rus.png" alt="Русский" style="width:42px;height:42px;"></a>
             <center>
                <i><h1><p class="text-danger"><s:message code="label.hello"/><br/></h1>
                <a href="/menu">
                <button type="button" class="btn btn-outline-danger"><s:message code="label.menu"/>
                </button></a>
                <a href="/create">
                <button type="button" class="btn btn-outline-danger"><s:message code="label.create"/>
                </button></br></a>
                <h4><p class="text-danger"><s:message code="label.slogan"/></h4></i>
            </center>
    </body>
</html>