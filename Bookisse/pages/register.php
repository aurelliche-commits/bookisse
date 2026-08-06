<?php
session_start();
?>

<!DOCTYPE html>
<html>

<head>

<title>Register</title>

<link rel="stylesheet" href="../assets/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

<style>

body{
background:#2b1033;
display:flex;
justify-content:center;
align-items:center;
height:100vh;
font-family:Arial;
}

.box{

width:430px;

background:white;

padding:40px;

border-radius:20px;

}

h2{

text-align:center;

margin-bottom:30px;

color:#2b1033;

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

font-size:17px;

cursor:pointer;

margin-top:20px;

}

a{

display:block;

text-align:center;

margin-top:20px;

color:#2b1033;

}

</style>

</head>

<body>

<div class="box">

<h2>Create Account</h2>

<form action="../process/register_process.php" method="POST">

<input type="text"
name="fullname"
placeholder="Full Name"
required>

<input type="email"
name="email"
placeholder="Email"
required>

<input type="password"
name="password"
placeholder="Password"
required>

<input type="password"
name="confirm"
placeholder="Confirm Password"
required>

<button>

Register

</button>

</form>

<a href="login.php">

Already have an account?

</a>

</div>

</body>

</html>