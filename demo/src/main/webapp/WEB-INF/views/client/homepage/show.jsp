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
                    <link href="images/favicon.ico" rel="icon">
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
                    <link href="lib/animate/animate.min.css" rel="stylesheet">
                    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="css/style.css" rel="stylesheet">
                </head>

                <body>
                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
                    </div>
                    <!-- Spinner End -->

                    <jsp:include page="../layout/header.jsp" />

                    <!-- Carousel Start -->
                    <div class="container-fluid p-0 mb-6 wow fadeIn" data-wow-delay="0.1s">
                        <a href="index.html">
                            <img src="images/banner.png" alt="Image">
                        </a>
                    </div>
                    <!-- Carousel End -->

                    <!-- Service Start -->
                    <div class="container-fluid service pt-6 pb-6">
                        <div class="container">
                            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s"
                                style="max-width: 600px;">
                                <h1 class="display-6 text-uppercase mb-5">Danh mục sản phẩm</h1>
                            </div>
                        </div>
                    </div>
                    <!-- Service End -->

                    <!-- Products Section Start -->
                    <div class="products-section">
                        <div class="container">
                            <div class="row">
                                <c:choose>
                                    <c:when test="${empty products}">
                                        <div class="col-12 text-center">
                                            <p class="text-muted">Không có sản phẩm nào để hiển thị.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="product" items="${products}">
                                            <div class="col-md-6 col-lg-4 col-xl-3 mb-4">
                                                <div class="product-card">
                                                    <img src="/images/${product.image}" class="product-img"
                                                        alt="${product.name}">
                                                    <div class="product-body">
                                                        <h5 class="product-title">
                                                            <a href="/product/${product.id}">${product.name}</a>
                                                        </h5>
                                                        <p class="product-price">
                                                            <fmt:formatNumber type="number" value="${product.price}" />
                                                            VND
                                                        </p>
                                                        <a href="/cart/add/${product.id}" class="product-btn">Thêm vào
                                                            giỏ hàng</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                    <!-- Products Section End -->

                    <jsp:include page="../layout/footer.jsp" />

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
                            class="bi bi-arrow-up"></i></a>

                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="lib/wow/wow.min.js"></script>
                    <script src="lib/easing/easing.min.js"></script>
                    <script src="lib/waypoints/waypoints.min.js"></script>
                    <script src="lib/counterup/counterup.min.js"></script>
                    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="js/main.js"></script>
                </body>

                </html>