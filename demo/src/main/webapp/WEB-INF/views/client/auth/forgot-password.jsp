<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page contentType="text/html; charset=UTF-8" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>WELDORK - Quên Mật Khẩu</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <link href="/images/favicon.ico" rel="icon">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Roboto:wght@700;800&display=swap"
                    rel="stylesheet">
                <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                    rel="stylesheet">
                <link rel="stylesheet"
                    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
                <link href="/lib/animate/animate.min.css" rel="stylesheet">
                <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                <link href="/css/bootstrap.min.css" rel="stylesheet">
                <link href="/css/style.css" rel="stylesheet">
            </head>

            <body>
                <div id="spinner"
                    class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                    <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
                </div>
                <jsp:include page="../layout/header.jsp" />
                <div class="container mt-5 pt-5">
                    <div class="row justify-content-center">
                        <div class="col-md-6 col-lg-4">
                            <div class="card p-4 shadow">
                                <h3 class="text-center mb-4"><strong>Lấy Lại Mật Khẩu</strong></h3>
                                <c:if test="${not empty error}">
                                    <div class="alert alert-danger">${error}</div>
                                </c:if>
                                <c:if test="${not empty message}">
                                    <div class="alert alert-success">${message}</div>
                                </c:if>
                                <form action="/forgot" method="post">
                                    <c:if test="${not empty token}">
                                        <input type="hidden" name="token" value="${token}" />
                                    </c:if>
                                    <div class="mb-3">
                                        <c:choose>
                                            <c:when test="${empty token}">
                                                <!-- Bước 1: Chỉ hiển thị trường email -->
                                                <label for="email" class="form-label">Email hoặc Số Điện Thoại</label>
                                                <input type="email" class="form-control" id="email" name="email"
                                                    placeholder="Nhập email hoặc số điện thoại" required>
                                            </c:when>
                                            <c:otherwise>
                                                <!-- Bước 2: Hiển thị tất cả các trường -->
                                                <div class="mb-3">
                                                    <label for="username" class="form-label">Tên Truy Cập</label>
                                                    <input type="text" class="form-control" id="username"
                                                        name="username" placeholder="Tên Truy Cập" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="email" class="form-label">Email hoặc Số Điện
                                                        Thoại</label>
                                                    <input type="email" class="form-control" id="email" name="email"
                                                        value="${email}" readonly>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="newPassword" class="form-label">Mật Khẩu Mới</label>
                                                    <input type="password" class="form-control" id="newPassword"
                                                        name="newPassword" placeholder="Nhập Mật Khẩu Mới" required>
                                                </div>
                                                <div class="mb-3">
                                                    <label for="confirmPassword" class="form-label">Nhập Lại Mật
                                                        Khẩu</label>
                                                    <input type="password" class="form-control" id="confirmPassword"
                                                        name="confirmPassword" placeholder="Nhập Lại Mật Khẩu" required>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div>
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    </div>
                                    <div class="d-grid">
                                        <button type="submit" class="btn btn-danger">
                                            <c:choose>
                                                <c:when test="${empty token}">Gửi Liên Kết Đặt Lại</c:when>
                                                <c:otherwise>Hoàn Thành</c:otherwise>
                                            </c:choose>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <br><br><br>
                <jsp:include page="../layout/footer.jsp" />
                <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/lib/wow/wow.min.js"></script>
                <script src="/lib/easing/easing.min.js"></script>
                <script src="/lib/waypoints/waypoints.min.js"></script>
                <script src="/lib/counterup/counterup.min.js"></script>
                <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
                <script src="/js/main.js"></script>
            </body>

            </html>