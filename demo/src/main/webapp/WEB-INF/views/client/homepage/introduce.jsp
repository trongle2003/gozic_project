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

                    <div class="container-fluid p-0 mb-6 wow fadeIn" data-wow-delay="0.1s">
                        <a href="index.html">
                            <img src="images/banner2.jpg" alt="Image">
                        </a>
                    </div>

                    <!-- About Section Start -->
                    <section class="about-section wow fadeInUp" data-wow-delay="0.2s">
                        <div class="container">
                            <!-- Dòng đầu: logo + đoạn văn bản bên phải -->
                            <div class="row align-items-start">
                                <!-- Logo -->
                                <div class="col-md-3 text-md-start text-center">
                                    <img src="images/logo1.png" alt="Logo" class="about-logo">
                                </div>
                                <!-- Đoạn văn bản bên phải logo -->
                                <div class="col-md-9">
                                    <p class="about-text">
                                        <strong>VPS-Fashion</strong> 2 năm – Khoác lên niềm vui gia đình Việt. Năm 2021,
                                        Công ty Cổ phần Thương mại và Dịch vụ Hoàng Dương được thành lập với mục đích
                                        chính ban đầu là hoạt động trong lĩnh vực sản xuất hàng thời trang xuất khẩu với
                                        các sản phẩm chủ yếu dành cho trẻ em và người lớn. Năm 2022 thương hiệu thời
                                        trang <strong>VPS-Fashion</strong> ra đời, tự hào trở thành một cột mốc đáng nhớ
                                        của doanh nghiệp Việt trong ngành thời trang.
                                    </p>
                                </div>
                            </div>

                            <div class="row my-4 justify-content-end">
                                <div class="col-md-6 text-md-end text-center">
                                    <img src="images/banner3.png" alt="Gia đình" class="about-image">
                                </div>
                            </div>

                            <!-- Đoạn văn bản cuối nằm bên dưới trái của banner3 -->
                            <div class="row">
                                <p class="about-text">
                                    <strong>VPS-Fashion</strong> hướng đến mục tiêu mang lại niềm vui mặc mới mỗi
                                    ngày cho hàng triệu người tiêu dùng Việt. Chúng tôi tin rằng người dân Việt Nam
                                    cũng đang hướng đến một cuộc sống năng động, tích cực hơn.
                                </p>
                                <div class="btn-wrapper">
                                    <a href="#" class="about-btn">XEM THÊM</a>
                                </div>

                            </div>
                        </div>
                    </section>

                    <!-- About Section End -->

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