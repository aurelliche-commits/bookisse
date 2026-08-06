<?php
session_start();
?>

<!DOCTYPE html>
<html>
<head>

<title>Login</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

body{
background:#2B1033;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
font-family:Arial;
}

.box{
width:400px;
background:white;
padding:40px;
border-radius:20px;
}

h2{
text-align:center;
margin-bottom:30px;
color:#2B1033;
}

input{
width:100%;
padding:14px;
margin:10px 0;
border-radius:10px;
border:1px solid #ccc;
}

button{
width:100%;
padding:14px;
background:#F4B43A;
border:none;
border-radius:10px;
font-size:16px;
cursor:pointer;
margin-top:15px;
}

a{
display:block;
text-align:center;
margin-top:20px;
color:#2B1033;
text-decoration:none;
}

</style>

</head>

<body>

<div class="box">

<h2>Login</h2>

<form action="../process/login_process.php" method="POST">

<input
type="email"
name="email"
placeholder="Email"
required>

<input
type="password"
name="password"
placeholder="Password"
required>

<button>

Login

</button>

</form>

<a href="register.php">

Create Account

</a>

</div>

</body>
</html>