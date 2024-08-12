<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "../include/adminHeader.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    

    document.addEventListener("DOMContentLoaded", function() {
        var freelancerCount = ${freelancerCount};
        var clientCount = ${clientCount};
        var projectStatusCountsJson = '<c:out value="${projectStatusCounts}" escapeXml="false"/>';
        console.log("Raw JSON: ", projectStatusCountsJson);

        try {
            var projectStatusCounts = JSON.parse(projectStatusCountsJson);
            console.log("Parsed JSON: ", projectStatusCounts);

            // 프리랜서와 클라이언트 비율 차트
            var ctx = document.getElementById('userRatioChart').getContext('2d');
            new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['프리랜서', '클라이언트'],
                    datasets: [{
                        data: [freelancerCount, clientCount],
                        backgroundColor: ['#36A2EB', '#FF6384']
                    }]
                }
            });

            // 프로젝트 상태 차트
            var ctx2 = document.getElementById('projectStatusChart').getContext('2d');
            var projectStatuses = projectStatusCounts.map(function(item) { return item.proj_status; });
            var projectCounts = projectStatusCounts.map(function(item) { return item.count; });
            new Chart(ctx2, {
                type: 'doughnut',
                data: {
                    labels: projectStatuses,
                    datasets: [{
                        data: projectCounts,
                        backgroundColor: ['#36A2EB', '#FF6384', '#FFCE56', '#4BC0C0', '#9966FF']
                    }]
                }
            });
        } catch (e) {
            console.error("Error parsing JSON: ", e);
        }
    });
    
    function showAnnouncement(id) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/J1P4_PTP/admin/announcement?id=' + id, true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    var data = JSON.parse(xhr.responseText);
                    document.getElementById('announcementModalTitle').innerText = data.title;
                    document.getElementById('announcementModalContent').innerText = data.content;
                    $('#announcementModal').modal('show');
                } else {
                    console.error('There was a problem with the request:', xhr.statusText);
                }
            }
        };
        xhr.send();
    }
</script>

<style>
    .chart-container {
        width: 60%;
        margin: auto;
    }
</style>

<section class="content-header">
    <h1>관리자 메인 페이지</h1>
</section>

<section class="content">
    <!-- 공지사항 리스트 -->
    <div class="row">
        <div class="col-lg-12 col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">공지사항</h3>
                </div>
                <div class="box-body">
                    <ul class="list-group">
                        <c:forEach var="notice" items="${latestNotices}">
                            <li class="list-group-item">
                                <a href="#" onclick="showAnnouncement(${notice.announcement_id})">${notice.title}</a>
                                <span class="badge">${notice.created_at}</span>
                            </li>
                        </c:forEach>
                    </ul>
                    <a href="/J1P4_PTP/admin/notices" class="btn btn-primary">전체 공지사항 보기</a>
                </div>
            </div>
        </div>
    </div>
    <!-- 공지사항 리스트 -->
    
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>${userCount}</h3>
                    <p>유저</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
                <a href="/J1P4_PTP/admin/users?type=all" class="small-box-footer">자세히 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-xs-6">
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>${projectCount}</h3>
                    <p>프로젝트</p>
                </div>
                <div class="icon">
                    <i class="ion ion-pie-graph"></i>
                </div>
                <a href="/J1P4_PTP/admin/projects" class="small-box-footer">자세히 <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <c:if test="${sessionScope.manager.manager_id == 'admin'}">
            <div class="col-lg-3 col-xs-6">
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3>${managerCount}</h3>
                        <p>매니저</p>
                        <c:if test="${unapprovedManagerCount > 0}">
                            <span class="badge badge-danger">미승인된 매니저 수: ${unapprovedManagerCount}</span>
                        </c:if>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person"></i>
                    </div>
                    <a href="/J1P4_PTP/admin/managers" class="small-box-footer">자세히 <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
        </c:if>
    </div>

    <div class="row">
        <div class="col-lg-6 col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">유저별 비율</h3>
                </div>
                <div class="box-body chart-container">
                    <canvas id="userRatioChart"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-6 col-xs-12">
            <div class="box">
                <div class="box-header with-border">
                    <h3 class="box-title">프로젝트 상태별 비율</h3>
                </div>
                <div class="box-body chart-container">
                    <canvas id="projectStatusChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 공지사항 모달 -->
<div class="modal fade" id="announcementModal" tabindex="-1" role="dialog" aria-labelledby="announcementModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="announcementModalTitle"></h4>
            </div>
            <div class="modal-body" id="announcementModalContent"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<%@ include file = "../include/adminFooter.jsp"%>
