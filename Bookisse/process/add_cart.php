<?php
session_start();

require "../config/database.php";

$user=$_SESSION['user']['id'];

$book=$_GET['id'];

$cek=mysqli_query($conn,"
SELECT * FROM cart
WHERE user_id='$user'
AND book_id='$book'
");

if(mysqli_num_rows($cek)>0){

mysqli_query($conn,"
UPDATE cart
SET qty=qty+1
WHERE user_id='$user'
AND book_id='$book'
");

}else{

mysqli_query($conn,"
INSERT INTO cart(user_id,book_id)
VALUES('$user','$book')
");

}

header("Location: ../pages/cart.php");