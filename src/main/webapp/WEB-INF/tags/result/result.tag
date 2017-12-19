<%@ tag pageEncoding="utf-8" %>
<%@ tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty message }">
    <c:if test="${1001 eq message.getCode() }">
        <b> - ${message.getMsg() }</b>
    </c:if>
    <c:if test="${1002 eq message.getCode() }">
        <b class="red"> - ${message.getMsg() }</b>
    </c:if>

</c:if>
