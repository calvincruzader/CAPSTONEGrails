<html lang="en" class="no-js">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>
    Login
  </title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="/assets/bootstrap.css?compile=false">
  <link rel="stylesheet" href="/assets/grails.css?compile=false">
  <link rel="stylesheet" href="/assets/main.css?compile=false">
  <link rel="stylesheet" href="/assets/mobile.css?compile=false">
  <link rel="stylesheet" href="/assets/application.css?compile=false">


  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.1.1.min.js"></script>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.1.1.min.js" integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8=" crossorigin="anonymous"></script> -->

  <meta name="layout" content="main">

  <style type="text/css" media="screen">

  </style>

</head>
<body>
  <div id="login">
    <div class="inner">
      <div class="fheader">Please Login</div>

      <form action="/login/authenticate" method="POST" id="loginForm" class="cssform" autocomplete="off">
        <p>
          <label for="username">Username:</label>
          <input type="text" class="text_" name="username" id="username">
        </p>

        <p>
          <label for="password">Password:</label>
          <input type="password" class="text_" name="password" id="password">
        </p>

        <p id="remember_me_holder">
          <input type="checkbox" class="chk" name="remember-me" id="remember_me">
          <label for="remember_me">Remember me</label>
        </p>

        <p>
          <input class="btn btn-primary" type="submit" id="submit" value="Login">
        </p>
      </form>
    </div>
  </div>
  <script>
  (function() {
    document.forms['loginForm'].elements['username'].focus();
  })();
  </script>

  <div id="spinner" class="spinner" style="display:none;">
    Loading…
  </div>

  <script type="text/javascript" src="/assets/jquery-2.2.0.min.js?compile=false"></script>
  <script type="text/javascript" src="/assets/bootstrap.js?compile=false"></script>
  <script type="text/javascript" src="/assets/application.js?compile=false"></script>




</body>
</html>
