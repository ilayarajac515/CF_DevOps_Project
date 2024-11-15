<cfoutput>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Sign in || Sign up form</title>
            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="./Assets/CSS/style2.css"> 
        </head>
        <body>
            <div class="container" id="container">
                <div class="form-container sign-up-container">
                    <form id="signupForm" method="post" enctype="multipart/form-data">
                        <h1>Create Account</h1>
                        <div class="infield">
                            <input type="text" placeholder="Name" id="name" name="name" />
                            <label></label>
                            <span class="error-message" id="name-error"></span>
                        </div>
                        <div class="infield">
                            <select id="type_of_role" name="type_of_role">
                                <option value="0">Select The Role</option>
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                            <label></label>
                            <span class="error-message" id="role-error"></span>
                        </div>
                        <div class="infield" id="shop_name_field" style="display:none;">
                            <input type="text" placeholder="Enter Shop Name" name="shop_name" id="shop_name_input" />
                            <label></label>
                            <span class="error-message" id="shop_name-error"></span>
                        </div>
                        <div class="infield" id="shop_logo_field" style="display:none;">
                            <input type="file" placeholder="Choose Shop Logo" name="shop_logo" />
                            <label></label>
                            <span class="error-message" id="shop_logo-error"></span>
                        </div>
                        <div class="infield" id="shop_name_select_field" style="display:none;">
                            <select id="shop_name_select" name="shop_name_select">
                                <option value="0">Select Shop Name</option>
                                <!-- Options will be populated dynamically -->
                            </select>
                            <label></label>
                            <span class="error-message" id="shop_name_select-error"></span>
                        </div>
                        <div class="infield" id="email_field" style="display:none;">
                            <input type="email" placeholder="Email" name="email" />
                            <label></label>
                            <span class="error-message" id="email-error"></span>
                        </div>
                        <div class="infield" id="password_field" style="display:none;">
                            <input type="password" placeholder="Password" name="password"/>
                            <label></label>
                            <span class="error-message" id="password-error"></span>
                        </div>
                        <button type="submit" name="sign_up" id="sign_up_btn">Sign Up</button>
                    </form>
                    
                    <cfif structKeyExists(form, 'sign_up')>
                        <cfset mail_id = "#form.email#">
                        <cfset a = createObject("component", "billing_system")>
                        <cfset retruval = a.SignupCheck(mail_id)>
                            <cfif retruval.COUNT GT 0>
                                <p><span class="error">Email already Registered</span></p>
                            <cfelse>
                                <cfset name = "#form.name#">
                                <cfset type_of_role = "#form.type_of_role#">
                                <cfset shop_name = "#form.shop_name#">
                                <cfset email = "#form.email#">
                                <cfset shop_logo = "#form.shop_logo#">
                                <cfset shop_name_select = "#form.shop_name_select#">
                                <cfset password = "#form.password#">
                                <cfset retruval = a.registerUser(name, type_of_role,email, password, shop_name,  shop_logo, shop_name_select)>
                                <cfset retrival =a.getRigsterDetails()>

                                <cfif retrival.COUNT GT 0>
                                    <cfset session.id = retrival.UserID>
                                    <cfset session.Shop_id = retrival.ShopID>
                                    <cfset session.email_id = retrival.Email>
                                    <cfset session.type_of_user = retrival.Role>
    
                                    <cflocation url="subscribe.cfm" addToken="false">
                                <cfelse>
                                    <p><span class="error">Not Found  Details</span></p>
                                </cfif>
                            </cfif>
                    </cfif>
                </div>
                <div class="form-container sign-in-container">
                    <form action="" method="post" onsubmit="return validateUser()">
                        <h1>Sign in</h1>
                        <!--- <div class="social-container">
                            <a href="##" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="##" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="##" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div> --->
                        <!--- <span>or use your account</span> --->
                        <div class="infield">
                            <input type="email" placeholder="Email" name="email" id="email_id"/>
                            <label></label>
                            <p><span id="error_email_id" class="error"></span></p>
                        </div>
                        <div class="infield">
                            <input type="password" name="password" placeholder="Password" id="password"/>
                            <label></label>
                            <p><span id="error_password" class="error"></span></p>
                        </div>
                        <a href="forgetpswd.cfm" class="forgot">Forgot your password?</a>
                        <button name="sign_in" type="submit">Sign In</button>
                    </form>
                    <cfif structKeyExists(form, 'sign_in')>
                        <cfset email_id = "#form.email#">
                        <cfset password = "#form.password#">
                        <cfset a = createObject("component", "billing_system")>
                        <cfset retruval = a.loginCheck(email_id, password)>
                        <cfif retruval.COUNT GT 0>
                            <cfset session.id = retruval.UserID>
                            <cfset session.Shop_id = retruval.ShopID>
                            <cfset session.email_id = retruval.Email>
                            <cfset session.type_of_user = retruval.Role>

                            <cfset currentDateTime = now()>
                            <cfset checksubscribe = a.subscribecheck(currentDateTime)>
                            <cfif checksubscribe.recordCount GT 0>
                                <cfset expirationDate = checksubscribe.ExpirationDate[1]>
                                <cfif currentDateTime GT expirationDate>
                                   <cflocation url="home.cfm" addToken="false"> 
                                <cfelse>
                                    <cfset session.expire = expirationDate>
                                    <cflocation url="home.cfm" addToken="false"> 
                                </cfif>
                            <cfelse>
                                <cflocation url="home.cfm" addToken="false"> 
                            </cfif>
                             
                        <cfelse>
                            <p><span class="error">Job Seeker/HR not exists</span></p>
                        </cfif>
                    </cfif>
                </div>
                <div class="overlay-container" id="overlayCon">
                    <div class="overlay">
                        <div class="overlay-panel overlay-left">
                            <h1>Welcome Back!</h1>
                            <p>To keep connected with us please login with your personal info</p>
                            <button>Sign In</button>
                        </div>
                        <div class="overlay-panel overlay-right">
                            <h1>Hello, Friend!</h1>
                            <p>Enter your personal details and start journey with us</p>
                            <button>Sign Up</button>
                        </div>
                    </div>
                    <button id="overlayBtn"></button>
                </div>
            </div>
    
            <script>
                const container = $("##container");
                const overlayCon = $("##overlayCon");
                const overlayBtn = $("##overlayBtn");
    
                overlayBtn.click(function() {
                    container.toggleClass('right-panel-active');
    
                    overlayBtn.removeClass('btnScaled');
                    window.requestAnimationFrame(() => {
                        overlayBtn.addClass('btnScaled');
                    });
                });
    
                $("##type_of_role").change(function() {
                    const role = $(this).val();
                    if (role === "admin") {
                        $("##shop_name_field").show();
                        $("##shop_logo_field").show();
                        $("##shop_name_select_field").hide();
                        $("##email_field").show();
                        $("##password_field").show();
                    } else if (role === "user") {
                        $("##shop_name_field").hide();
                        $("##shop_logo_field").hide();
                        $("##shop_name_select_field").show();
                        $("##email_field").show();
                        $("##password_field").show();
                        fetchShopNames();
                    } else {
                        $("##shop_name_field").hide();
                        $("##shop_logo_field").hide();
                        $("##shop_name_select_field").hide();
                        $("##email_field").hide();
                        $("##password_field").hide();
                    }
                });
    
                function fetchShopNames() {
                    $.ajax({
                        url: "billing_system.cfc?method=getShopNames",
                        type: "GET",
                        dataType: "json",
                        success: function(result) {
                            const shopNameSelect = $("##shop_name_select");
                            shopNameSelect.empty();
                            shopNameSelect.append('<option value="0">Select Shop Name</option>');
                            for (let i = 0; i < result.length; i++) {
                                let dat3 = result[i];
                                shopNameSelect.append('<option value="' + dat3.ShopID + '">' + dat3.ShopName + '</option>');
                            }
                        }
                    });
                }
    
                function validateUser() {
                    var isValid = true;
                    var email = $("##email_id").val();
                    var password = $("##password").val();
                    var error_email_id = $("##error_email_id");
                    var error_password = $("##error_password");
    
                    if (email == "") {
                        error_email_id.text("Email is required.");
                        isValid = false;
                    } else {
                        error_email_id.text("");
                    }
    
                    if (password == "") {
                        error_password.text("Password is required.");
                        isValid = false;
                    } else {
                        error_password.text("");
                    }
    
                    return isValid;
                }
                $(document).ready(function() {
                    $("##sign_up_btn").click(function(){
                        alert(shop_name_input.val())
                    })


                    $('##signupForm').on('submit', function(event) {
                        var role = $('##type_of_role').val();
                        var name = $('##name').val();
                        var email = $('input[name="email"]').val();
                        var password = $('input[name="password"]').val();
                        var valid = true;
                        
                       
                        $('.error-message').text('');

                        
                        if (name.trim() === '') {
                            $('##name-error').text('Name is required.');
                            valid = false;
                        }
                        
                        if (role === 'admin') {
                            
                            if ($('##shop_name_input').val().trim() === '') {
                                $('##shop_name-error').text('Shop Name is required for Admin role.');
                                valid = false;
                            }
                            if ($('input[name="shop_logo"]').val() === '') {
                                $('##shop_logo-error').text('Shop Logo is required for Admin role.');
                                valid = false;
                            }
                        } else if (role === 'user') {
                            
                            if ($('##shop_name_select').val() === '0') {
                                $('##shop_name_select-error').text('Please select a Shop Name.');
                                valid = false;
                            }
                        }

                        if (email.trim() === '') {
                            $('##email-error').text('Email is required.');
                            valid = false;
                        }

                        if (password.trim() === '') {
                            $('##password-error').text('Password is required.');
                            valid = false;
                        }

                        if (!valid) {
                            event.preventDefault(); 
                        }
                    });
                })

              
            </script>
        </body>
    </html>
    </cfoutput>
    