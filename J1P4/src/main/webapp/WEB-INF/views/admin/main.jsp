<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file = "../include/header.jsp"%>

<script>
    var ht = null;
    (function(id, scriptSrc, callback) {
        var d = document,
            tagName = 'script',
            $script = d.createElement(tagName),
            $element = d.getElementsByTagName(tagName)[0];

        $script.id = id;
        $script.async = true;
        $script.src = scriptSrc;

        if (callback) { $script.addEventListener('load', function (e) { callback(null, e); }, false); }
        $element.parentNode.insertBefore($script, $element);
    })('happytalkSDK', 'https://chat-static.happytalkio.com/sdk/happytalk.chat.v2.min.js', function() {
        ht = new Happytalk({
          siteId: '3000000803',
          siteName: '아이티윌',
          categoryId: '182760',
          divisionId: '182761'
      });
    });
</script>

<%@ include file = "../include/footer.jsp"%>