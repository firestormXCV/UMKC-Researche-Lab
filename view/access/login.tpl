<div class="mt-5 mx-auto px-5 pt-5 rounded-8 border-3 border border-primary" style="width: 50%; border-radius:30px">

    <form action="index.php?controle=access&action=login" method="post">
    <!-- Email input -->
    <div class="form-outline mb-4">
        <input class="form-control" type="email" placeholder="Email Address" name="email" value="<?php if(isset($_COOKIE["member_login"])) { echo $_COOKIE["member_login"]; } ?>" <!--name pour le php, recup avec $_post-->
        <label class="form-label" for="form2Example1" name="email">Email address</label>
    </div>

    <!-- Password input -->
    <div class="form-outline mb-4">
        <input class="form-control" type="password" placeholder="Mot de passe" name="mdp"/>
        <label class="form-label" for="form2Example2" name="mdp">Password</label>
    </div>

    <!-- 2 column grid layout for inline styling -->
    <div class="row mb-4">
        <div class="col d-flex justify-content-center">
        <!-- Checkbox -->
        <span>
            <input type="checkbox" name="remember" id="remember" <?php if(isset($_COOKIE["member_login"])) { ?> checked <?php } ?> class="checkbox"> 
            Se souvenir de moi
        </span>
        </div>

        <div class="col">
        <!-- Simple link -->
        <a href="#!">Forgot password?</a>
        </div>
    </div>

    <!-- Submit button -->
    <div class="row d-flex text-center" style="width: 100%;">
        <button type="submit" class="btn btn-primary btn-block mb-4 ">Sign in</button>
    </div>
    <!-- Register buttons -->
    <div class="text-center">
        <p>Not a member? <a href="#!">Register</a></p>
    </div>
    </form>
    <div id ="msgLog"> <?php $msg=isset($msgLog)?trim($msgLog):''; echo $msg; ?> </div>
</div>