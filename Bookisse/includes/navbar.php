<div class="promo-bar">
    Read Book, and get
    <span>10% OFF</span>
    for all books
</div>

<nav>

    <div class="container navbar">

        <h2 class="logo">
            BOOKISSE
        </h2>

        <div class="search">
            <input
                type="text"
                placeholder="Search Book...">
        </div>

        <div class="menu">

            <a href="pages/wishlist.php">
                <i class="fa-solid fa-heart"></i>
            </a>

            <a href="pages/cart.php">
                <i class="fa-solid fa-cart-shopping"></i>
            </a>

            <?php
            if(isset($_SESSION['user'])){
            ?>

                <a href="pages/profile.php">
                    <i class="fa-solid fa-user"></i>
                </a>

            <?php
            }else{
            ?>

                <a href="pages/login.php">
                    <i class="fa-solid fa-user"></i>
                </a>

            <?php } ?>

        </div>

    </div>

</nav>