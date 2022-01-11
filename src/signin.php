<?php
require("../app.php");

// start session
session_start();
if (isset($_SESSION["signin"])) {
    // jika session nya tidak ada
    header("Location: index.php");
    // echo "SESSION NYA TIDAK ADA!";
}

if (isset($_POST["signin"])) {
    // logic login disini
    $username = $_POST["username"];
    $password = $_POST["password"];

    $result = mysqli_query($dbconnect, "SELECT * FROM users WHERE username = '$username'");

    if (mysqli_num_rows($result) === 1) {
        $row = mysqli_fetch_assoc($result);
        if (password_verify($password, $row["password"])) {
            // cek role masing masing user
            if ($row["level"] === "penjual") {
                $_SESSION["username"] = $username;
                $_SESSION["no_telp"] = $row["no_telp"];
                $_SESSION["level"] = "penjual";
                $_SESSION["id_pembeli"] = $row["id"];
                $_SESSION["signin"] = true;
                header("Location: ./admin/index.php");
            } else if ($row["level"] === "pembeli") {
                $_SESSION["username"] = $username;
                $_SESSION["no_telp"] = $row["no_telp"];
                $_SESSION["id_pembeli"] = $row["id"];
                $_SESSION["level"] = "pembeli";
                $_SESSION["signin"] = true;
                header("Location: index.php");
            }
        }
    }

    $error = true;
}


?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="./assets/css/style_auth.css">


    <title>Login</title>
</head>

<body>

    <div class="container">
        <div class="card">
            <h2 style="text-align: center;">Login Dulu</h2>
            <?php if (isset($error)) : ?>
                <?php echo "<script>alert('Gagal Login!');</script>"; ?>
            <?php endif; ?>
            <form method="POST">
                <div class="parent">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" class="input-control" placeholder="user/admin">
                </div>
                <div class="parent">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" class="input-control" placeholder="*********">
                </div>

                <div class="parent-btn">
                    <button type="submit" name="signin" class="btn-signup">Login</button>
                    <p style="margin-top: 13px; margin-left: 20px;">Belum punya akun? <a href="signup.php" style="text-decoration: none; color: blue;">Daftar disini</a></p>
                </div>
            </form>

        </div>
    </div>

</body>

</html>