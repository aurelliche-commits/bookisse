<?php
session_start();

if(!isset($_SESSION['user'])){
    header("Location: login.php");
    exit;
}

require "../config/database.php";

$user = $_SESSION['user'];

$id = $user['id'];

$wishlist = mysqli_num_rows(mysqli_query($conn,"SELECT * FROM wishlist WHERE user_id='$id'"));

$cart = mysqli_num_rows(mysqli_query($conn,"SELECT * FROM cart WHERE user_id='$id'"));
?>

<!DOCTYPE html>
<html>

<head>

<title>My Profile</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

body{
margin:0;
background:#2B1033;
font-family:Arial;
color:white;
}

.container{
width:90%;
margin:auto;
padding:40px;
}

.card{

background:#4B2154;

padding:35px;

border-radius:20px;

margin-top:40px;

}

h1{

color:#F4B43A;

}

.info{

margin:18px 0;

font-size:18px;

}

.menu{

display:grid;

grid-template-columns:repeat(3,1fr);

gap:25px;

margin-top:40px;

}

.box{

background:#5C2A66;

padding:30px;

border-radius:20px;

text-align:center;

}

.box i{

font-size:40px;

color:#F4B43A;

margin-bottom:20px;

}

.box h2{

font-size:35px;

margin:10px 0;

}

.box a{

display:inline-block;

margin-top:20px;

background:#F4B43A;

padding:10px 25px;

color:black;

text-decoration:none;

border-radius:10px;

}

.logout{

margin-top:50px;

}

.logout a{

background:red;

padding:15px 30px;

color:white;

text-decoration:none;

border-radius:10px;

}

</style>

</head>

<body>

<div class="container">

<h1>Welcome, <?= $user['fullname']; ?></h1>

<div class="card">

<div class="info">

<b>Full Name :</b>

<?= $user['fullname']; ?>

</div>

<div class="info">

<b>Email :</b>

<?= $user['email']; ?>

</div>

<div class="info">

<b>Role :</b>

<?= ucfirst($user['role']); ?>

</div>

</div>

<div class="menu">

<div class="box">

<i class="fa-solid fa-heart"></i>

<h2><?= $wishlist ?></h2>

<p>Wishlist</p>

<a href="wishlist.php">

Open

</a>

</div>

<div class="box">

<i class="fa-solid fa-cart-shopping"></i>

<h2><?= $cart ?></h2>

<p>Cart</p>

<a href="cart.php">

Open

</a>

</div>

<div class="box">

<i class="fa-solid fa-book"></i>

<h2>Shop</h2>

<p>Back To Store</p>

<a href="../index.php">

Home

</a>

</div>

</div>

<div class="logout">

<a href="logout.php">

Logout

</a>

</div>

</div>

</body>

</html>