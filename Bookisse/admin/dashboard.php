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

<title>BOOKISSE ADMIN</title>

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
<?php
include "../config/database.php";

$totalBooks = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM books"));
$totalUsers = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM users WHERE role='user'"));
$totalOrders = mysqli_num_rows(mysqli_query($conn, "SELECT * FROM orders"));

$revenue = mysqli_query($conn, "SELECT SUM(total) AS totalRevenue FROM orders WHERE status='Paid'");
$totalRevenue = mysqli_fetch_assoc($revenue);
?>

<div class="cards">

    <div class="card">
        <i class="fa-solid fa-book"></i>
        <h3><?= $totalBooks ?></h3>
        <p>Total Books</p>
    </div>

    <div class="card">
        <i class="fa-solid fa-users"></i>
        <h3><?= $totalUsers ?></h3>
        <p>Users</p>
    </div>

    <div class="card">
        <i class="fa-solid fa-cart-shopping"></i>
        <h3><?= $totalOrders ?></h3>
        <p>Orders</p>
    </div>

    <div class="card">
        <i class="fa-solid fa-wallet"></i>
        <h3>
            Rp <?= number_format($totalRevenue['totalRevenue'] ?? 0,0,",","."); ?>
        </h3>
        <p>Revenue</p>
    </div>

</div>

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

</body>

</html>
<?php

session_start();

if(!isset($_SESSION['user'])){

    header("Location: ../pages/login.php");

}

if($_SESSION['user']['role']!="admin"){

    header("Location: ../index.php");

}

?>

<!DOCTYPE html>

<html>

<head>

<link rel="stylesheet" href="css/admin.css">

</head>

<body>

<?php include "includes/sidebar.php"; ?>

<div class="main">

<?php include "includes/header.php"; ?>

<h1>Welcome Admin</h1>

</div>

</body>

</html>