<cfoutput>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Billing Software</title>
        <link rel="stylesheet" href="./Assets/CSS/style.css"> 
        
        <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-core.min.js"></script>
        <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-pie.min.js"></script>
        <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-bundle.min.js"></script>
        <script src="https://cdn.anychart.com/releases/v8/js/anychart-bundle.min.js"></script>
   
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" />
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
        <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>
            /* Sidebar User Styling */
            .sidebar-user {
                display: flex;
                align-items: center;
                padding: 1rem;
                background-color: ##0e2238; /* Sidebar background color */
                color: ##fff;
                
            }

            .sidebar-user img {
                height: 50px;
                width: 50px;
                border-radius: 50%;
                margin-right: 1rem;
                object-fit: cover; /* Ensures image fits within the circle */
                border: 5px solid  ##fff;
                box-sizing: border-box;
            }

            .sidebar-user div {
                display: flex;
                flex-direction: column;
            }

            .sidebar-user h3 {
                margin: 0;
                font-size: 1rem;
                color: ##fff;
            }

            .sidebar-user span {
                font-size: 0.870rem;
            }
            .admin , .user{
                color: white;
                font-weight:400;
            }
            ##secret_ID:hover{
                text-decoration:none;
                background-color:transparent;
                cursor:default;
                color:##fff;

            }

        </style>

    </head>
    <body>
        <div id="notification-bar" class="notification-bar"></div>
        <div id="lowStockToast" class="toast" data-autohide="false" style="position: absolute; top: 10px; right: 10px; z-index:5">
            <div class="toast-header">
                <strong class="mr-auto text-danger">Low Stock Alert</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast">&times;</button>
            </div>
            <div class="toast-body" style="color:##fff;background-color:##243B55;">
                Warning: Stock is below 10! Please replenish.
            </div>
        </div>
        
        <div class="wrapper">
            <aside id="sidebar">
                <div class="d-flex">
                    <button type="button" id="toggle-btn">
                        <i class="lni lni-grid-alt"></i>
                    </button>
                    <div class="sidebar-logo">
                        <a href="##" id="secret_ID">Billing_System</a>
                    </div>
                </div>

                <div class="sidebar-item">
                    <div class="sidebar-user">
                        <img  id="shop_logo">
                        <div>
                            <h3 id="shop_name"></h3>
                            <span class="userid" >UserID : <span id="hidden_secere_userid"></span></span>
                            <cfif session.type_of_user EQ "admin">
                                <span class="admin">admin : <span id="user_name"></span></span>
                            <cfelse>
                                <span class="user">user : <span id="user_name"></span></span>
                            </cfif>
                            <span id="user_mail"></span>
                            <input type="hidden" id="real_hidden_session_id">
                            <input type="hidden" id="real_hidden_Shop_id">
                            <input type="hidden" id="real_hidden_shop_name">
                            <input type="hidden" id="real_hidden_shop_logo">
                            <input type="hidden" id="real_hidden_Type_Of_User">
                           
                        </div>
                    </div>
                </div>
                
                <ul class="sidebar-nav">
                    <li class="sidebar-item">
                        <a href="##" class="sidebar-link sidebar_a"data-content="dashboard" >
                            <i class="lni lni-home"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="##" class="sidebar-link sidebar_a" data-content="profile" >
                            <i class="lni lni-user"></i>
                            <span>Profile</span>
                        </a>
                    </li>
                    <cfif session.type_of_user EQ "admin">
                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif>">
                            <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif> has-dropdown collapsed sidebar_a"   data-bs-toggle="collapse" data-bs-target="##tax" aria-expanded="false" aria-controls="tax"  data-content="add_tax" >
                                <i class="lni lni-rupee"></i>
                                <span>Tax</span>
                            </a>
                            <ul id="tax" class="sidebar-dropdown list-unstyled collapse " data-bs-parent="##sidebar">
                                <li class="sidebar-item">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a"  data-content="add_tax">Add Tax</a>
                                </li>
                                <li class="sidebar-item">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a"  data-content="manage_tax">Manage Tax</a>
                                </li>
                            </ul>
                        </li>
                    </cfif> 
                    <cfif session.type_of_user EQ "admin">
                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                            <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif> collapsed has-dropdown sidebar_a" data-bs-toggle="collapse"
                                data-bs-target="##category" aria-expanded="false" aria-controls="category" data-content="add_category">
                                <i class="lni lni-dropbox"></i>
                                <span>Category</span>
                            </a>
                            <ul id="category" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="##sidebar">
                                <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  collapsed" data-bs-toggle="collapse"
                                        data-bs-target="##main_category" aria-expanded="false" aria-controls="main_category">
                                    Main Category
                                    </a>
                                    <ul id="main_category" class="sidebar-dropdown list-unstyled collapse"  >
                                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                            <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a" data-content="add_category">Add Main Category</a>
                                        </li>
                                        <li class="sidebar-item">
                                            <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a" data-content="manage_category">Manage Main category</a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif> collapsed" data-bs-toggle="collapse"
                                        data-bs-target="##sub_category" aria-expanded="false" aria-controls="sub_category">
                                        Sub Category
                                    </a>
                                    <ul id="sub_category" class="sidebar-dropdown list-unstyled collapse">
                                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                            <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a" data-content="add_sub_category">Add Sub Category</a>
                                        </li>
                                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                            <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a" data-content="manage_sub_category">Manage Sub category</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </cfif> 
                    <cfif session.type_of_user EQ "admin">
                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                            <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif>  has-dropdown collapsed sidebar_a"  data-bs-toggle="collapse" data-bs-target="##unit" aria-expanded="false" aria-controls="unit" data-content="add_unit">
                                <i class="lni lni-package"></i>
                                <span>Unit</span>
                            </a>
                            <ul id="unit" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="##sidebar">
                                <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif> <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a" data-content="add_unit">Add unit</a>
                                </li>
                                <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> "> 
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif> <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a" data-content="manage_unit">Manage unit</a>
                                </li>
                            </ul>
                        </li>
                    </cfif> 
                   
                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                            <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif> has-dropdown collapsed sidebar_a"  data-bs-toggle="collapse" data-bs-target="##product" aria-expanded="false" aria-controls="product" data-content="add_product">
                            <i class="lni lni-stop"></i>
                                <span>Product</span>
                            </a>
                            <ul id="product" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="##sidebar">
                                <cfif session.type_of_user EQ "admin">
                                    <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                        <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a" data-content="add_product">Add Product</a>
                                    </li>
                                </cfif >
                                <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a" data-content="manage_product">Manage Product</a>
                                </li>
                            </ul>
                        </li>
                 
                    <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                        <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif>  has-dropdown collapsed sidebar_a"  data-bs-toggle="collapse" data-bs-target="##Invoice" aria-expanded="false" aria-controls="Invoice" data-content="add_invoice">
                            <i class="lni lni-pencil-alt"></i>
                            <span>Invoice</span>
                        </a>
                        <ul id="Invoice" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="##sidebar">
                            <li class="sidebar-item">
                                <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a" data-content="add_invoice">Add Invoice</a>
                            </li>
                            
                                <li class="sidebar-item">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a" data-content="manage_invoice">Manage Invoice</a>
                                </li>
                           
                        </ul>
                    </li>
                    <li class="sidebar-item <cfif  isDefined('session.expire')>disabled</cfif> ">
                        <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a" data-content="view_sales">
                            <i class="lni lni-cart-full"></i>
                            <span>View Sales</span>
                        </a>
                    </li>
                    <cfif session.type_of_user EQ "admin">
                        <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                            <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  has-dropdown collapsed sidebar_a"  data-bs-toggle="collapse" data-bs-target="##supplier" aria-expanded="false" aria-controls="supplier" data-content="add_supplier">
                                <i class="lni lni-car"></i>
                                <span>Supplier</span>
                            </a>
                            <ul id="supplier" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="##sidebar">
                                <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a" data-content="add_supplier">Add Supplier</a>
                                </li>
                                <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                                    <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a" data-content="manage_supplier">Manage Supplier</a>
                                </li>
                            </ul>
                        </li>
                    </cfif> 
                    <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                        <a href="##" class="sidebar-link <cfif not isDefined('session.expire')>disabled</cfif>  sidebar_a"  data-content="customer">
                            <i class="lni lni-customer"></i>
                            <span>Customer</span>
                        </a>
                    </li>
                    <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                        <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a"  data-content="analyze">
                            <i class="lni lni-bar-chart"></i>
                            <span>Analyze</span>
                        </a>
                    </li>
                    <li class="sidebar-item <cfif not isDefined('session.expire')>disabled</cfif> ">
                        <a href="##" class="sidebar-link  <cfif not isDefined('session.expire')>disabled</cfif> sidebar_a"  data-content="stock">
                            <i class="lni lni-briefcase-alt"></i>
                            <span>Stock</span>
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="##" class="sidebar-link sidebar_a"  data-content="subscription">
                            <i class="lni lni-alarm"></i>
                            <span>Subscription</span>
                        </a>
                    </li>
                   <!---  <li class="sidebar-item"> 
                        <a href="##" class="sidebar-link sidebar_a" data-content="settings">
                            <i class="lni lni-cog"></i>
                            <span>Settings</span>
                        </a>
                    </li> --->
                </ul>
                <div class="sidebar-footer">
             <!---        <form action="" method="post">
                        <a href="" class="sidebar-link"  id="logout_home" name="logout_home">
                            <i class="lni lni-exit"></i>
                            <span id="logout_home">Logout</span>
                        </a>
                  </form> --->
                  <form action="" method="post">
                    <button type="submit" name="logout_home" id="logout_home" class="sidebar-link">
                        <i class="lni lni-exit"></i>
                        <span>Logout</span>
                    </button>
                </form>
                
                </div>
            </aside>
            <div class="main">
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="##" class="d-none d-sm-inline-block">
                       <!---  <div class="input-group input-group-navbar">
                            <input type="text" class="form-control border-0 rounded-0" placeholder="Search...">
                            <button class="btn border-0 rounded-0" type="button">Search</button>
                        </div> --->
                        
                            <div class="input-group input-group-navbar">
                                <h1 style="font-weight: bold; color: ##013063; font-family: 'Arial', sans-serif;">Billing System</h1>
                        </div>
                        
                    </form>
                 <!---   <div class="company-name mx-5 text-center d-none d-sm-inline-block">
                    <span id="alertText">sssssssssss</span>
                    </div>  --->

              <!---       <div class="navbar-center">
                        <div id="alertMessage" class="alert alert-warning alert-dismissible fade show text-center" role="alert">
                            <div class="alert-content">
                               
                                <button type="button" class="btn-close alert_btn" data-bs-dismiss="alert" aria-label="Close"></button>
                            </div>
                        </div>
                    </div> --->
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="##" class="nav-icon pe-md-0" data-bs-toggle="dropdown">
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                                <div class="dropdown-menu dropdown-menu-end rounded">
                                    <!--- <a href="##" class="dropdown-item">
                                        <i class="lni lni-timer"></i>
                                        <span>Analytics</span>
                                    </a> --->
                                    <a href="##" class=" dropdown-item sidebar_a"  data-content="profile">
                                        <i class="lni lni-cog"></i>
                                        <span>Profile Settings</span>
                                    </a>
                                   <!---  <div class="dropdown-divider"></div>
                                    <a href="##" class="dropdown-item">
                                        <i class="lni lni-question-circle"></i>
                                        <span>Settings</span>
                                    </a>--->
                                </div> 
                            </li>
                        </ul>
                    </div>
                </nav>
                <main class="content px-3 py-4">
                    <div class="container-fluid">
                        <div class="mb-1">
                            <h3 class="fw-bold fs-4 mb-3" style="color: ##013063;">Admin Dashboard</h3>
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="card border-0">
                                        <div class="card-body py-4"> 
                                            <h5 class="mb-2 fw-bold" >
                                              Product
                                            </h5>
                                            <p class="mb-2 fw-bold">
                                                <i class="lni lni-stop"></i>
                                            </p>
                                            <div class="mb-0">
                                                <span class="badge  me-2 count_color" style="color:##fff">
                                                   Count
                                                </span>
                                                <span class="fw-bold product_count">
                                                   
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="card border-0">
                                        <div class="card-body py-4"> 
                                            <h5 class="mb-2 fw-bold">
                                               Sales
                                            </h5>
                                            <p class="mb-2 fw-bold">
                                                <i class="lni lni-cart-full"></i>
                                            </p>
                                            <div class="mb-0">
                                                <span class="badge me-2 count_color" style="color:##fff">
                                                    Count
                                                </span>
                                                <span class="fw-bold  sales_count">
                                                   

                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="card border-0">
                                        <div class="card-body py-4"> 
                                            <h5 class="mb-2 fw-bold">
                                                Supplier
                                            </h5>
                                            <p class="mb-2 fw-bold">
                                                <i class="lni lni-car"></i>
                                            </p>
                                            <div class="mb-0">
                                                <span class="badge  me-2 count_color" style="color:##fff">
                                                   Count
                                                </span>
                                                <span class="fw-bold supplier_count">
                                                   
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 col-md-3">
                                    <div class="card border-0">
                                        <div class="card-body py-4"> 
                                            <h5 class="mb-2 fw-bold">
                                               Invoice
                                            </h5>
                                            <p class="mb-2 fw-bold">
                                                <i class="lni lni-pencil-alt"></i>
                                            </p>
                                            <div class="mb-0">
                                                <span class="badge  me-2 count_color" style="color:##fff">
                                                    Count
                                                </span>
                                                <span class="fw-bold invoice_count">
                                                   
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <h3 class="fw-bold fs-4 my-3 mx-0" style=" color: ##013063;">Piechart & Bars Based on Sales </h3>
                          
                           
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div id="container_piechart11" class="chart-container"></div>
                        </div>
                        <div class="col-6">
                            <div id="dailySalesChart" class="chart-container"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div id="weeklySalesChart" class="chart-container"></div>
                        </div>
                        <div class="col-6">
                            <div id="monthlySalesChart" class="container_piechart chart-container"></div>
                        </div>
                    </div>
                    
                </main>
                <footer class="footer mt-3">
                    <div class="container-fluid">
                        <div class="row text-body-secondary">
                            <div class="col-6 text-start">
                                <a href="##" class="text-body-secondary">
                                    <strong>Billing System</strong>
                                </a>
                            </div>
                         
                           <!---  <div class="col-6 text-end text-body-secondary d-none d-md-block">
                                <ul class="list-inline mb-0">
                                    <li class="list-inline-item">
                                        <a href="##" class="text-body-secondary">Contact</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="##" class="text-body-secondary">About Us</a>
                                    </li>
                                    <li class="list-inline-item">
                                        <a href="##" class="text-body-secondary">Terms & Conditions</a>
                                    </li>
                                </ul>
                            </div> --->
                        </div>
                    </div>
                </footer>
            </div>
        </div>
      
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function() {
             
               
                var user_id = #session.id#;
                let type_of_user = "#session.type_of_user#";
                let user_email_id= "#session.email_id#";
                let shop_id = "# session.Shop_id#"
                let type_of_userr="#session.type_of_user#"
                $("##user_mail").text(user_email_id); 
               
                
               // $("##real_hidden_session_id").val()
                $("##real_hidden_session_id").val(user_id);
                $("##real_hidden_Shop_id").val(shop_id);
                $("##real_hidden_Type_Of_User").val(type_of_userr);
                var realID= $("##real_hidden_session_id").val();
                console.log("see here buddy their session idsss", realID)
                ShopDetails();


                var hidden_iddd=$("##hidden_secere_userid").val();
                console.log("see here buddy their type before", typeof (hidden_iddd));
                var Control_ID =Number(hidden_iddd)
                        console.log("see here buddy their type", typeof (Control_ID))
                        console.log("see here buddy their type", Control_ID)
                        var hidden_iddd2=$("##shop_name").val();
                        console.log("see here buddy their session id", user_id)
                        console.log("see here buddy their type", typeof (user_id))

             

                dailysales_weeklysales();
                
                function dailysales_weeklysales(){
                        var hidden_iddd =   $("##real_hidden_Shop_id").val();
                        console.log("------",hidden_iddd)
                        var Control_ID =Number(hidden_iddd)
                    $.ajax({
                    url: 'billing_system.cfc?method=getSalesDataaaa',
                    type: 'GET',
                    dataType: 'json',
                    data:{
                        Control_ID:hidden_iddd
                    },
                    success: function(result) {
                        //console.log('Sales result:', result);

                        // Access the correct keys in the result object
                        let todaySales = parseFloat(result.TODAYSALES) || 0;
                        let yesterdaySales = parseFloat(result.YESTERDAYSALES) || 0;
                        let thisWeekSales = parseFloat(result.THISWEEKSALES) || 0;
                        let lastWeekSales = parseFloat(result.LASTWEEKSALES) || 0;

                        // Check if values are correctly parsed
                        console.log('Parsed values:', {
                            todaySales,
                            yesterdaySales,
                            thisWeekSales,
                            lastWeekSales
                        });

                        // Render the Today's vs. Yesterday's Sales chart
                        anychart.onDocumentReady(function() {
                            const dailyChart = anychart.column();
                            dailyChart.data([
                                {x: "Today", value: todaySales},
                                {x: "Yesterday", value: yesterdaySales}
                            ]);
                            dailyChart.title("Today's vs. Yesterday's Sales");
                            dailyChart.tooltip().format("Total Sales Amount: {%value}");
                            dailyChart.container("dailySalesChart");
                            dailyChart.draw();

                            // Render the This Week vs. Last Week Sales chart
                            const weeklyChart = anychart.bar();
                            weeklyChart.data([
                                {x: "This Week", value: thisWeekSales},
                                {x: "Last Week", value: lastWeekSales}
                            ]);
                            weeklyChart.title("This Week vs. Last Week Sales");
                            weeklyChart.tooltip().format("Total Sales Amount: {%value}");
                            weeklyChart.container("weeklySalesChart");
                            weeklyChart.draw();
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching sales result:', error);
                    }
                });
                }
                monthysalesreport();
                function monthysalesreport(){
                    var hidden_iddd=$("##real_hidden_Shop_id").val();
                    console.log("------",hidden_iddd)
                    var Control_ID =Number(hidden_iddd)
                    $.ajax({
                    url: 'billing_system.cfc?method=getMonthlySalesData', // Change the method to your actual CFC method
                    type: 'GET',
                    dataType: 'json',
                    data:{
                        Control_ID:hidden_iddd
                    },
                    success: function(result) {
                        //console.log('Sales result report:', result);

                        // Assuming the result is an array of objects with 'month' and 'totalSales' keys
                        let salesData = result.map(item => {
                            return {x: item.month, value: item.totalSales};
                        });

                        // Render the Monthly Sales chart
                        anychart.onDocumentReady(function() {
                            const monthlySalesChart = anychart.line();
                            monthlySalesChart.data(salesData);
                            monthlySalesChart.title("Monthly Sales");
                            monthlySalesChart.tooltip().format("Total Sales: {%value}");
                            let series = monthlySalesChart.line(salesData);
                            series.markers(true)
                                .size(4)
                                .stroke("2 ##fff");

                            // Customize the line appearance
                            series.stroke({
                                color: "##00f", // Line color
                                thickness: 2   // Line thickness
                            });
                            monthlySalesChart.container("monthlySalesChart");
                            monthlySalesChart.draw();
                        });
                    },
                    error: function(xhr, status, error) {
                        console.error('Error fetching sales data:', error);
                    }
                });
                }
                
                
                
                Allcount();
                function  ShopDetails(){
                    //alert(user_id)
                    $.ajax({
                        url: 'billing_system.cfc?method=getShopDetails',
                        type: 'GET',
                        dataType: 'json',
                        data:{
                            user_id:user_id
                        },
                        success: function(result) {
                            console.log(result)
                            for(i=0;i<result.length>0;i++){
                                var dat=result[i];
                                console.log(dat);
                                console.log(dat.Name)
                                $("##user_name").text(dat.Name);
                                $("##shop_name").text(dat.ShopName);
                                $("##real_hidden_shop_name").val(dat.ShopName);
                                //alert(dat.ShopID)
                                //$("##real_hidden_session_id").val(dat.ShopID);
                                //console.log("val_shopID",dat.ShopID);
                                //var key_ShopID= $("##shop_name").val();
                                //console.log("key_ShopID",key_ShopID);
                                $("##hidden_secere_userid").val(dat.ShopID);
                                $("##secret_ID").val(dat.UserID);
                                $("##hidden_secere_userid").text(dat.UserID);
                                /* var h_id=$("##hidden_secere_userid").val(); */
                                /* alert(h_id);
                                console.log("id....",h_id) */
                               // console.log("Type of id:", typeof h_id);




                            }
                        }
                    })
                }


                function Allcount(){
                    var hidden_iddd=$("##real_hidden_Shop_id").val();
                    $.ajax({
                        url: 'billing_system.cfc?method=getProductCount',
                        type: 'GET',
                        dataType: 'json',
                        data:{
                            Control_ID:hidden_iddd
                        },
                        success: function(result) {
                        //console.log("countttt",result)
                            $('.product_count').text( result.DATA[0][0]);
                        }
                    });

                    $.ajax({
                        url: 'billing_system.cfc?method=getSalesCount',
                        type: 'GET',
                        dataType: 'json',
                        data:{
                            Control_ID:hidden_iddd
                        },
                        success: function(result) {
                           // console.log("Sales Count:", result);
                            $('.sales_count').text(result.DATA[0][0]);
                        }
                    });

                    $.ajax({
                        url: 'billing_system.cfc?method=getSupplierCount',
                        type: 'GET',
                        dataType: 'json',
                        data:{
                            Control_ID:hidden_iddd
                        },
                        success: function(result) {
                            //console.log("Supplier Count:", result);
                            $('.supplier_count').text(result.DATA[0][0]);
                        }
                    });

                    $.ajax({
                        url: 'billing_system.cfc?method=getInvoiceCount',
                        type: 'GET',
                        dataType: 'json',
                        data:{
                            Control_ID:hidden_iddd
                        },
                        success: function(result) {
                           // console.log("Invoice Count:", result);
                            $('.invoice_count').text(result.DATA[0][0]);
                        }
                    });
                }

             
            });
            fetchShopLogo();
            function fetchShopLogo() {
                var hiddenUserId = #session.id#; // Use .text() instead of .val() for text content
                //alert(hiddenUserId)
                
                $.ajax({
                    url: 'billing_system.cfc?method=getProfile',
                    type: 'get',
                    dataType: 'json',
                    data: {
                        user_id: hiddenUserId
                    },
                    success: function(result) {
                        console.log("here result", result);

                        if (result.length > 0) {
                            var dat = result[0]; // Assuming you only need the first result
                            console.log("here result", dat);

                            // Set image src, title, and alt attributes
                            $('##shop_logo').attr({
                                'src': './Assets/images/original_image/' + dat.shopLogo,
                                'title': 'Shop Logo: ' + dat.shopLogo,
                                'alt': 'Shop Logo'
                            });
                            $('##real_hidden_shop_logo').val(dat.shopLogo)
                        }
                    }
                });
            }
            fetchProfileImage();
            function fetchProfileImage() {
                var hiddenUserId = #session.id#; // Ensure this value is properly set on the server side
                
                $.ajax({
                    url: 'billing_system.cfc?method=getProfile',
                    type: 'get',
                    dataType: 'json',
                    data: {
                        user_id: hiddenUserId
                    },
                    success: function(result) {
                        console.log("here result", result);

                        if (result.length > 0) {
                            var dat = result[0]; // Assuming you only need the first result
                            console.log("here result", dat);

                            // Check if ProfileImageName is null or empty and set default if necessary
                            var profileImageName = dat.ProfileImageName ? dat.ProfileImageName : 'account.png';
                            
                            // Set image src, title, and alt attributes
                            $('##profile_image').attr({
                                'src': './Assets/images/original_image/' + profileImageName,
                                'title': 'Profile Image: ' + profileImageName,
                                'alt': 'Profile Image'
                            });

                            // Apply CSS for round shape and outline
                            $('##profile_image').css({
                                'width': '50px', // Adjust size as needed
                                'height': '50px', // Adjust size as needed
                                'border-radius': '50%', // Makes the image round
                                'object-fit': 'cover', // Ensures the image covers the circle without distortion
                                'border': '5px solid ##013063', // Outline color and thickness
                                 // Optional: Add padding to make the border visible
                                'box-sizing': 'border-box' // Ensures padding and border are included in the element's total width and height
                            });
                        }
                    }
                });
            }

            

        </script>
        <script src="./Assets/js/script.js">
        </script>
       
    </body>
</html>
<cfif structKeyExists(form,'logout_home')>
   
    <cfset structClear(session)>
    <cflocation url="index.cfm" addtoken="false">
</cfif>

<cfif structKeyExists(url, "subscription") AND url.subscription eq "success" AND NOT structKeyExists(session, "subscriptionAlertShown")>
    <cfset planID = url.planID>
    <cfset planNames = {
        "1": "Free Trial",
        "2": "One Month",
        "3": "Six Months"
    }>
    <cfset planName = structKeyExists(planNames, planID) ? planNames[planID] : "">

    <!-- Output the necessary JS and SweetAlert logic -->
    <cfif planName neq "">
        <cfoutput>
            <!-- Load SweetAlert2 library -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            
            <script>
                $(document).ready(function() {
                    Swal.fire({
                        title: 'Subscription Successful!',
                        text: 'Your #planName# plan has been activated successfully.',
                        icon: 'success',
                        confirmButtonText: 'OK'
                    }).then(function() {
                        // Redirect after alert is closed
                        window.location.href = "home.cfm";
                    });
                });
            </script>
        </cfoutput>
        <!-- Set session variable after the alert is shown -->
        <cfset session.subscriptionAlertShown = true>
    </cfif>
</cfif>





<cfif IsDefined("url.showNotification") AND url.showNotification EQ "true" AND NOT structKeyExists(session, "subscriptionAlertShown")>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <script>
        $(document).ready(function() {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-top-right", 
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };

            
            toastr.error('You have already used the free trial. You cannot avail another free trial with this email. Please choose another plan to view all features.');
        });
    </script>
     <cfset session.subscriptionAlertShown = true>
</cfif>



</cfoutput>
