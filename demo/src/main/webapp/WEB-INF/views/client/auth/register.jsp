<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ page contentType="text/html; charset=UTF-8" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>WELDORK - Welding Website Template</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">
                    <!-- Favicon -->
                    <link href="/images/favicon.ico" rel="icon">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&family=Roboto:wght@700;800&display=swap"
                        rel="stylesheet">
                    <!-- Icon Font Stylesheet -->
                    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">
                    <!-- Libraries Stylesheet -->
                    <link href="/lib/animate/animate.min.css" rel="stylesheet">
                    <link href="/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/css/bootstrap.min.css" rel="stylesheet">
                    <!-- Template Stylesheet -->
                    <link href="/css/style.css" rel="stylesheet">
                </head>

                <body>
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
                    </div>
                    <!-- Spinner End -->
                    <jsp:include page="../layout/header.jsp" />
                    <div class="container mt-5 pt-5">
                        <div class="row justify-content-center">
                            <div class="col-md-6 col-lg-4">
                                <div class="card p-4 shadow">
                                    <h3 class="text-center mb-4"><strong>Đăng Ký</strong></h3>
                                    <form:form action="/register" method="post" class="mt-5" modelAttribute="newUser"
                                        enctype="multipart/form-data">
                                        <c:set var="errorFullName">
                                            <form:errors path="fullName" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorEmail">
                                            <form:errors path="email" cssClass="invalid-feedback" />
                                        </c:set>
                                        <c:set var="errorPassword">
                                            <form:errors path="password" cssClass="invalid-feedback" />
                                        </c:set>
                                        <div class="mb-3" style="display: none;">
                                            <label class="form-label">Id: </label>
                                            <form:input type="text" class="form-control" path="id" disabled="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="inputFullName" class="form-label">Tên tài khoản: </label>
                                            <form:input
                                                class="form-control ${not empty errorFullName ? 'is-invalid':''}"
                                                id="inputFullName" type="text" placeholder="Nhập tên tài khoản"
                                                path="fullName" />
                                            ${errorFullName}
                                        </div>
                                        <div class="mb-3">
                                            <label for="inputEmail" class="form-label">Email: </label>
                                            <form:input class="form-control ${not empty errorEmail ? 'is-invalid':''}"
                                                type="email" placeholder="name@example.com" path="email"
                                                id="inputEmail" />
                                            ${errorEmail}
                                        </div>
                                        <div class="mb-3">
                                            <label for="inputPassword" class="form-label">Mật khẩu: </label>
                                            <form:input
                                                class="form-control ${not empty errorPassword ? 'is-invalid':''}"
                                                id="inputPassword" type="password" placeholder="Nhập mật khẩu"
                                                path="password" />
                                            ${errorPassword}
                                        </div>
                                        <div class="mb-3">
                                            <label for="inputPasswordConfirm" class="form-label">Nhập lại mật khẩu:
                                            </label>
                                            <input class="form-control" id="inputPasswordConfirm" type="password"
                                                name="confirmPassword" placeholder="Nhập lại mật khẩu" required />
                                            <c:if test="${not empty passwordMismatch}">
                                                <div class="invalid-feedback d-block">${passwordMismatch}</div>
                                            </c:if>
                                        </div>
                                        <div class="d-grid">
                                            <button type="submit" class="btn btn-danger">Đăng Ký Ngay</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br><br><br>
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Back to Top -->
                    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                            class="bi bi-arrow-up"></i></a>
                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/lib/wow/wow.min.js"></script>
                    <script src="/lib/easing/easing.min.js"></script>
                    <script src="/lib/waypoints/waypoints.min.js"></script>
                    <script src="/lib/counterup/counterup.min.js"></script>
                    <script src="/lib/owlcarousel/owl.carousel.min.js"></script>
                    <!-- Template Javascript -->
                    <script src="/js/main.js"></script>
                </body>

                </html>