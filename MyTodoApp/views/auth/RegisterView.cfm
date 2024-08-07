<cfinclude template="../layout/Header.cfm">

<section class="vh-100 bg-primary-on-container">
  <div class="container h-100">
    <div class="d-flex justify-content-center align-items-center h-100">
      <div class="card" style="border-radius: 0.5rem;">
        <div class="col-12 d-flex align-items-center">
            <div class="card-body p-4 p-lg-5 text-black">

              <form method="POST" action="../../controllers/auth/AuthController.cfc?method=register">

                <div class="d-flex align-items-center mb-3 pb-1">
                  <i class="fas fa-check-circle fa-2x me-3"></i>
                  <span class="h3 fw-bold mb-0">Tick Tick</span>
                </div>

                <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Register a new account</h5>

                <div class="row my-2">
                  <div class="col-md-6">
                    <input name="firstName" type="text" value="" id="form3Example1" class="form-control form-control-lg" placeholder="First name" />
                  </div>
                  <div class="col-md-6">
                    <input name="lastName" type="text" value="" id="form3Example2" class="form-control form-control-lg" placeholder="Last name" />
                  </div>
                </div>

                <div class="form-outline my-2">
                  <input name="email" type="email" value="" id="form2Example17" class="form-control form-control-lg" placeholder="Email" />
                </div>

                <div class="form-outline my-2">
                  <input name="password" type="password" value="" id="form2Example27" class="form-control form-control-lg" placeholder="Password"/>
                </div>

                <div class="d-flex justify-content-end">
                  <button name="register" class="btn btn-primary btn-lg btn-block" type="submit">Register</button>
                </div>

                <p class="pb-lg-2 mt-2" style="color: #393f81;">Already have an account? 
                  <a href="LoginView.cfm" class="text-decoration-none" style="color: #393f81;">Login here</a>
                </p>
                <a href="#!" class="small text-muted">Terms of use.</a>
                <a href="#!" class="small text-muted">Privacy policy</a>
              </form>

            </div>
        </div>
      </div>
    </div>
  </div>
</section>

<cfinclude template="../layout/Footer.cfm">