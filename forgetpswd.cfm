<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="./Assets/CSS/style2.css">
    <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  
</head>
<body>

    <div class="container2" id="container">
        <div class="row">
        <div class="forgot_password_div col-7">
            <div class="forgot_password_div2">
        
            <h2 class="text-center me-1 forgot_password_p">Forgot Password</h2>

            <!-- Step 1: Request OTP Form -->
            <div id="request-otp-form" class="subscription-cards">
                <form id="otpRequestForm">
                    <div class="infield">
                        <input type="email" placeholder="Email" name="email" id="email_id" required />
                        <label></label>
                        <p><span id="error_email_id" class="error"></span></p>
                    </div>
                    <input type="submit" value="Send OTP" class="btn btn-primary">
                    <span class="me-2 mt-2" id="back_index_btn"><i class="lni lni-reply"></i>Back</span>
                </form>
            </div>

            <!-- Step 2: Verify OTP Form -->
            <div id="verify-otp-form" class="subscription-cards" style="display:none;">
                <form id="otpVerifyForm">
                    <div class="infield">
                        <input type="text" placeholder="Enter OTP" name="otp" required />
                        <label></label>
                    </div>
                    <p id="otp-error" class="text-danger" style="display:none;">Incorrect OTP. Please try again.</p>
                    <input type="submit" value="Verify OTP" class="btn btn-primary">
                    <span class="me-2 mt-2" id="back_index_btn2"><i class="lni lni-reply"></i>Back</span>
                    
                </form>
                
            </div>

            <!-- Step 3: Reset Password Form -->
            <div id="reset-password-form" class="subscription-cards" style="display:none;">
                <form id="resetPasswordForm">
                    <div class="infield">
                        <input type="password" placeholder="New Password" name="password" required />
                        <label></label>
                    </div>
                    <div class="infield">
                        <input type="password" placeholder="Confirm Password" name="confirm_password" required />
                        <label></label>
                    </div>
                    <p id="password-error" class="text-danger" style="display:none;">Passwords do not match. Please try again.</p>
                    <input type="submit" value="Reset Password" class="btn btn-primary">
                </form>
               
            </div>
        </div>
        </div>
        <div class=" about_forgot_pswd_div col-5">
            <div class="about_forgot_pswd_div2">
            <h1 class="fgt_pswd_h1">Forgot your password?</h1>
            <p  class="fgt_pswd_p"> Don't worry, we'll help you reset it in no time. Just enter your registered email to get started!"</p>
            </div>
        </div>

        </div>
    </div>

     
    </div>

    <script>
        $(document).ready(function() {
            $("#back_index_btn").click(function() {
                $.ajax({
                    url: 'clear_session.cfm',
                    type: 'GET',
                    success: function() {
                        window.location.href = 'index.cfm';
                    }
                });
            });
            $("#back_index_btn2").click(function() {
                $.ajax({
                    url: 'clear_session.cfm',
                    type: 'GET',
                    success: function() {
                        window.location.href = 'index.cfm';
                    }
                });
            });

            // Handle OTP Request
            $("#otpRequestForm").submit(function(e) {
                e.preventDefault();
                const email = $("#email_id").val();
                $.ajax({
                    url: 'billing_system.cfc?method=sendOTP',
                    type: 'POST',
                    data: { email: email },
                    success: function(response) {
                            $("#request-otp-form").hide();
                            $("#verify-otp-form").show();
                        
                    }
                });
            });

            // Handle OTP Verification
            $("#otpVerifyForm").submit(function(e) {
                e.preventDefault();
                const otp = $("input[name='otp']").val();
                $.ajax({
                    url: 'billing_system.cfc?method=verifyOTP',
                    type: 'POST',
                    data: { otp: otp },
                    dataType:'json',
                    success: function(result) {
                        if (result === "successllll") {
                            $("#verify-otp-form").hide();
                            $("#reset-password-form").show();
                        } else {
                            $("#otp-error").text(result).show();
                        }
                    }
                });
            });

            // Handle Password Reset
            $("#resetPasswordForm").submit(function(e) {
                e.preventDefault();
                const password = $("input[name='password']").val();
                const confirmPassword = $("input[name='confirm_password']").val();
                if (password === confirmPassword) {
                    $.ajax({
                        url: 'billing_system.cfc?method=resetPassword',
                        type: 'POST',
                        data: { password: password, confirm_password: confirmPassword },
                        dataType:'json',
                        success: function(response) {
                            if (response == "success") {
                                window.location.href = 'index.cfm';
                            } else {
                                $("#password-error").text(response).show();
                            }
                        }
                    });
                } else {
                    $("#password-error").text("Passwords do not match.").show();
                }
            });
        });
    </script>
</body>
</html>


