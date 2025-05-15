<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="utf-8">
            <title>WELDORK - Đăng Nhập</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="" name="keywords">
            <meta content="" name="description">
            <link href="/images/favicon.ico" rel="icon">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link
                href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Roboto:wght@700;800&display=swap"
                rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
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
                            <h3 class="text-center mb-4"><strong>Đăng Nhập</strong></h3>
                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger">Email hoặc mật khẩu không đúng</div>
                            </c:if>
                            <c:if test="${param.expired != null}">
                                <div class="alert alert-warning">Phiên đăng nhập đã hết hạn</div>
                            </c:if>
                            <form action="/login" method="post" class="mt-5">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Tên đăng nhập: </label>
                                    <input type="email" class="form-control" id="username" name="username"
                                        placeholder="Nhập email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="password" class="form-label">Mật Khẩu</label>
                                    <input type="password" class="form-control" id="password" name="password"
                                        placeholder="Nhập mật khẩu" required>
                                </div>
                                <div>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                </div>
                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-danger">Đăng Nhập Ngay</button>
                                </div>
                                <div class="text-center">
                                    <a href="/forgot" class="mb-2 d-block">Quên Mật Khẩu?</a>
                                    <a href="/register">Tạo Tài Khoản Ngay</a>
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