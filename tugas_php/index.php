<?php
session_start();

// Data login
$user = "yosep";
$pass = "yosep123";

// Proses login
if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username == $user && $password == $pass) {
        $_SESSION['username'] = $username;
    } else {
        $error = "Login Gagal! Username atau Password salah.";
    }
}

// Proses logout
if (isset($_GET['logout'])) {
    session_unset();
    session_destroy();
    header("Location: index.php");
    exit();
}

// Proses submit nama & umur
if (isset($_POST['submit_data'])) {
    $nama = $_POST['nama'];
    $umur = $_POST['umur'];
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Project PHP - Login dan Form</title>
</head>
<body>

<?php if (!isset($_SESSION['username'])): ?>
    <!-- Form Login -->
    <h2>Login</h2>
    <?php if (isset($error)) echo "<p style='color:red;'>$error</p>"; ?>
    <form method="POST" action="">
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" required><br>
        <input type="submit" name="login" value="Login">
    </form>

<?php else: ?>
    <!-- Dashboard setelah login -->
    <h2>Selamat datang, <?php echo $_SESSION['username']; ?>!</h2>
    <a href="?logout=true">Logout</a>

    <hr>

    <!-- Form Nama & Umur -->
    <h3>Form Input Nama dan Umur</h3>
    <form method="POST" action="">
        Nama: <input type="text" name="nama" required><br>
        Umur: <input type="number" name="umur" required><br>
        <input type="submit" name="submit_data" value="Kirim">
    </form>

    <?php if (isset($nama) && isset($umur)): ?>
        <h4>Hasil:</h4>
        <p>Halo, <?php echo htmlspecialchars($nama); ?>!</p>
        <p>Status: <?php echo ($umur >= 18) ? "Dewasa" : "Belum Dewasa"; ?></p>
    <?php endif; ?>

<?php endif; ?>

</body>
</html>