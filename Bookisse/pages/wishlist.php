<?php
session_start();

if(!isset($_SESSION['user'])){
header("Location:login.php");
}

require "../config/database.php";

$user=$_SESSION['user'];

$id=$user['id'];

$query=mysqli_query($conn,"
SELECT books.*
FROM wishlist
JOIN books
ON wishlist.book_id=books.id
WHERE wishlist.user_id='$id'
");
?>

<!DOCTYPE html>

<html>

<head>

<title>Wishlist</title>

</head>

<body style="background:#2B1033;color:white;font-family:Arial;">

<h1 align="center">My Wishlist </h1>

<?php

while($book=mysqli_fetch_assoc($query)){

?>

<div style="width:250px;background:#5C2A66;padding:20px;border-radius:15px;margin:20px;display:inline-block;">

<img
src="../assets/images/books/<?= $book['image']; ?>"
width="100%">

<h3><?= $book['title']; ?></h3>

<p><?= $book['author']; ?></p>

<p>€ <?= $book['price']; ?></p>

</div>

<?php } ?>

</body>

</html>