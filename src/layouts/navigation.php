<nav class="navbar navbar-expand-lg navbar-light bg-light">
<div class="container-fluid">
    <a class="navbar-brand" href="index.php">Garage</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="about.php">About</a>
        <a class="nav-link" href="cart.php">Cart</a>
        <a class="nav-link" href="history-order.php">Your Order</a>
      </div>
    </div>
    <div class="child-nav">
        <?php if (isset($_SESSION["signin"])) : ?>
            <ul class="list-nav">
                <li class="item-nav">
                    <a href="logout.php" class="nav-brand-auth-masuk">Logout</a>
                </li>
                <li class="item-nav">
                    <h3><?= $_SESSION["username"]; ?> <small>(<?= $_SESSION["level"]; ?>)</small></h3>
                </li>
            </ul>
        <?php endif; ?>
        <?php if (!isset($_SESSION["signin"])) : ?>
            <ul class="list-nav">
                <li class="item-nav">
                    Keranjang: <span id="count-cart"></span>
                </li>
                <li class="item-nav">
                    <a href="signin.php" class="nav-brand-auth-masuk">Masuk</a>
                </li>
                <li class="item-nav">
                    <a href="signup.php" class="nav-brand-auth-masuk">Daftar</a>
                </li>
            </ul>
        <?php endif; ?>
    </div>
</nav>