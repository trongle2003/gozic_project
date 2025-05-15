<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html; charset=UTF-8" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!-- Navbar Start -->
            <div class="container-fluid bg-white sticky-top wow fadeIn" data-wow-delay="0.1s">
                <div class="container">
                    <nav class="navbar navbar-expand-lg bg-white navbar-light p-lg-0">
                        <a href="/" class="navbar-brand d-lg-none">
                            <h1 class="fw-bold m-0">WELDORK</h1>
                        </a>
                        <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse"
                            data-bs-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarCollapse">
                            <div class="navbar-nav">
                                <a href="/">
                                    <img class="nav-item nav-link" src="images/logo.png" alt="Image">
                                </a>
                                <a href="/" class="nav-item nav-link active">Home</a>
                                <a href="/" class="nav-item nav-link">Đồ Nam</a>
                                <a href="/" class="nav-item nav-link">Đồ Nữ</a>
                                <a href="/" class="nav-item nav-link">Đồ Bé Trai</a>
                                <a href="/" class="nav-item nav-link">Đồ Bé Gái</a>
                                <div class="search-container">
                                    <span class="search-icon">🔍</span>
                                    <input type="text" class="search-input" placeholder="Bạn Muốn Tìm...">
                                    <button class="search-button">Tìm Kiếm</button>
                                </div>
                            </div>
                            <a href="/login">
                                <img class="img-fluid" src="images/user.png" alt="Image">
                            </a>
                            <a href="/introduce">
                                <img class="img-fluid" src="images/store.png" alt="Image">
                            </a>
                            <a href="/">
                                <img class="img-fluid" src="images/shopping-bag.png" alt="Image">
                            </a>
                            <a href="/">
                                <img class="img-fluid" src="images/shopping-cart.png" alt="Image">
                            </a>
                        </div>
                    </nav>
                </div>
            </div>
            <!-- Navbar End -->