<div class="container mt-5">
    <div class="row">
        <div class="col-12 col-sm-6" style="border-right: solid black 1px">
            <form action="./index.php?content=login_script" method="post">
                <div class="form-group">
                    <label for="inputEmail">E-mail</label>
                    <input name="email" type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" autofocus>
                </div>
                <div class="form-group">
                    <label for="inputPassword">Wachtwoord</label>
                    <input name="password" type="password" class="form-control" id="inputPassword" aria-describedby="passwordHelp">
                </div>
                <button type="submit" class="btn btn-secondary btn-lg btn-block mt-4">Log in</button>
            </form>
        </div>

        <div class="col-12 col-sm-6">
            <form action="./index.php?content=register_script" method="post">
                <div class="form-group">
                    <label for="inputEmail">Nieuw bij george marina?</label>
                    <input name="email" type="email" class="form-control" id="inputEmail" aria-describedby="emailHelp" autofocus>
                    <small id="emailHelp" class="form-text text-muted">Vul hier uw E-mail in</small>
                </div>

                <button type="submit" class="btn btn-secondary btn-lg btn-block">Registreer</button>
            </form>
        </div>
    </div>
</div>