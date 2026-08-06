<?php
session_start();
require 'config/database.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOOKISSE</title>

    <link rel="stylesheet" href="assets/css/style.css?v=<?php echo time(); ?>">

    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <link href="https://fonts.googleapis.com/css2?family=Irish+Grover&display=swap"
        rel="stylesheet">
</head>

<body>

<?php include "includes/navbar.php"; ?>

<section class="hero">

    <div class="container hero-content">

        <div class="hero-text">

            <h1>
                Every Page <br>
                Holds a Story
            </h1>

            <p>
                A place where stories come alive.
                Browse our curated collection and discover your next unforgettable journey.
            </p>

            <div class="hero-btn">
                <button class="btn1">Explore Collection</button>
                <button class="btn2">Shop Now</button>
            </div>

        </div>

        <div class="hero-book">

            <div class="book-card">

                <span class="badge">BEST SELLER</span>

                <img src="assets/images/books/drJekyll.jpeg" alt="">

                <h3>Dr Jekyll & Mr Hyde</h3>

                <p>€11.75</p>

                <button>Add</button>

            </div>

        </div>

    </div>

</section>

<section class="category">

    <div class="container">

        <h2>Popular Category</h2>

        <div class="category-list">

            <div class="category-card">
                <i class="fa-solid fa-book-open"></i>
                <p>Fiction</p>
            </div>

            <div class="category-card">
                <i class="fa-solid fa-lightbulb"></i>
                <p>Self Improvement</p>
            </div>

            <div class="category-card">
                <i class="fa-solid fa-briefcase"></i>
                <p>Business</p>
            </div>

            <div class="category-card">
                <i class="fa-solid fa-dragon"></i>
                <p>Fantasy</p>
            </div>

            <div class="category-card">
                <i class="fa-solid fa-user-secret"></i>
                <p>Mystery</p>
            </div>

            <div class="category-card">
                <i class="fa-solid fa-heart"></i>
                <p>Romance</p>
            </div>

        </div>

    </div>

</section>

<section class="catalogue">

<div class="container">

<h2>Book Catalogue</h2>

<div class="filter">

<button class="active">All</button>
<button>Fiction</button>
<button>Fantasy</button>
<button>Business</button>
<button>Romance</button>
<button>Mystery</button>

</div>

<div class="book-list">

<?php

$query=mysqli_query($conn,"SELECT * FROM books");

while($book=mysqli_fetch_assoc($query)){

?>

<div class="book-item">

<?php if($book['badge']!=""){ ?>

<span class="badge"><?= $book['badge']; ?></span>

<?php } ?>

<img src="assets/images/books/<?= $book['image']; ?>">

<h4><?= $book['title']; ?></h4>

<small><?= $book['author']; ?></small>

<p>€ <?= $book['price']; ?></p>

<a href="process/add_cart.php?id=<?= $book['id']; ?>">
    <i class="fa-solid fa-cart-shopping"></i>
</a>


</div>

<?php } ?>

</div>

</div>

</section>

<section class="offer">

<div class="container">

<h2>Special Offers</h2>

<div class="book-list">

<?php

$offer=mysqli_query($conn,"SELECT * FROM books WHERE is_offer='1'");

while($book=mysqli_fetch_assoc($offer)){

?>

<div class="book-item">

<img src="assets/images/books/<?= $book['image']; ?>">

<h4><?= $book['title']; ?></h4>

<small><?= $book['author']; ?></small>

<p>€ <?= $book['price']; ?></p>

<a href="process/add_cart.php?id=<?= $book['id']; ?>">
    <i class="fa-solid fa-cart-shopping"></i>
</a>


</div>

<?php } ?>

</div>

</div>

</section>

<section class="footer-title">

<h2>
GET MORE TO KNOW
<span>BOOKISSE</span>
</h2>

<h3>
BUY BOOKS MORE EASILY AT BOOKISSE
</h3>

</section>

<footer>

<div class="container footer-content">

<div>

<h4>BOOKISSE</h4>

<p>
A trusted online bookstore with thousands of book collections for every reader.
</p>

</div>

<div>

<h4>Help</h4>

<ul>
<li>Contact Us</li>
<li>Privacy Policy</li>
<li>Terms & Conditions</li>
<li>Returns</li>
</ul>

</div>

<div>

<h4>Information</h4>

<ul>
<li>How to Shop</li>
<li>Shipping</li>
<li>Payment</li>
<li>FAQ</li>
</ul>

</div>

<div>

<h4>Follow Us</h4>

<ul>
<li>Instagram</li>
<li>Tiktok</li>
<li>Threads</li>
<li>X</li>
</ul>

</div>

</div>

</footer>