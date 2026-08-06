<?php
session_start();

require "../config/database.php";

$user=$_SESSION['user']['id'];

$book=$_GET['id'];

mysqli_query($conn,"
INSERT INTO wishlist(user_id,book_id)
VALUES('$user','$book')
");

header("Location: ../pages/wishlist.php");