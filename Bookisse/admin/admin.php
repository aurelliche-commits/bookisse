<?php

session_start();

if(!isset($_SESSION['role'])){

    header("Location: ../pages/login.php");
    exit;

}

if($_SESSION['role']!="admin"){

    header("Location: ../index.php");
    exit;

}

?>
<?php
session_start();

if(!isset($_SESSION['role'])){
    header("Location: ../pages/login.php");
    exit;
}

if($_SESSION['role']!="admin"){
    header("Location: ../index.php");
    exit;
}
?>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<link rel="stylesheet" href="css/admin.css">

<link
rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<link
href="https://fonts.googleapis.com/css2?family=Irish+Grover&display=swap"
rel="stylesheet">

</head>

<body>

<?php include "includes/sidebar.php"; ?>

<div class="main">

<?php include "includes/header.php"; ?>

<div class="content">

<h2>Orders</h2>

<div class="table-box">

<table>

<tr>

<th>ID</th>

<th>Name</th>

<th>Payment</th>

<th>Type</th>

<th>Total</th>
</tr>
<tr>
<td colspan="5">

No Orders

</td>
</tr>
</table>
</div>
</div>
</div>
<div class="sidebar">

<h1>

BOOKISSE

</h1>

<ul>

<li class="active">

<a href="dashboard.php">

<i class="fa-solid fa-box"></i>

Stock

</a>

</li>

<li>

<a href="orders.php">

<i class="fa-solid fa-cart-shopping"></i>

Orders

</a>

</li>

<li>

<a href="books.php">

<i class="fa-solid fa-book"></i>

Product

</a>

</li>

<li>

<a href="categories.php">

<i class="fa-solid fa-layer-group"></i>

Categories

</a>

</li>

<li>

<a href="messages.php">

<i class="fa-solid fa-envelope"></i>

Message

</a>

</li>

<li>

<a href="settings.php">

<i class="fa-solid fa-gear"></i>

Settings

</a>

</li>

<li>

<a href="../process/logout.php">

<i class="fa-solid fa-right-from-bracket"></i>

Logout

</a>

</li>

</ul>

</div>
<div class="header">

<h2>

HELLO BOOKISSE

</h2>

<div class="header-right">

<input
type="text"
placeholder="Search...">

<i class="fa-regular fa-bell"></i>

<i class="fa-solid fa-user"></i>

<span>

<?= $_SESSION['name']; ?>

</span>

</div>

</div>
</body>
</html>