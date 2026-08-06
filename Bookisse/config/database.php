<?php

$host = "localhost";
$user = "root";
$password = "";
$database = "bookisse_db";

$conn = mysqli_connect($host, $user, $password, $database);

if (!$conn) {
    die("kalo koneksi database gagal: " . mysqli_connect_error());
}