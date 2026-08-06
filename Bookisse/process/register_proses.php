<?php
require "../config/database.php";

$fullname = mysqli_real_escape_string($conn, $_POST['fullname']);
$email = mysqli_real_escape_string($conn, $_POST['email']);
$password = $_POST['password'];
$confirm = $_POST['confirm'];

if($password != $confirm){
    echo "<script>
    alert('Password tidak sama!');
    window.location='../pages/register.php';
    </script>";
    exit;
}

$cek = mysqli_query($conn,"SELECT * FROM users WHERE email='$email'");

if(mysqli_num_rows($cek)>0){
    echo "<script>
    alert('Email sudah digunakan!');
    window.location='../pages/register.php';
    </script>";
    exit;
}

$password = password_hash($password,PASSWORD_DEFAULT);

mysqli_query($conn,"
INSERT INTO users(fullname,email,password)
VALUES('$fullname','$email','$password')
");

echo "<script>
alert('Register Berhasil!');
window.location='../pages/login.php';
</script>";
?>