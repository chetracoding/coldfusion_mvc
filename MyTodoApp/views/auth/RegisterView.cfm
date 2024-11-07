<cfimport prefix="ct" taglib="/views/customTags">

<ct:PageLayout title="Register an account" isDisplayHeader="false">
<section class="vh-100 bg-primary-on-container">
  <div class="container h-100">
    <div class="d-flex justify-content-center align-items-center h-100">
      <div class="card" style="border-radius: 0.5rem;">
        <div class="col-12 d-flex align-items-center">
            <div class="card-body p-4 p-lg-5 text-black">

              <cfform name="registerForm" method="POST" action="../../controllers/auth/AuthController.cfc?method=register">

                <div class="d-flex align-items-center mb-3 pb-1">
                  <i class="fas fa-check-circle fa-2x me-3"></i>
                  <span class="h3 fw-bold mb-0">Tick Tick</span>
                </div>

                <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Register a new account</h5>

                <div class="row my-2">
                  <div class="col-md-6">
                    <cfinput type="text" name="firstName" required="yes" message="First name field is required." class="form-control form-control-lg" placeholder="First name" >
                  </div>
                  <div class="col-md-6">
                    <cfinput type="text" name="lastName" required="yes" message="Last name field is required." class="form-control form-control-lg" placeholder="Last name" >
                  </div>
                </div>

                <div class="form-outline my-2">
                  <cfinput type="text" name="email" required="yes" message="Email field is required." class="form-control form-control-lg" placeholder="Email" >
                </div>

                <div class="form-outline my-2">
                  <cfinput type="password" name="password" required="yes" message="Password field is required." class="form-control form-control-lg" placeholder="Password" >
                </div>

                <div class="d-flex justify-content-end">
                  <button name="register" class="btn btn-primary btn-lg btn-block" type="submit">Register</button>
                </div>

                <p class="pb-lg-2 mt-2" style="color: #393f81;">Already have an account?
                  <a href="LoginView.cfm" class="text-decoration-none" style="color: #393f81;">Login here</a>
                </p>
                <a href="#!" class="small text-muted">Terms of use.</a>
                <a href="#!" class="small text-muted">Privacy policy</a>
              </cfform>

            </div>
        </div>
      </div>
    </div>
  </div>
</section>
</ct:PageLayout>
