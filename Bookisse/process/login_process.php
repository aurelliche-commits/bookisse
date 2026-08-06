<?php
session_start();
require "../config/database.php";

$email = mysqli_real_escape_string($conn,$_POST['email']);
$password = $_POST['password'];

$query = mysqli_query($conn,"SELECT * FROM users WHERE email='$email'");

if(mysqli_num_rows($query)==1){

    $user = mysqli_fetch_assoc($query);

    if(password_verify($password,$user['password'])){

        $_SESSION['user']=$user;

        if($user['role']=="admin"){

            header("Location: ../admin/dashboard.php");

        }else{

            header("Location: ../pages/profile.php");

        }

        exit;

    }

}

echo "<script>
alert('Email atau Password salah!');
window.location='../pages/login.php';
</script>";
?>