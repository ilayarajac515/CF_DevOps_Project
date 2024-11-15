const hamburger=document.querySelector("#toggle-btn");

hamburger.addEventListener("click",function(){
    document.querySelector("#sidebar").classList.toggle("expand");
})

$(document).ready(function() {
    //fetchSubscriptionDetails();
    //setInterval(fetchSubscriptionDetails, 10000);
    
    fetchTopProductsData();
    checkSubscription();

    $('.sidebar_a').click(function() {
        var contentToShow = $(this).data('content');
        loadContent(contentToShow);
        if (contentToShow === 'manage_tax') {
            fetchTaxes();
            fetchProfileValue();
        }
        if(contentToShow  ==='manage_category'){
            fetchCategory();
            fetchProfileValue();
        }
        if(contentToShow === 'manage_unit'){
            fetchUnit();
            fetchProfileValue();
        }
        if(contentToShow === 'manage_supplier'){
            fetchSupplier();
            fetchProfileValue();
        }
        if(contentToShow === 'manage_sub_category'){
            fetchSubCategory();
            fetchProfileValue();
        }
        if(contentToShow === 'manage_product'){
            fetchProduct();
            fetchProfileValue();
        }
        if(contentToShow === 'view_sales'){
            fetchViewSales();
            fetchProfileValue();
        }
        if(contentToShow === 'manage_invoice'){
            fetchInvoices();
        }
        if(contentToShow === 'dashboard'){
            fetchTopProductsData();
            dailysales_weeklysales();
            monthysalesreport();
            Allcount();
            fetchProfileImage();
        }
        if(contentToShow === 'profile'){
            var type_of_user = $("#real_hidden_Type_Of_User").val();
            if (type_of_user === 'admin') {
                $("#shopName").prop('disabled', false);
                $("#shopLogo").prop('disabled', false);
              
               
            } else {
                
                $("#shopName, #shopLogo").closest('.form-group').hide();
            }
    
    
            fetchProfileValue();
        }
        if(contentToShow === 'add_tax'){
            fetchProfileValue();
        }
        if(contentToShow === 'add_category'){
            fetchProfileValue();
        } if(contentToShow === 'add_sub_category'){
            fetchProfileValue();
        }
        if(contentToShow === 'add_product'){
            fetchProfileValue();
        }
        if(contentToShow === 'add_unit'){
            fetchProfileValue();
        }
        if(contentToShow === 'add_supplier'){
            fetchProfileValue();
        }
        if(contentToShow === 'add_invoice'){
            fetchProfileValue();
        }
        if(contentToShow === 'view_invoice'){
            fetchProfileValue();
        }
        if(contentToShow === 'customer'){
            fetchCustomerDetails();
        }
        if(contentToShow === 'analyze'){
            fetchProfitData();
            fetchInvoiceDetails('today');
            $(document).on('click', '.dropdown-menu a', function() {
                var filter = $(this).data('filter');
                fetchInvoiceDetails(filter);
            });
            
        }
        if(contentToShow === 'stock'){
            fetchStockData();
        }
        if(contentToShow === 'subscription'){
            fetchSubscriptionDetails();
        }
    
    
        
       

    });

    function loadContent(content) {
        var contentHtml = '';
        switch(content) {
            case 'dashboard':
                contentHtml = `<nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                       
                            <h2 style="font-weight: bold; color: #013063; font-family: 'Arial', sans-serif;">Billing System</h2>

                        </div>
                    </form>
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
                            <h3 class="fw-bold fs-4 mb-3" style="color: #013063;">Admin Dashboard</h3>
                            <div class="row">
                                <div class="col-12 col-md-3">
                                    <div class="card border-0">
                                        <div class="card-body py-4"> 
                                            <h5 class="mb-2 fw-bold">
                                              Product
                                            </h5>
                                            <p class="mb-2 fw-bold">
                                                <i class="lni lni-stop"></i>
                                            </p>
                                            <div class="mb-0">
                                                <span class="badge count_color me-2">
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
                                                <span class="badge count_color me-2">
                                                    Count
                                                </span>
                                                <span class="fw-bold sales_count">
                                                    
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
                                                <span class="badge count_color me-2">
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
                                                <span class="badge count_color me-2">
                                                  Count
                                                </span>
                                                <span class="fw-bold invoice_count">
                                                   
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <h3 class="fw-bold fs-4 my-3" style="color: #013063;">Piechart & Bars Based on Sales </h3>
                           
                            
                        </div>
                    </div>
                    <div class="row" >
                        <div class="col-6 responsive-column">
                            <div id="container_piechart11" class="chart-container"></div>
                        </div>
                        <div class="col-6 responsive-column">
                            <div id="dailySalesChart" class="chart-container"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6 responsive-column">
                            <div id="weeklySalesChart" class="chart-container"></div>
                        </div>
                        <div class="col-6 responsive-column">
                            <div id="monthlySalesChart" class="container_piechart chart-container"></div>
                        </div>
                    </div>
                           
                    `;
                break;
            case 'profile':
            contentHtml=`
                <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Profile</h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Profile / <span class="above_one">Manage Profile</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="container  mt-5 manage_tax_body mb-5">
                       <form enctype="multipart/form-data" id="profileForm" name="profileForm">
                            <div class="form-group col-md-12">
                                <label for="userName" class="profile_label">Name</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="userNames" placeholder="Your Name" disabled >
                                    <button type="button" class="btn btn-primary ms-2" id="edit_button_profile_name">Edit</button>
                                    <button type="button" class="btn btn-success ms-2" id="update_button_profile_name" style="display: none;">Update</button>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="shopName" class="profile_label">Shop Name</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="shopName" placeholder="Shop Name" disabled>
                                    <button type="button" class="btn btn-primary ms-2" id="edit_button_shop_name">Edit</button>
                                    <button type="button" class="btn btn-success ms-2" id="update_button_shop_name" style="display: none;">Update</button>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="shopLogo" class="profile_label">Shop Logo</label>
                                <div class="input-group">
                                    <input type="file" class="form-control-file col-3" id="shopLogo" name="shopLogo" disabled>
                                    <div id="currentImageName_ShopLogo"  name="currentImageName_ShopLogo"style="margin-top: 10px;" class="form-control-file mt-1"></div>
                                    <span type="button" class="btn btn-primary ms-2" id="edit_button_shop_logo">Edit</span>
                                    <button type="button" class="btn btn-success ms-2" id="update_button_shop_logo" style="display: none;">Update</button>
                                </div>
                                <div id="currentShopLogo" style="margin-top: 10px;"></div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="email" class="profile_label">Email</label>
                                <div class="input-group">
                                    <input type="email" class="form-control" id="email" placeholder="Email" disabled>
                                    <button type="button" class="btn btn-primary ms-2" id="edit_button_email">Edit</button>
                                    <button type="button" class="btn btn-success ms-2" id="update_button_email" style="display: none;">Update</button>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="password" class="profile_label">Password</label>
                                <div class="input-group">
                                    <input type="password" class="form-control" id="password" placeholder="Password" disabled>
                                    <button type="button" class="btn btn-primary ms-2" id="edit_button_password">Edit</button>
                                    <button type="button" class="btn btn-success ms-2" id="update_button_password" style="display: none;">Update</button>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="profileImage" class="profile_label">Profile Image</label>
                                <div class="input-group">
                                    <input type="file" class="form-control-file col-3"id="profileImage" name="profileImage" disabled>
                                     <div id="currentImageName_ProfileImage"  name="currentImageName_ProfileImage"style="margin-top: 10px;" class="form-control-file mt-1"></div>
                                    <span type="button" class="btn btn-primary ms-2" id="edit_button_profile_image" >Edit</span>
                                    <button type="button" class="btn btn-success ms-2" id="update_button_profile_image" style="display: none;">Update</button>
                                </div>
                                <div id="currentProfileImage" style="margin-top: 10px;"></div>
                            </div>
                            <div class="form-group col-md-12">
                                <label for="mobileNumber" class="profile_label">Mobile Number</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="mobileNumber" placeholder="Mobile Number" disabled>
                                    <button type="button" class="btn btn-primary ms-2" id="edit_button_mobile_number">Edit</button>
                                    <button type="button" class="btn btn-success ms-2" id="update_button_mobile_number" style="display: none;">Update</button>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success" id="saveButton" style="display: none;">Save Profile</button>
                        </form>


                    </div>
                    


                    `
                break;    
            case 'manage_tax':
            contentHtml=`
             <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Manage Tax</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Tax / <span class="above_one">Manage Tax</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
            <div class="container  mt-5 manage_tax_body">
                <button class="btn btn-primary add_new_tax_page mb-3">+ Add New Tax</button>
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">Tax</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody class="manage_tax_tbody">
                        
                    </tbody>
                </table>
            </div>
            `
                break;
            case 'add_tax':
            contentHtml=`
                <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Add Tax</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Tax / <span class="above_one">Add Tax</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
               <div class="container mt-5 add_tax_body">
                        <button class="btn btn-primary manage-tax mb-3 manage_tax_page">
                            <i class="lni lni-control-panel"></i>
                            Manage Tax
                        </button>
                        <div class="form-container_add_tax">
                            <h2>New Tax Form</h2>
                            <label for="tax-amount">Tax Amount</label>
                            <input type="text" id="tax_amount" name="tax_amount"placeholder="Enter Tax Amount" class="form-control">
                            <button class="btn btn-success add-now w-25" id="add_tax_btn" name="add_tax_btn">Add Now</button>
                        </div>
                    </div>`
                break;
            case 'add_category':
            contentHtml=`
            <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Add New Category</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                     <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Category / <span class="above_one">Add Category</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                 <div class="container mt-5 add_category_body">
                        <button class="btn btn-primary manage_category_page mb-3">
                            <i class="lni lni-dropbox-original"></i>
                           Manage Category
                        </button>
                        <div class="form-container_add_category">
                            <h2>New Category</h2>
                            <label for="category_name">Category Name</label>
                            <input type="text" id="category_name" placeholder="Enter Tax Amount" class="form-control">
                            <button class="btn btn-success add-now w-25 add_category_btn">Add Now</button>
                        </div>
                    </div>`
                break;
            case 'manage_category': 
                contentHtml=`
                 <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Manage Category</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Category / <span class="above_one">Manage Category</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container  mt-5 manage_category_body">
                    <button class="btn btn-primary add_category_page mb-3">+ Add New Category</button>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">Category</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="manage_category_tbody">
                    
                        </tbody>
                    </table>
                </div>`
                break;   
            case 'add_sub_category':
                contentHtml = `
                <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Add New Sub-Category</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                     <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Sub-Category / <span class="above_one">Add Sub-Category</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                  <div class="container mt-5 add_sub_category_body">
                        <button class="btn btn-primary manage_sub_category_page mb-3">
                            <i class="lni lni-dropbox-original"></i>
                           Manage Sub-Category
                        </button>
                        <div class="form-container_add_category">
                            <h2>New Sub-Category</h2>
                            <label for="choose_category_name">Choose Category Name</label>
                            <select id="choose_category" class="form-control ">
                            </select>
                            <label for="category_name">Sub-Category Name</label>
                            <input type="text" id="sub_category_name" placeholder="Enter Sub_Category Name" class="form-control">
                            <button class="btn btn-success add-now w-25 add_sub_category_btn">Add Now</button>
                             <button type="button" class="btn btn-success save-changes_subcategory w-25 mt-2" id="saveSubCategoryBtn" style="display: none;">Save Changes</button>
                        </div>
                    </div>
                    `
                break; 
            case 'manage_sub_category':
                contentHtml = `
                <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Manage Sub-Category</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Sub-Category / <span class="above_one">Manage Sub-Category</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container  mt-5 manage_sub_category_body">
                    <button class="btn btn-primary add_sub_category_page mb-3">+ Add New Sub-Category</button>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">Category</th>
                                <th class="text-center">Sub-Category</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="manage_sub_category_tbody">
                    
                        </tbody>
                    </table>
                </div>`
                break;            
            case 'add_product':
                contentHtml = `
                <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Add New Product</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Product / <span class="above_one">Add Products</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                     <div class="container  mb-3">
                        <span><button class="btn btn-primary manage_product_page mt-3 mb-3 ms-2">+ Manage Product</button></span>
                        <div class="card1 add_product_body mb-5">
                            <div class="">
                                <h4 class="text-center">Product</h4>
                            </div>
                            <div class="card-body">
                                <form enctype="multipart/form-data" id="addproductform" name="addproductform">
                                   
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="productName">Product</label>
                                            <input type="text" class="form-control" id="productName" placeholder="Product Name">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="serialNumber">Serial Number</label>
                                            <input type="text" class="form-control" id="serialNumber" placeholder="Serial Number">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="productModel">Model</label>
                                            <input type="text" class="form-control" id="productModel" placeholder="Model">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="category">Category</label>
                                            <select class="form-control" id="category_select">
                                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="sellingPrice">Selling Price</label>
                                            <input type="number" class="form-control" id="sellingPrice" placeholder="Selling Price">
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="unit">Unit</label>
                                             <select class="form-control" id="unit_select">
                                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="tax">Tax</label>
                                            <select class="form-control" id="tax_select">

                                            </select>
                                        </div>
                                       
                                        <div class="form-group col-md-6">
                                            <label for="productImage">Image</label>
                                            <input type="file" class="form-control-file" id="productImage" name="productImage" >
                                            <div id="currentImageName"  name="currentImageName"style="margin-top: 10px;"></div>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="supplier">Supplier</label>
                                            <select class="form-control" id="supplier_select">
                                                
                                            </select>
                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="stock">Total Stock</label>
                                            <input type="number" class="form-control" id="totalstock" placeholder="Stock">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label for="purchaseprice">Purchase Price</label>
                                            <input type="number" class="form-control" id="purchase_price" placeholder="Purchase price">
                                        </div>
                                       
                                        <div class="form-group col-md-6">
                                            <label for="subcategory">Sub-Category</label>
                                               <select class="form-control" id="addproduct_sub_category_select">
                                                
                                            </select>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-success add-product-btn">Add Product</button>
                                    <button type="button" class="btn btn-success save-changes w-25 mt-2" id="saveProductBtn" style="display: none;">Save Changes</button>
                                </form>
                            </div>
                        </div>
                    </div>`;
                break; 
            case 'manage_product': 
                var type_of_user = $("#real_hidden_Type_Of_User").val(); // Retrieve user type
            
                // Construct the Actions column header based on user type
                var actionsHeader = '';
                var addProductButton = ''
                if (type_of_user === 'admin') {
                    actionsHeader = '<th class="text-center">Actions</th>';
                    addProductButton='<button class="btn btn-primary add_product_page mb-3">+ Add New Product</button>';
                }
        
                contentHtml = `
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Manage Product</h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Product / <span class="above_one">Manage Product</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="container  mt-5 manage_product_body">
                       ${addProductButton}
                        <table class="table table-bordered" id="manage_product_table">
                            <thead>
                                <tr>
                                    <th class="text-center">Product</th>
                                    <th class="text-center">Model</th>
                                    <th class="text-center">Serial</th>
                                    <th class="text-center">Sales Price</th>
                                    <th class="text-center">Purchase Price</th>
                                    <th class="text-center">Supplier</th>
                                    <th class="text-center">Image</th>
                                    ${actionsHeader}
                                </tr>
                            </thead>
                            <tbody class="manage_product_tbody">
                            </tbody>
                        </table>
                    </div>`;
                break;
            case 'add_unit':
                contentHtml=`
                 <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Add New Unit</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Unit / <span class="above_one">Add Units</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container mt-5 add_unit_body">
                        <button class="btn btn-primary  mb-3 manage_unit_page">
                            <i class="lni lni-control-panel"></i>
                            Manage Unit
                        </button>
                        <div class="form-container_add_unit">
                            <h2>Add Unit Form</h2>
                            <label for="unit-name">Unit name</label>
                            <input type="text" id="unit_name" name="unit_name"placeholder="Enter Unit Name" class="form-control">
                            <button class="btn btn-success add-now w-25" id="add_unit_btn" name="add_unit_btn">Add Now</button>
                        </div>
                    </div>`
                break;
            case 'manage_unit':
                contentHtml=`
                <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Manage Unit</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Unit / <span class="above_one">Manage Unit</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                  <div class="container  mt-5 manage_unit_body">
                    <button class="btn btn-primary add_unit_page mb-3">+ Add New Unit</button>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">Category</th>
                                <th class="text-center">Status</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody class="manage_unit_tbody">
                    
                        </tbody>
                    </table>
                </div>`
                break; 
            case 'add_supplier': 
                contentHtml=`
                 <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Add New Supplier</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Supplier / <span class="above_one">Add Supplier</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container mt-5 add_supplier_body mb-5">
                        <button class="btn btn-primary  mb-3 manage_supplier_page">
                            <i class="lni lni-control-panel"></i>
                            Manage Supplier
                        </button>
                        <div class="form-container_add_supplier">
                            <h2>Add Supplier Form</h2>
                            <div class="container_supplier ">
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="supplierName">Supplier Name</label>
                                            <input type="text" class="form-control" id="supplierName" placeholder="Enter Name of Supplier">
                                        </div>
                                        <div class="form-group">
                                            <label for="contact">Contact</label>
                                            <input type="text" class="form-control" id="contact" placeholder="Enter Contact Number of Supplier">
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <textarea class="form-control" id="address" rows="3" placeholder="Enter Address"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="details">Details</label>
                                            <textarea class="form-control" id="details" rows="3" placeholder="Enter Details"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label for="creditBalance">Previous Credit Balance</label>
                                            <input type="text" class="form-control" id="creditBalance" placeholder="Enter Previous Credit Balance">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                         <button class="btn btn-success add-now w-25 mt-2" id="add_supplier_btn" name="add_supplier_btn">Add Supplier Details</button>
                         <button type="button" class="btn btn-success save-changes w-25 mt-2" id="saveSupplierBtn" style="display: none;">Save Changes</button>
                </div>`
                break;  
            case 'manage_supplier': 
                contentHtml=`
                 <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Manage Supplier</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> / Supplier / <span class="above_one">Manage Supplier</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                 <div class="container  mt-5 manage_supplier_body">
                    <button class="btn btn-primary add_supplier_page mb-3">+ Add New Supplier</button>
                    <div class="table-responsive">
                        <table class="table table-bordered" id="manage_supplier_table">
                            <thead>
                                <tr>
                                    <th class="text-center">Supplier</th>
                                    <th class="text-center">Address</th>
                                    <th class="text-center">Contact</th>
                                    <th class="text-center">Details</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody class="manage_supplier_tbody">
                        
                            </tbody>
                        </table>
                    </div>
                </div>`
                break;                 
            case 'add_invoice':
                contentHtml = `
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Invoice</h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Invoice / <span class="above_one">Add Invoice</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    

                   <div class="invoice_body d-flex align-items-center mt-5">
                        <div class="container_invoice col-sm-12 col-md-8 col-lg-11 col-12 m-auto mt-5">
                        <div id="addinvoicecontent">
                             <span class="btn btn-primary manage_invoice_page mb-1" id="manage_invoice_page_id">Manage Invoices</span>
                             <h2 class="mb-5 text-center Billing_Invoice_head">Billing Invoice</h2>
                            <form id="invoiceForm">
                                <div class="row mt-5 mb-2">
                                    <div class="form-group col-md-6">
                                        <label for="customerName" class="special_label">Customer Name</label>
                                        <input type="text" class="form-control" id="customerNames" name="customerName" placeholder="Enter Customer Name">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="invoiceDate" class="special_label">Invoice Date</label>
                                        <input type="text" class="form-control" id="invoiceDate" name="invoiceDate" disabled readonly>
                                        <input type="hidden" class="form-control" id="hidden_invoiceDate" name="hidden_invoiceDate" disabled readonly>
                                    </div>
                                </div>
                                <div class="row mt-2 mb-2">
                                    <div class="form-group col-md-6">
                                       
                                    </div>
                                     <div class="form-group col-md-4">
                                       
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="available_stock" class="text-center special_label ms-4">Available stock</label>
                                        <input type="text" class="form-control w-75 text-center" id="available_stock" name="available_stock" disabled readonly>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered text-center">
                                        <thead>
                                            <tr>
                                                <th scope="col" class="text-center">Product</th>
                                                <th scope="col" class="text-center">Quantity</th>
                                                <th scope="col" class="text-center">Unit Price</th>
                                                <th scope="col" class="text-center">Discount (%)</th>
                                                <th scope="col" class="text-center">Tax (%)</th>
                                                <th scope="col" class="text-center">Actual Amount</th>
                                                <th scope="col" class="text-center">Discount Amount</th>
                                                <th scope="col" class="text-center">Tax Amount</th>
                                                <th scope="col" class="text-center">Total</th>
                                                <th scope="col" colspan="" class="text-center">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="invoiceItems">
                                            <!-- Items will be added here dynamically -->
                                        </tbody>
                                    </table>
                                </div>
                                <button type="button" class="btn btn-primary" id="addInvoiceItemButton" onclick="addInvoiceItem()">Add Item</button>
                                <div class="form-group  mt-4 total_Amount_area">
                                    <label for="totalAmount" class="special_label">Total Amount</label>
                                    <input type="text" class="form-control w-25" id="totalAmount" name="totalAmount" disabled readonly>
                                </div>
                                <button type="submit" class="btn btn-success mt-2">Generate Invoice</button>
                            </form>
                            <button type="button" id="print_invoice" class="btn btn-danger btn-print mt-4" onclick="printInvoice()">Print Invoice</button>
                          <button type="button" class="btn btn-success save-changes w-25 mt-2" id="saveInvoiceBtn" style="display: none;">Update Invoices</button>
                            </div>
                            <div id="invoicePreview" class="mt-4">
                            <!-- Invoice preview will be displayed here -->
                            </div>
                        </div>
                    </div>

                    `;
                break;
            case 'manage_invoice':
                contentHtml = `
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Manage Invoice</h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> /Invoice / <span class="above_one">ManageInvoice</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="container  mt-5 manage_invoice_body">
                        <button class="btn btn-primary add_invoice_page mb-3" id="add_invoice_page_id">+ Add New invoices</button>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center">InvoiceID</th>
                                    <th class="text-center">Customer Name</th>
                                    <th class="text-center">Date</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="manage_invoices_tbody">
                        
                            </tbody>
                        </table>
                    </div>
                    `;
                break;    
            case 'view_sales' :
                contentHtml =`
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Sales Table</h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Sales / <span class="above_one">Sales Table</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                     <div class="container  mt-5 manage_supplier_body">
                    <button class="btn btn-primary add_invoice_page mb-3" id="add_invoice_page_id">+ Create New invoices</button>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">Product</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Price</th>
                                <th class="text-center">Total</th>
                                <th class="text-center">Date</th>
                            </tr>
                        </thead>
                        <tbody class="manage_viewsales_tbody">
                    
                        </tbody>
                    </table>
                </div>

                `
                    break;
            case 'view_invoice' :
                contentHtml =`
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>View Invoices</h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Invoice / <span class="above_one">View Invoice</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="invoice_body d-flex align-items-center mt-5">
                        <div class="container_invoice col-sm-12 col-md-8 col-lg-11 col-12 m-auto mt-5">
                            <div class="view_invoice">
                           
                            </div> 
                        </div> 
                    </div>
                    <style>
                        body { font-family: Arial, sans-serif;  }
                        h2 { color: #007bff; }
                        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                        th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
                        .total { font-weight: bold; }
                    </style>
                        `
                break;
            case 'customer' :
                contentHtml =`
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Customer Details </h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Customer / <span class="above_one">Customer Details</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                     <div class="invoice_body d-flex align-items-center mt-5">
                        <div class="container  mt-5 manage_supplier_body">
                        <button class="btn btn-primary add_invoice_page mb-3" id="add_invoice_page_id">+ Create New invoices</button>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th class="text-center" >Date</th>
                                    <th class="text-center">Customer Name</th>
                                    <th class="text-center">Purchase Products</th>
                                    <th class="text-center">Purchase Amount</th>
                                    <th class="text-center">Invoice ID</th>
                                </tr>
                            </thead>
                            <tbody class="manage_customer_tbody">
                        
                            </tbody>
                        </table>
                    </div>
                    </div>
                   
                        `
                break;
            case 'analyze' :
                contentHtml =`
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Analyze </h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Analyze / <span class="above_one">Overall Analyze</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                        <div class="invoice_body align-items-center mt-5">
                            <div class="container  mt-5 manage_supplier_body">
                                <div class="dropdown mb-3">
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                        Select Sales Period
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                                        <li><a class="dropdown-item" href="#" data-filter="today">Today Sales</a></li>
                                        <li><a class="dropdown-item" href="#" data-filter="yesterday">Yesterday Sales</a></li>
                                        <li><a class="dropdown-item" href="#" data-filter="this_week">This Week Sales</a></li>
                                        <li><a class="dropdown-item" href="#" data-filter="last_week">Last Week Sales</a></li>
                                        <li><a class="dropdown-item" href="#" data-filter="this_month">This Month Sales</a></li>
                                        <li><a class="dropdown-item" href="#" data-filter="last_month">Last Month Sales</a></li>
                                        <li><a class="dropdown-item" href="#" data-filter="this_year">This Year Sales</a></li>
                                        <li><a class="dropdown-item" href="#" data-filter="last_year">Last Year Sales</a></li>
                                    </ul>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="invoiceTable"  >
                                        <thead>
                                            <tr>
                                                <th class="text-center">Invoice ID</th>
                                                <th class="text-center">Date  </th>
                                                <th class="text-center">Product Name</th> 
                                                <th class="text-center">Purchase Price</th> 
                                                <th class="text-center">Selling Price</th>
                                                <th class="text-center">Total Purchase Amount</th>
                                                <th class="text-center">Discount Amount</th>
                                                <th class="text-center">Tax Amount</th>
                                                <th class="text-center">Quantity</th>
                                                <th class="text-center">Profit Amount</th>
                                            </tr>
                                        </thead>
                                        <tbody class="invoice_profit_details_tbody">
                                            <!-- Data will be populated here -->
                                        </tbody>
                                    </table>
                                </div>
                                <div id="profitComparisonChart" style="width: 100%; height: 400px;"></div>

                        
                            </div>
                        </div>

                    
                        `
                break; 
            case 'stock' :
                contentHtml =`
                    <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            <h3>Stock </h3>
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item ">
                                    <a href="#" class="nav-icon pe-md-0" >
                                        <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <nav class="navbar navbar-expand px-4 py-3">
                        <form action="#" class="d-none d-sm-inline-block">
                            <div class="input-group input-group-navbar">
                            </div>
                        </form>
                        <div class="navbar-collapse collapse">
                            <ul class="navbar-nav ms-auto">
                                <li class="nav-item dropdown">
                                    <a href="#" class="nav-icon pe-md-0 above_one1" >
                                        <span><i class="lni lni-home"></i> / Stock / <span class="above_one">Overall Stock</span></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </nav>
                     <div class="invoice_body d-flex align-items-center mt-5">
                        <div class="container  mt-5 manage_supplier_body">
                            <div id="stockContainer">
                                <h2>Current Stock</h2>
                                <table id="stockTable"  class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="text-center">Product Name</th>
                                            <th class="text-center">Current Stock</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Data will be populated here by JavaScript -->
                                    </tbody>
                                </table>
                            </div>

                           <div id="addStockContainer" style="display: none;" class="container mt-4">
                                <h2 class="mb-4">Add Stock</h2>
                                <form id="addStockForm" class="needs-validation" novalidate>
                                    <input type="hidden" id="productId" name="product_id">
                                    
                                    <div class="form-group row mb-3">
                                        <label for="productName" class="col-sm-2 col-form-label">Product Name:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control w-25" id="productName" name="product_name" readonly>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group row mb-3">
                                        <label for="currentStock" class="col-sm-2 col-form-label">Current Stock:</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control w-25" id="currentStock" name="current_stock" readonly>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group row mb-4">
                                        <label for="addStock" class="col-sm-2 col-form-label">Add Stock:</label>
                                        <div class="col-sm-10">
                                       
                                            <input type="number" class="form-control w-25" id="addStock" name="add_stock" required>
                                            <div class="invalid-feedback">Please enter the stock amount.</div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group row">
                                        <div class="col-sm-10 offset-sm-2">

                                            <button type="submit" class="btn btn-primary">Update</button>
                                            <button type="button" id="cancelUpdate" class="btn btn-danger">Cancel</button>
                                        </div>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>

                        
                        `
                break; 
            case 'subscription':
            contentHtml =`
                <nav class="navbar navbar-expand px-4 py-3 add_head_color">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        <h3>Subscription</h3>
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item ">
                                <a href="#" class="nav-icon pe-md-0" >
                                    <img src="" class="avatar img-fluid" alt="" id="profile_image">
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <nav class="navbar navbar-expand px-4 py-3">
                    <form action="#" class="d-none d-sm-inline-block">
                        <div class="input-group input-group-navbar">
                        </div>
                    </form>
                    <div class="navbar-collapse collapse">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item dropdown">
                                <a href="#" class="nav-icon pe-md-0 above_one1" >
                                    <span><i class="lni lni-home"></i> /Subscription / <span class="above_one">Subscription Page</span></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                    <div class="invoice_body align-items-center mt-5">
                        <div class="container  mt-5 manage_subscription_body">
                           
                        </div>
                    </div>

                
            `
                break;                                                         
            default:
                contentHtml = '<p>Content not found</p>';
                break;
        }
        $('.main').html(contentHtml);
        //Initializeselectpicker();
        fetchSelectInvoiceProduct();
        reinitializeScripts();

        if (content === 'add_product') {
            fetch_Select_Categories();
            fetch_Select_Taxes();
            fetch_Select_Unit();
            fetch_Select_Supplier();
            $("#addproduct_sub_category_select").empty().append('<option value="0">Please choose Sub-Category</option>');
           
        }
        if(content === 'add_sub_category'){
            fetch_Select_sub_Categories();
        }
        
    }

    var itemCounter = 0;
    window.addInvoiceItem = function() {
        itemCounter++;
        const newItemRow = `
            <tr id="itemRow${itemCounter}">
                <td>
                <div class="search_select_box">
                    <select id="productSelect${itemCounter}" class="form-control Product_select ">
                        <option value="0">Select Product</option>
                    </select>
                </div>
                </td>
                <td><input type="number" class="form-control quantity text-center" name="quantity" placeholder="Enter Quantity" required></td>
                <td><input type="text" class="form-control unitPrice text-center" name="unitPrice" disabled readonly value="0.00"></td>
                <td>
                    <input type="number" class="form-control discount text-center" name="discount" placeholder="Enter Discount (%)" min="0" max="100" >
                 
                </td>

                <td><input type="text" class="form-control tax text-center" name="tax" disabled readonly value="0.00%"></td>
                <td><input type="text" class="form-control actualAmount text-center" name="actualAmount" disabled readonly></td>
                <td><input type="text" class="form-control discountAmount text-center" name="discountAmount" disabled readonly ></td>
                <td><input type="text" class="form-control taxAmount text-center" name="taxAmount" disabled readonly></td>
                <td><input type="text" class="form-control totalItemPrice text-center" name="totalItem" disabled readonly></td>
                <td><button type="button" class="btn btn-danger" onclick="removeInvoiceItem(${itemCounter})">Remove</button></td>
            </tr>`;
        $("#invoiceItems").append(newItemRow);
        //$(`#productSelect${itemCounter}`).selectpicker(); 
        fetchSelectInvoiceProduct(`productSelect${itemCounter}`); 
        updateTotalAmount();
   /*       const newProductSelect = document.querySelector(`#productSelect${itemCounter}`);
        new Choices(newProductSelect, {
            searchEnabled: true,
            placeholder: true,
            placeholderValue: 'Select Product'
        }); */
    };
   

    // Event listener for adding invoice items


    window.removeInvoiceItem = function(itemId) {
        $(`#itemRow${itemId}`).remove();
        updateTotalAmount();
        fetchSelectInvoiceProduct();
        previousStock();
       
    };
    function updateTotalAmount() {
        let totalAmount = 0;
        $("tr[id^='itemRow']").each(function() {
            const quantity = parseFloat($(this).find(".quantity").val()) || 0;
            const unitPrice = parseFloat($(this).find(".unitPrice").val()) || 0;
            const discount = parseFloat($(this).find(".discount").val().replace('%', '')) || 0;
            const tax = parseFloat($(this).find(".tax").val()) || 0;
    
            // Calculate actual amount
            const actualAmount = quantity * unitPrice;
            $(this).find(".actualAmount").val(actualAmount.toFixed(2));
    
            // Calculate discount amount
            const discountAmount = actualAmount * (discount / 100);
            $(this).find(".discountAmount").val(discountAmount.toFixed(2));
    
            // Calculate tax amount
            const taxableAmount = actualAmount - discountAmount;
            const taxAmount = taxableAmount * (tax / 100);
            $(this).find(".taxAmount").val(taxAmount.toFixed(2));
    
            // Calculate total item price
            const totalItemPrice = taxableAmount + taxAmount;
            $(this).find(".totalItemPrice").val(totalItemPrice.toFixed(2));
    
            totalAmount += totalItemPrice;
        });
        $("#totalAmount").val(totalAmount.toFixed(2));
    }
    
    // Function to handle product selection change
    $(document).on('change', "select[id^='productSelect']", function() {
        const selectedProduct = $(this).find('option:selected');
        const unitPrice = parseFloat(selectedProduct.data('unit-price')) || 0;
        $(this).closest('tr').find('.unitPrice').val(unitPrice.toFixed(2));
        updateTotalAmount();
    });
    $(document).on('click', '.sidebar_a', function() {
        var contentToShow = $(this).data('content');
        loadContent(contentToShow);
        var type_of_user = $("#real_hidden_Type_Of_User").val();
        if (type_of_user === 'admin') {
            $("#shopName").prop('disabled', false);
            $("#shopLogo").prop('disabled', false);
          
           
        } else {
            
            $("#shopName, #shopLogo").closest('.form-group').hide();
        }


        fetchProfileValue();

       
    });
    
    
    /* function Initializeselectpicker(){
        $('.selectpicker').selectpicker();
    } */
    function reinitializeScripts() {
        const currentDate = new Date();
        const formattedDate = currentDate.toISOString().slice(0, 10);
        const hidden_formattedDate = currentDate.toISOString().slice(0, 19);
        //alert(hidden_formattedDate)
        $("#invoiceDate").val(formattedDate);
        $("#hidden_invoiceDate").val(hidden_formattedDate);
        $("#invoiceForm").submit(function(event) {
            event.preventDefault();
            updateTotalAmount();
            // Handle form submission (e.g., send data to backend)
        });
     
    }
    window.printInvoice = function() {
        const customerName = $("#customerNames").val();
        const invoiceDate = $("#invoiceDate").val();
        let hidden_formattedDate = $("#hidden_invoiceDate").val();
        const items = [];
        let totalAmount = 0;
    
        // Validate customer name
        if (!customerName) {
            alert("Please enter the customer name.");
            return;
        }
    
        // Validate that at least one product is selected
        let productSelected = false;
        $("tr[id^='itemRow']").each(function() {
            const description = $(this).find("select option:selected").text();
            if (description !== "Select Product") {
                productSelected = true;
                const quantity = $(this).find("td:eq(1) input").val();
                if (quantity > 0) {
                    const productId = $(this).find(".Product_select").val();
                    const unitPrice = $(this).find("td:eq(2) input").val();
                    let discount = $(this).find("td:eq(3) input").val();
                    let tax = $(this).find("td:eq(4) input").val();
                    const actualAmount = $(this).find("td:eq(5) input").val();
                    const discountAmount = $(this).find("td:eq(6) input").val();
                    const taxAmount = $(this).find("td:eq(7) input").val();
                    const totalItemPrice = $(this).find("td:eq(8) input").val();
                    tax = tax.replace('%', '');
                    discount = discount || "0.00";
    
                    items.push({
                        productId: productId,
                        description: description,
                        quantity: quantity,
                        unitPrice: unitPrice,
                        discount: discount,
                        tax: tax,
                        actualAmount: actualAmount,
                        discountAmount: discountAmount,
                        taxAmount: taxAmount,
                        totalItemPrice: totalItemPrice,
                    });
                }
            }
        });
    
        if (!productSelected) {
            alert("Please select at least one product.");
            return;
        }
    
        // Validate that at least one quantity is entered for selected products
        let atLeastOneQuantityEntered = items.some(item => item.quantity > 0);
        if (!atLeastOneQuantityEntered) {
            alert("Please enter at least one quantity for the selected products.");
            return;
        }
    
        totalAmount = $("#totalAmount").val();
        var hidden_shop_name= $("#real_hidden_shop_name").val();
        var hidden_shop_name= $("#real_hidden_shop_name").val();
        var hidden_shop_logo = $('#real_hidden_shop_logo').val();
    
        // Construct the image URL
        var logoSrc = './Assets/images/original_image/' + hidden_shop_logo;
        const invoiceContent = `
            <html>
                <head>
                    <title>Invoice Slip</title>
                    <style>
                        body { font-family: Arial, sans-serif;  }
                        h2 { color: #007bff; }
                        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                        th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
                        .total { font-weight: bold; }
                         h1{ font-weight: bold; }
                        img#hidden_shop_logo { max-height: 70px; vertical-align: middle; }
                    </style>
                </head>
                <body>
                    <h1 class="text-center">  <img id="hidden_shop_logo" src="${logoSrc}" alt="Shop Logo"> ${hidden_shop_name}</h1> 
                    <h2>Invoice Slip</h2>
                    <p><strong>Customer Name:</strong> ${customerName}</p>
                    <p><strong>Date and Time:</strong> ${invoiceDate}</p>
                    <table>
                        <thead>
                            <tr>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Discount (%)</th>
                                <th>Tax (%)</th>
                                <th>Actual Amount</th>
                                <th>Discount Amount</th>
                                <th>Tax Amount</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            ${items.map(item => `
                                <tr>
                                    <td>${item.description}</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.unitPrice}</td>
                                    <td>${item.discount}%</td>
                                    <td>${item.tax}</td>
                                    <td>${item.actualAmount}</td>
                                    <td>${item.discountAmount}</td>
                                    <td>${item.taxAmount}</td>
                                    <td>${item.totalItemPrice}</td>
                                </tr>`).join("")}
                        </tbody>
                    </table>
                    <p class="total">Total Amount: ${totalAmount}</p>
                    
                </body>
            </html>`;
    
        $("#invoicePreview").empty();  // Clear previous content
        $("#invoicePreview").append(invoiceContent);
    
        // Hide the invoice form and show the preview
        $("#addinvoicecontent").hide();
        $("#invoicePreview").show();
    
        // Attach the print button functionality to open the invoice in a new window and print
        $("#invoicePreview").append('<button class="btn btn-primary me-3" onclick="backToInvoiceForm()">Back</button>');
        $("#invoicePreview").append('<button class="btn btn-success" onclick="printInvoiceInNewWindow()">Print</button>');
    
        var hidden_iddd = $("#hidden_secere_userid").val();
    
        $.ajax({
            url: "billing_system.cfc?method=updateStock",
            type: "POST",
            dataType: "json",
            data: {
                items: JSON.stringify(items),
                Control_ID: hidden_iddd
            },
            success: function(response) {                            
                $.ajax({
                    url: "billing_system.cfc?method=addInvoice",
                    type: "POST",
                    dataType: "json",
                    data: {
                        customerName: customerName,
                        hidden_formattedDate: hidden_formattedDate,
                        totalAmount: totalAmount,
                        items: JSON.stringify(items),
                        Control_ID: hidden_iddd
                    },
                    complete: function(result) {
                        alert("Invoice added successfully!");
                        clearFields();
                    }
                });
            }
        });
    
        /* Uncomment if you want to print directly
        const printWindow = window.open("", "_blank");
        printWindow.document.write(invoiceContent);
        printWindow.document.close();
        printWindow.print();
        */
    };
    
    
    function clearFields() {
        $("#customerNames").val('');
        $("tr[id^='itemRow']").each(function() {
            $(this).find("select").val('0'); // Clear select
            $(this).find("input").val('0.00');  // Clear input field and set default value
            $(this).find("td:eq(1) input").val(''); //clear quantity
            $(this).find("td:eq(3) input").val(''); //clear discount
            $(this).find("td:eq(4) input").val('0.00%'); // clear discount and set default value
        });
        $("#totalAmount").val('');
        $(`#available_stock`).val('');
    }
    window.printInvoiceInNewWindow = function() {
        const invoiceContent = $("#invoicePreview").html();
        const printWindow = window.open("", "_blank");
        printWindow.document.write(invoiceContent);
        printWindow.document.close();
        printWindow.print();
    };

    window.backToInvoiceForm = function() {
        // Show the invoice form and hide the preview
        $("#addinvoicecontent").show();
        $("#invoicePreview").hide();
        $("select[id^='productSelect']").each(function() {
            const selectId = $(this).attr('id');
            fetchSelectInvoiceProduct(selectId);
            previousStock();
        })
        itemCounter = 0;
    };
    
    

    
    function fetchTaxes() {
        var hidden_iddd=$("#hidden_secere_userid").val();
        //alert(typeof hidden_iddd)
        $.ajax({
            url: 'billing_system.cfc?method=getTaxes',
            type: 'get',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
               // console.log(result);
                for(let i = 0; i < result.length; i++) {
                    let dat = result[i];
                    console.log(dat);
                    var taxrow = '<tr>' +
                        '<td>' + dat.tax_amount + '</td>' +
                        '<td>' + dat.status + '</td>' +
                        '<td>' +
                        '<button class="btn btn-warning btn-sm edit-tax me-3" data-id="' + dat.id + '"><i class="lni lni-pencil"></i> Edit</button>' +
                        '<button class="btn btn-danger btn-sm delete-tax" data-id="' + dat.id + '"><i class="lni lni-trash-can"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('.manage_tax_tbody').append(taxrow);
                }
            }
        });
    }
    function fetchCategory() {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=getCategory',
            type: 'get',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log(result);
              
                for(let i = 0; i < result.length; i++) {
                    let dat2 = result[i];
                    console.log(dat2);
                    var categoryrow = '<tr>' +
                        '<td>' + dat2.category_name + '</td>' +
                        '<td>' + dat2.status + '</td>' +
                        '<td>' +
                        '<button class="btn btn-warning btn-sm edit-category me-3" data-id="' + dat2.id + '"><i class="lni lni-pencil"></i> Edit</button>' +
                        '<button class="btn btn-danger btn-sm delete-category" data-id="' + dat2.id + '"><i class="lni lni-trash-can"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('.manage_category_tbody').append(categoryrow);
                    
                }
            }
        });
    }
    function fetchUnit() {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=getUnit',
            type: 'get',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log(result);
            
                for(let i = 0; i < result.length; i++) {
                    let dat3 = result[i];
                    console.log(dat3);
                    var unitrow = '<tr>' +
                        '<td>' + dat3.unit_name + '</td>' +
                        '<td>' + dat3.status + '</td>' +
                        '<td>' +
                        '<button class="btn btn-warning btn-sm edit-unit me-3 " data-id="' + dat3.id + '"><i class="lni lni-pencil"></i> Edit</button>' +
                        '<button class="btn btn-danger btn-sm delete-unit" data-id="' + dat3.id + '"><i class="lni lni-trash-can"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('.manage_unit_tbody').append(unitrow);
                }
            }
        });
    }
    function fetchSupplier() {
        var hidden_iddd=$("#hidden_secere_userid").val();

        $.ajax({
            url: 'billing_system.cfc?method=getSupplier',
            type: 'get',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log(result);
            
                for(let i = 0; i < result.length; i++) {
                    let dat3 = result[i];
                    console.log(dat3);
                    var supplierrow = '<tr>' +
                        '<td>' + dat3.supplier_name + '</td>' +
                        '<td>' + dat3.address + '</td>' +
                        '<td>' + dat3.contact + '</td>' +
                        '<td>' + dat3.details + '</td>' +
                        '<td>' +
                        '<button class="btn btn-warning btn-sm edit-supplier me-3" data-id="' + dat3.id + '"><i class="lni lni-pencil"></i> Edit</button>' +
                        '<button class="btn btn-danger btn-sm delete-supplier" data-id="' + dat3.id + '"><i class="lni lni-trash-can"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('.manage_supplier_tbody').append(supplierrow);
                }
            }
        });
    }
    function fetchSubCategory() {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=getSubCategory',
            type: 'get',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log(result);
              
                for(let i = 0; i < result.length; i++) {
                    let dat2 = result[i];
                    console.log(dat2);
                    var categoryrow = '<tr>' +
                        '<td>' + dat2.category_name + '</td>' +
                        '<td>' + dat2.sub_category_name + '</td>' +
                        '<td>' + dat2.status + '</td>' +
                        '<td>' +
                        '<button class="btn btn-warning btn-sm edit-sub-category me-3" data-id="' + dat2.id + '"><i class="lni lni-pencil"></i> Edit</button>' +
                        '<button class="btn btn-danger btn-sm delete-sub-category" data-id="' + dat2.id + '"><i class="lni lni-trash-can"></i> Delete</button>' +
                        '</td>' +
                        '</tr>';

                    $('.manage_sub_category_tbody').append(categoryrow);
                    
                }
            }
        });
    }
    function fetchProduct() {
        var hidden_iddd = $("#hidden_secere_userid").val();
        var type_of_user = $("#real_hidden_Type_Of_User").val(); // Retrieve the user type
    
        $.ajax({
            url: 'billing_system.cfc?method=getProduct',
            type: 'get',
            dataType: 'json',
            data: {
                Control_ID: hidden_iddd
            },
            success: function(result) {
                // Clear existing rows
                $('.manage_product_tbody').empty();
    
                // Loop through the result and build table rows
                for (let i = 0; i < result.length; i++) {
                    let dat2 = result[i];
                    console.log(dat2);
    
                    // Determine action buttons based on user type
                    var actionButtons = '';
                    if (type_of_user === 'admin') {
                        actionButtons = '<button class="btn btn-warning btn-sm edit-product me-3" data-id="' + dat2.id + '"><i class="lni lni-pencil"></i> Edit</button>' +
                                        '<button class="btn btn-danger btn-sm delete-product" data-id="' + dat2.id + '"><i class="lni lni-trash-can"></i> Delete</button>';
                    }
    
                    var productRow = '<tr>' +
                        '<td>' + dat2.product_name + '</td>' +
                        '<td>' + dat2.product_model + '</td>' +
                        '<td>' + dat2.serial_number + '</td>' +
                        '<td>' + dat2.selling_price + '</td>' +
                        '<td>' + dat2.purchase_price + '</td>' +
                        '<td>' + dat2.supplier_name + '</td>' +
                        '<td>' + '<img src="./Assets/images/thumbnail_image/' + dat2.product_image + '" alt="' + dat2.product_name + '" title="' + dat2.product_name + '"></img>' + '</td>' +
                        (type_of_user === 'admin' ? '<td>' + actionButtons + '</td>' : '') +
                        '</tr>';
    
                    $('.manage_product_tbody').append(productRow);
                }
            }
        });
    }

  /*   function fetchSubscriptionDetails() {
        var userID = $("#real_hidden_session_id").val();
        $.ajax({
            url: 'billing_system.cfc?method=getSubscriptionDetails',
            type: 'get',
            dataType: 'json',
            data: { 
                userID: userID 
            },
            success: function(result) {
                var container = $('.manage_subscription_body');
                container.empty(); 

                if (result.length > 0) {
                    var html = '';
                    var expirationDate;
                    
                    for (var i = 0; i < result.length; i++) {
                        var item = result[i];
                        expirationDate = new Date(item.ExpirationDate);

                        function formatTime(date) {
                            var hours = date.getHours();
                            var minutes = date.getMinutes();
                            var ampm = hours >= 12 ? 'PM' : 'AM';
                            hours = hours % 12;
                            hours = hours ? hours : 12; // the hour '0' should be '12'
                            minutes = minutes < 10 ? '0' + minutes : minutes;
                            return hours + ':' + minutes + ' ' + ampm;
                        }

                        function updateCountdown() {
                            var now = new Date();
                            var timeDiff = expirationDate - now;
                            var daysRemaining = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
                            var hoursRemaining = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                            var minutesRemaining = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
                            var secondsRemaining = Math.floor((timeDiff % (1000 * 60)) / 1000);

                            var expirationMessage = timeDiff > 0 
                                ? daysRemaining + ' days ' + hoursRemaining + ' hours ' + minutesRemaining + ' minutes ' + secondsRemaining + ' seconds to go' 
                                : 'Expired';

                            $('#countdown-' + item.PlanID).text(expirationMessage);


                  

                            if (timeDiff <= 0 && !notificationShown) {
                                notificationShown = true;
                                $.ajax({
                                    url: 'billing_system.cfc?method=expireSession',
                                    type: 'post',
                                    dataType: 'json',
                                    success: function(result) {
                                        console.log("expired session", result);
                                        Swal.fire({
                                            title: 'Subscription Expired',
                                            text: 'You have already used the free trial. You cannot avail another free trial with this email. Please choose another plan to access all features.',
                                            icon: 'warning',
                                            confirmButtonText: 'OK',
                                            allowOutsideClick: false,
                                            allowEscapeKey: false
                                        }).then((result) => {
                                            if (result.isConfirmed) {
                                                window.location.reload();
                                            }
                                        });

                                        // Handle page clicks and key presses
                                        $(document).on('click keypress', function() {
                                            if (!notificationShown) {
                                                notificationShown = true;
                                                Swal.close();
                                                window.location.reload();
                                            }
                                        });
                                    }
                                });
                            }
                        }

                        html += '<div class="subscription-card">';
                        html += '<h3>' + (item.PlanID > 0 ? 'You have currently ' + item.PlanName + ' Plan' : 'You have no plan') + '</h3>';
                        html += '<p><strong>Cost:</strong> $' + item.Cost.toFixed(2) + '</p>';
                        html += '<p><strong>Start Date:</strong> ' + new Date(item.StartDate).toLocaleDateString() + '</p>';
                        html += '<p><strong>Expiration Date:</strong> ' + expirationDate.toLocaleDateString() + ' at ' + formatTime(expirationDate) + '</p>';
                        html += '<p><strong>Time Remaining:</strong> <span id="countdown-' + item.PlanID + '"></span></p>';
                        html += '<button class="btn btn-warning upgrade_subscription" style="align-items:right; font-weight: bold;">Upgrade Subscription Plan</button>';
                        html += '</div>';
                      
                        html += `<div class="container2_subs" id="container" style="display:none">
                                    <div class="subscription_container_subs">
                                        <h1 class="me-5"><span class="me-3 mb-3" id="back_index_btn2" style="font-size:1.2rem"><i class="lni lni-reply"></i>Back</span>Choose Your Subscription Plan</h1>
                                        <div class="subscription-cards_subs">
                                            <form id="subscriptionForms" method="post" action="process_payment.cfm">
                                                <div class="subscription_card" >
                                                    <h2>Free Trial</h2>
                                                    <p>Duration: 1 Day</p>
                                                    <p>Cost: Free</p>
                                                    <button type="submit" name="plan" value="free_trial" id="subs_btn" class="subs_btn">Free Trial</button>
                                                </div>
                                                <div class="subscription_card" >
                                                    <h2>One Month</h2>
                                                    <p>Duration: 30 Days</p>
                                                    <p>Cost: <i class="lni lni-rupee"></i>30</p>
                                                    <button type="submit" name="plan" value="one_month" id="subs_btn" class="subs_btn">Buy Plan</button>
                                                </div>
                                                <div class="subscription_card" >
                                                    <h2>Six Months</h2>
                                                    <p>Duration: 180 Days</p>
                                                    <p>Cost: <i class="lni lni-rupee"></i>150</p>
                                                    <button type="submit" name="plan" value="six_months" id="subs_btn" class="subs_btn">Buy Plan</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>`
                        

                        container.html(html);
                        setInterval(updateCountdown, 1000);
                    }
                } else {
                    $.ajax({
                        url: 'billing_system.cfc?method=Subscription_Details',
                        type: 'GET',
                        dataType: 'json',
                        data: { userID: userID },
                        success: function(result) {
                            //console.log("Subscription_Details", result);
                            var lastSubDetails = $(".last_susbscription_details");
                            if (result.length > 0) {
                                lastSubDetails.css("display", "block");
                                lastSubDetails.append(`
                                    <p class="last_subs_details"><strong>Last subscription details:</strong> ${result[0].PlanName}, expired on ${new Date(result[0].ExpirationDate).toLocaleDateString()}</p>
                                `);
                            } else {
                                lastSubDetails.css("display", "none");
                            }
                        }
                    });

                    container.html(`<div class="subscription-card" id="no_subs_message">
                        <p class="no_subs_message"><strong>No subscription details found.</strong></p>
                         <div class="last_susbscription_details" style="display:none">
                         </div>
                        <button class="btn btn-success " id="add_subscription">Add Subscription</button>
                        </div>
                        <div class="container2_subs" id="container" style="display:none">
                            <div class="subscription_container_subs">
                                <h1 class="me-5"><span class="me-3 " id="back_index_btn" style="font-size:1.2rem"><i class="lni lni-reply"></i>Back</span>Choose Your Subscription Plan</h1>
                                <div class="subscription-cards_subs">
                                    <form id="subscriptionForms" method="post" action="process_payment.cfm">
                                        <div class="subscription_card" >
                                            <h2>Free Trial</h2>
                                            <p>Duration: 1 Day</p>
                                            <p>Cost: Free</p>
                                            <button type="submit" name="plan" value="free_trial" id="subs_btn" class="subs_btn">Free Trial</button>
                                        </div>
                                        <div class="subscription_card" >
                                            <h2>One Month</h2>
                                            <p>Duration: 30 Days</p>
                                            <p>Cost: <i class="lni lni-rupee"></i>30</p>
                                            <button type="submit" name="plan" value="one_month" id="subs_btn" class="subs_btn">Buy Plan</button>
                                        </div>
                                        <div class="subscription_card" >
                                            <h2>Six Months</h2>
                                            <p>Duration: 180 Days</p>
                                            <p>Cost: <i class="lni lni-rupee"></i>150</p>
                                            <button type="submit" name="plan" value="six_months" id="subs_btn" class="subs_btn">Buy Plan</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>`);
                }
            }
        });
    } */


    function fetchSubscriptionDetails() {
        var userID = $("#real_hidden_session_id").val();
        $.ajax({
            url: 'billing_system.cfc?method=getSubscriptionDetails',
            type: 'get',
            dataType: 'json',
            data: { userID: userID },
            success: function(result) {
                var container = $('.manage_subscription_body');
                container.empty(); 
    
                if (result.length > 0) {
                    var html = '';
                    var notificationShown = false;
                    var ExpireShown = false;
                    var subscriptions = result;
                    var subscriptionInterval;
    
                    function formatTime(date) {
                        var hours = date.getHours();
                        var minutes = date.getMinutes();
                        var ampm = hours >= 12 ? 'PM' : 'AM';
                        hours = hours % 12;
                        hours = hours ? hours : 12; // the hour '0' should be '12'
                        minutes = minutes < 10 ? '0' + minutes : minutes;
                        return hours + ':' + minutes + ' ' + ampm;
                    }
    
                    function updateCountdown(planID, expirationDate) {
                        var now = new Date();
                        var timeDiff = expirationDate - now;
                        var daysRemaining = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
                        var hoursRemaining = Math.floor((timeDiff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                        var minutesRemaining = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
                        var secondsRemaining = Math.floor((timeDiff % (1000 * 60)) / 1000);
    
                        var expirationMessage = timeDiff > 0 
                            ? daysRemaining + ' days ' + hoursRemaining + ' hours ' + minutesRemaining + ' minutes ' + secondsRemaining + ' seconds to go' 
                            : 'Expired';
    
                        $('#countdown-' + planID).text(expirationMessage);
    
                        if (timeDiff <= 0 && !notificationShown&& !ExpireShown) {
                            notificationShown = true;
                            clearInterval(subscriptionInterval);
                            handlePlanExpiration();
                        }
                    }
    
                    function handlePlanExpiration() {
                        console.log("handleSubscription",subscriptions)
                        // Check if there's another plan after the current one
                        var currentIndex = subscriptions.findIndex(plan => plan.ExpirationDate === subscriptions[0].ExpirationDate);
                        var nextPlan = subscriptions[currentIndex + 1];
    
                        if (nextPlan) {
                            Swal.fire({
                                title: 'Subscription Expired',
                                text: 'Your current plan has expired. Enjoy your next plan: ' + nextPlan.PlanName,
                                icon: 'info',
                                confirmButtonText: 'OK',
                                allowOutsideClick: false,
                                allowEscapeKey: false
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    window.location.reload();
                                }
                            });
                        } else {
                            $.ajax({
                                url: 'billing_system.cfc?method=expireSession',
                                type: 'post',
                                dataType: 'json',
                                success: function(result) {
                                    //console.log("expired session", result);
                                    Swal.fire({
                                        title: 'Subscription Expired',
                                        text: 'Your current plan has expired. Please choose another plan to access all features.',
                                        icon: 'warning',
                                        confirmButtonText: 'OK',
                                        allowOutsideClick: false,
                                        allowEscapeKey: false
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            window.location.reload();
                                        }
                                    });

                                    
                                }
                            });
                        }
                        ExpireShown=true;
                    }
    
                    function renderSubscriptions(subscriptions) {
                        subscriptions.forEach(function(item, index) {
                            var expirationDate = new Date(item.ExpirationDate);
                            html += '<div class="subscription-card">';
                            html += '<h3>' + (item.PlanID > 0 ? 'You have currently ' + item.PlanName + ' Plan' : 'You have no plan') + '</h3>';
                            html += '<p><strong>Cost:</strong> $' + item.Cost.toFixed(2) + '</p>';
                            html += '<p><strong>Start Date:</strong> ' + new Date(item.StartDate).toLocaleDateString() + '</p>';
                            html += '<p><strong>Expiration Date:</strong> ' + expirationDate.toLocaleDateString() + ' at ' + formatTime(expirationDate) + '</p>';
                            html += '<p><strong>Time Remaining:</strong> <span id="countdown-' + item.PlanID + '"></span></p>';
                            html += '<button class="btn btn-warning upgrade_subscription" style="align-items:right; font-weight: bold;">Upgrade Subscription Plan</button>';
                            html += '</div>';
                            html += `<div class="container2_subs" id="container" style="display:none">
                            <div class="subscription_container_subs">
                                <h1 class="me-5"><span class="me-3 mb-3" id="back_index_btn2" style="font-size:1.2rem"><i class="lni lni-reply"></i>Back</span>Choose Your Subscription Plan</h1>
                                <div class="subscription-cards_subs">
                                    <form id="subscriptionForms" method="post" action="process_payment.cfm">
                                        <div class="subscription_card" >
                                            <h2>Free Trial</h2>
                                            <p>Duration: 1 Day</p>
                                            <p>Cost: Free</p>
                                            <button type="submit" name="plan" value="free_trial" id="subs_btn" class="subs_btn">Free Trial</button>
                                        </div>
                                        <div class="subscription_card" >
                                            <h2>One Month</h2>
                                            <p>Duration: 30 Days</p>
                                            <p>Cost: <i class="lni lni-rupee"></i>30</p>
                                            <button type="submit" name="plan" value="one_month" id="subs_btn" class="subs_btn">Buy Plan</button>
                                        </div>
                                        <div class="subscription_card" >
                                            <h2>Six Months</h2>
                                            <p>Duration: 180 Days</p>
                                            <p>Cost: <i class="lni lni-rupee"></i>150</p>
                                            <button type="submit" name="plan" value="six_months" id="subs_btn" class="subs_btn">Buy Plan</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>`
                            
                            if (index === 0) {
                                // Start countdown for the first plan
                                subscriptionInterval = setInterval(function() {
                                    updateCountdown(item.PlanID, expirationDate);
                                }, 1000);
                            }
                        });
    
                        container.html(html);
                    }
    
                    renderSubscriptions(subscriptions);
                } else {
                    $.ajax({
                        url: 'billing_system.cfc?method=Subscription_Details',
                        type: 'GET',
                        dataType: 'json',
                        data: { userID: userID },
                        success: function(result) {
                            //console.log("Subscription_Details", result);
                            var lastSubDetails = $(".last_susbscription_details");
                            if (result.length > 0) {
                                lastSubDetails.css("display", "block");
                                lastSubDetails.append(`
                                    <p class="last_subs_details"><strong>Last subscription details:</strong> ${result[0].PlanName}, expired on ${new Date(result[0].ExpirationDate).toLocaleDateString()}</p>
                                `);
                            } else {
                                lastSubDetails.css("display", "none");
                            }
                        }
                    });
                    container.html(`
                        <div class="subscription-card" id="no_subs_message">
                            <p class="no_subs_message"><strong>No subscription details found.</strong></p>
                            <div class="last_susbscription_details" style="display:none"></div>
                            <button class="btn btn-success " id="add_subscription">Add Subscription</button>
                        </div>
                        <div class="container2_subs" id="container" style="display:none">
                            <div class="subscription_container_subs">
                                <h1 class="me-5"><span class="me-3 " id="back_index_btn" style="font-size:1.2rem"><i class="lni lni-reply"></i>Back</span>Choose Your Subscription Plan</h1>
                                <div class="subscription-cards_subs">
                                    <form id="subscriptionForms" method="post" action="process_payment.cfm">
                                        <div class="subscription_card">
                                            <h2>Free Trial</h2>
                                            <p>Duration: 1 Day</p>
                                            <p>Cost: Free</p>
                                            <button type="submit" name="plan" value="free_trial" id="subs_btn" class="subs_btn">Free Trial</button>
                                        </div>
                                        <div class="subscription_card">
                                            <h2>One Month</h2>
                                            <p>Duration: 30 Days</p>
                                            <p>Cost: <i class="lni lni-rupee"></i>30</p>
                                            <button type="submit" name="plan" value="one_month" id="subs_btn" class="subs_btn">Buy Plan</button>
                                        </div>
                                        <div class="subscription_card">
                                            <h2>Six Months</h2>
                                            <p>Duration: 180 Days</p>
                                            <p>Cost: <i class="lni lni-rupee"></i>150</p>
                                            <button type="submit" name="plan" value="six_months" id="subs_btn" class="subs_btn">Buy Plan</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    `);
                }
            }
        });
    }
    
        
    function checkSubscription() {
        var yourUserID = $("#real_hidden_session_id").val();
        $.ajax({
            url: 'billing_system.cfc?method=getSubscriptionDetails',
            type: 'GET',
            data: { userID: yourUserID }, 
            dataType: 'json',
            success: function(response) {
                let notificationMessage = '';
                const currentDate = new Date();
    
                if (response.length > 0) {
                    const lastPlanIndex = response.length - 1; // Get the last plan in the list
                    const expirationDate = new Date(response[lastPlanIndex].ExpirationDate);
                    const daysRemaining = Math.ceil((expirationDate - currentDate) / (1000 * 60 * 60 * 24));
    
                    if (daysRemaining <= 10) {
                        notificationMessage = 'Your subscription plan is about to expire. Please renew soon!';
                        $('#notification-bar').text(notificationMessage).removeClass('hide').addClass('show');
    
                        setTimeout(function() {
                            $('#notification-bar').removeClass('show').addClass('hide');
                        }, 5000);
                    } else {
                        $('#notification-bar').removeClass('show').addClass('hide');
                    }
                } else {
                    $('#notification-bar').removeClass('show').addClass('hide');
                }
            }
        });
    }
    
    setInterval(checkSubscription, 30000); 
    
    
    
    
    
    
    
    
    function fetchViewSales() {
        var hidden_iddd=$("#hidden_secere_userid").val();
        //alert(hidden_iddd)
        $.ajax({
            url: 'billing_system.cfc?method=getSalesData',
            type: 'get',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //alert(result)
                // Clear existing data
                //console.log("viewsalesData",result);
                $('.manage_viewsales_tbody').empty();
    
                // Loop through the result and build table rows
                for (let i = 0; i < result.length; i++) {
                    let dat2 = result[i];
                    //console.log("viewsalesData",dat2);
                    var salesRow = '<tr>' +
                        '<td class="text-center">' + dat2.Product + '</td>' +
                        '<td class="text-center">' + dat2.Quantity + '</td>' +
                        '<td class="text-center">' + dat2.Price + '</td>' +
                        '<td class="text-center">' + dat2.Total + '</td>' +
                        '<td class="text-center">' + dat2.Date + '</td>' +
                        '</tr>';
    
                    $('.manage_viewsales_tbody').append(salesRow);
                }
            }
        });
    }

    function fetchTopProductsData() {
        //alert("Fetching top 5 products");
       // console.log("Fetching top 5 products")
      var hidden_iddd =   $("#real_hidden_Shop_id").val();
      console.log("------",hidden_iddd)
       var Control_ID =Number(hidden_iddd)
        console.log("see here buddy their type", typeof (Control_ID))
        $.ajax({
            url: 'billing_system.cfc?method=getSalesData',
            type: 'get',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                let salesData = {};
                for (let i = 0; i < result.length; i++) {
                    let dat2 = result[i];
                    if (!salesData[dat2.Product]) {
                        salesData[dat2.Product] = {
                            Quantity: 0,
                            Total: 0
                        };
                    }
                    salesData[dat2.Product].Quantity += dat2.Quantity;
                    salesData[dat2.Product].Total += dat2.Total;
                }

                // Convert sales data to an array and sort by total sales
                let salesArray = Object.keys(salesData).map(product => ({
                    Product: product,
                    Quantity: salesData[product].Quantity,
                    Total: salesData[product].Total
                }));

                salesArray.sort((a, b) => b.Total - a.Total);

                // Get top 5 products
                let top5Sales = salesArray.slice(0, 5); 
                createDonutChart(top5Sales);
            }
        });
    }

    function Allcount(){
        var hidden_iddd=$("#real_hidden_Shop_id").val();
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


    function createDonutChart(top5Sales) {
        anychart.onDocumentReady(function () {
            // Map top 5 sales data to AnyChart format
            let data = top5Sales.map(sale => [sale.Product, sale.Total]);

            // create a pie chart with the data
            var chart = anychart.pie(data);
            
            // set the chart radius making a donut chart
            chart.innerRadius('67%');

            // create a color palette
            var palette = anychart.palettes.distinctColors();
            // set the colors according to the brands
            palette.items([
                { color: '#1dd05d' },
                { color: '#000000' },
                { color: '#00a3da' },
                { color: '#156ef2' },
                { color: '#f60000' }
            ]);

            // apply the donut chart color palette
            chart.palette(palette);

            // set the position of labels
     

            // set the position of labels
            chart.labels().format('{%x} — {%value}').fontSize(16);
            chart.labels()
            .position('inside')
            .format('{%x} — {%value}')
            .fontSize(16)
            .fontColor('#333333')
            .hAlign('center')
            .vAlign('middle')
            .background()
            .enabled(true)
             .fill('none'); // dark grey background color
       
            // disable the legend
            chart.legend(false);

            // format the donut chart tooltip
            chart.tooltip().format('Total sales: {%value}');

            // create a standalone label
            var label = anychart.standalones.label();

            // configure the label settings
            label
                .useHtml(true)
                .text(
                    '<span style="color: #313136; font-size:18px;">Top 5 Sales Products</span>' +
                    '<br/><br/><span style="color:#444857; font-size: 14px;"><i>Based on total sales</i></span>'
                )
                .position('center')
                .anchor('center')
                .hAlign('center')

                .vAlign('middle');

            // set the label as the center content
            chart.center().content(label);

            // set container id for the chart
            chart.container('container_piechart11');

            // initiate chart drawing
            chart.draw();
            //let productColorsList = document.getElementById('productColors');
            //productColorsList.innerHTML = '';
       /*      for (let i = 0; i < top5Sales.length; i++) {
                let product = top5Sales[i].Product;
                //let total = top5Sales[i].Total;
                let colorss = palette.itemAt(i);
                alert(colorss)
                let listItem = `<li>${product} <span style="background-color: ${colorss};"></span></li>`;
                productColorsList.innerHTML += listItem;
            } */
            });
            }
    function dailysales_weeklysales(){
        var hidden_iddd=$("#real_hidden_Shop_id").val();
        $.ajax({
        url: 'billing_system.cfc?method=getSalesDataaaa',
        type: 'GET',
        dataType: 'json',
        data:{
            Control_ID:hidden_iddd
        },
        success: function(result) {
            console.log('Sales result:', result);

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
    function fetchInvoices() {
        var hidden_iddd = $("#hidden_secere_userid").val();
        var type_of_user = $("#real_hidden_Type_Of_User").val(); // Retrieve the user type
    
        $.ajax({
            url: `billing_system.cfc?method=getInvoices`,
            type: `GET`,
            dataType: `JSON`,
            data: {
                Control_ID: hidden_iddd
            },
            success: function(result) {
                console.log(result);
                // Clear existing rows
                $('.manage_invoices_tbody').empty();
    
                // Loop through the result and build table rows
                for (let i = 0; i < result.length; i++) {
                    let dat2 = result[i];
                    var actionButtons = '';
    
                    if (type_of_user === 'admin') {

                        actionButtons = '<button class="btn btn-success btn-sm view-invoices me-3" data-id="' + dat2.id + '"><i class="lni lni-eye"></i> View</button>' +
                                        '<button class="btn btn-warning btn-sm edit-invoices me-3" data-id="' + dat2.id + '"><i class="lni lni-pencil"></i> Edit</button>' +
                                        '<button class="btn btn-danger btn-sm delete-invoices" data-id="' + dat2.id + '"><i class="lni lni-trash-can"></i> Delete</button>';
                    } else {
                        actionButtons = '<button class="btn btn-success btn-sm view-invoices me-3" data-id="' + dat2.id + '"><i class="lni lni-eye"></i> View</button>';
                    }
    
                    var salesRow = '<tr>' +
                        '<td class="text-center">' + dat2.id + '</td>' +
                        '<td class="text-center">' + dat2.customerName + '</td>' +
                        '<td class="text-center">' + dat2.invoiceDateTime + '</td>' +
                        '<td class="text-center">' + actionButtons + '</td>' +
                        '</tr>';
    
                    $('.manage_invoices_tbody').append(salesRow);
                }
            }
        });
    }
    
    function monthysalesreport(){
        var hidden_iddd=$("#real_hidden_Shop_id").val();
        $.ajax({
        url: 'billing_system.cfc?method=getMonthlySalesData', // Change the method to your actual CFC method
        type: 'GET',
        dataType: 'json',
        data:{
            Control_ID:hidden_iddd
        },
        success: function(result) {
            console.log('Sales result report:', result);

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
                      .stroke("2 #fff");

                // Customize the line appearance
                series.stroke({
                    color: "#00f", // Line color
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

    window.fetchSelectInvoiceProduct = function(productSelectId, selectedProductId) {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=getProduct',
            method: 'GET',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                const productSelect = $(`#${productSelectId}`);
                productSelect.empty(); // Clear any existing options
                productSelect.append('<option value="0">Select Product</option>'); // Add the default option
    
                result.forEach(product => {
                    let option = `<option value="${product.id}" data-unit-price="${product.selling_price}" data-tax="${product.tax_amount}%" data-stock="${product.product_name} = ${product.total_stock}">${product.product_name}</option>`;
                    productSelect.append(option);
                });
    
                // Set the selected product
                if(selectedProductId ){
                    productSelect.val(selectedProductId);
                }
         
    
                // Add change event listener to update unit price and tax
                productSelect.on('change', function() {
                    const selectedProduct = $(this).find('option:selected');
                    const unitPrice = selectedProduct.data('unit-price');
                    const tax = selectedProduct.data('tax');
                    const stock = selectedProduct.data('stock');
                    const rowId = $(this).attr('id').replace('productSelect', '');
                    $(`#itemRow${rowId} .unitPrice`).val(unitPrice);
                    $(`#itemRow${rowId} .tax`).val(tax);
                    $(`#available_stock`).val(stock); 
                });
            },
            error: function(xhr, status, error) {
                console.error("Error: ", status, error);
            }
        });
    };
    

    // Add a new invoice item row
    function previousStock(){
        var selectedproduct=$(".Product_select").val();
        var hidden_iddd=$("#hidden_secere_userid").val();
        if(selectedproduct > 0){
            $.ajax({
                url:'billing_system.cfc?method=getProduct',
                method:'GET',
                dataType:'json',
                data:{
                    Control_ID:hidden_iddd
                },
                success: function(result){
                    var selectedproduct=$(".Product_select").val();
                    console.log("selectedproduct",selectedproduct);
                    FetchPreviouStock(selectedproduct);
                }
            })
        }
        else{
            $(`#available_stock`).val('');
        }

    }
    function FetchPreviouStock(id){
        //alert(id)
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url:'billing_system.cfc?method=getProductStock',
            method:'GET',
            dataType:'json',
            data:{
                id:id,
                Control_ID:hidden_iddd
            },
            success: function(result){
                if (result.length > 0) {
                    var stock = result[0]; // Assuming the result is an array and we take the first element
                  
                    $(`#available_stock`).val(stock.product_name+"="+stock.total_stock);}

                
            }
        })
    }


  

    
    function fetch_Select_Categories(callback) {
        var hidden_iddd=$("#hidden_secere_userid").val();

        $.ajax({
            url: 'billing_system.cfc?method=selectCategory',
            method: 'GET',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log("Categories fetched:", result);
                var categorySelect = $("#category_select");
                //console.log("Categories length:", categorySelect.length);
                if (categorySelect.length === 0) {
                    console.error("Category select element not found.");
                    return;
                }
                categorySelect.empty(); // Clear any existing options
                categorySelect.append('<option value="0">Please choose Category</option>'); // Add the default option
                for (let i = 0; i < result.length; i++) {
                    let dat4 = result[i];
                    //console.log(dat4);
                    //console.log(dat4.category_name);
                    categorySelect.append(`<option value="${dat4.id}">${dat4.category_name}</option>`);
                    //console.log("Categories length:", categorySelect.length);
                }
                if (typeof callback === "function") {
                    callback();
                    
                }
                categorySelect.on('change', function() {
                    var selectedCategoryId = $(this).val();
                    //alert(selectedCategoryId)
                    
                    if (selectedCategoryId != 0) {
                        fetch_Select_Sub_catgeory_addproduct(selectedCategoryId);
                    } else {
                        $("#addproduct_sub_category_select").empty().append('<option value="0">Please choose Sub-Category</option>');
                    }
                });
            }
        });
    }
    function fetch_Select_Unit(callback) {
        var hidden_iddd=$("#hidden_secere_userid").val();

        $.ajax({
            url: 'billing_system.cfc?method=selectUnit',
            method: 'GET',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log("Unit fetched:", result);
                var unitselect = $("#unit_select");
                //console.log("Unit length:", unitselect.length);
                if (unitselect.length === 0) {
                    console.error("Unit select element not found.");
                    return;
                }
                unitselect.empty(); // Clear any existing options
                unitselect.append('<option value="0">Please choose Unit</option>'); // Add the default option
                for (let i = 0; i < result.length; i++) {
                    let dat4 = result[i];
                    //console.log(dat4);
                   // console.log(dat4.unit_name);
                    unitselect.append(`<option value="${dat4.id}">${dat4.unit_name}</option>`);
                    //console.log("Unit length:", unitselect.length);
                }
                if (typeof callback === "function") {
                    callback();
                }
            }
        });
    }
    function fetch_Select_Taxes(callback) {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=selectTax',
            method: 'GET',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log("Taxes fetched:", result);
                var taxselect = $("#tax_select");
                //console.log("Taxes length:", taxselect.length);
                if (taxselect.length === 0) {
                    console.error("Tax select element not found.");
                    return;
                }
                taxselect.empty(); // Clear any existing options
                taxselect.append('<option value="0">Please choose Tax</option>'); // Add the default option
                for (let i = 0; i < result.length; i++) {
                    let dat4 = result[i];
                    //console.log(dat4);
                   // console.log(dat4.tax_amount);
                    taxselect.append(`<option value="${dat4.id}">${dat4.tax_amount}</option>`);
                    //console.log("Taxes length:", taxselect.length);
                }
                if (typeof callback === "function") {
                    callback();
                }
            }
        });
    }
    function fetch_Select_Supplier(callback) {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=selectSupplier',
            method: 'GET',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log("Suppliers fetched:", result);
                var supplierselect = $("#supplier_select");
                //console.log("Suppliers length:", supplierselect.length);
                if (supplierselect.length === 0) {
                    console.error("Supplier select element not found.");
                    return;
                }
                supplierselect.empty(); // Clear any existing options
                supplierselect.append('<option value="0">Please choose Supplier</option>'); // Add the default option
                for (let i = 0; i < result.length; i++) {
                    let dat4 = result[i];
                    //console.log(dat4);
                    //console.log(dat4.supplier_name);
                    supplierselect.append(`<option value="${dat4.id}">${dat4.supplier_name}</option>`);
                    //console.log("Supplier length:", supplierselect.length);
                }
                if (typeof callback === "function") {
                    callback();
                }
            }
        });
    }
    function fetch_Select_Sub_catgeory_addproduct(categoryId,callback) {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=selectSubCategoryInCategory',
            method: 'GET',
            dataType: 'json',
            data: { 
                categoryId: categoryId,
                Control_ID:hidden_iddd 
            },
            success: function(result) {
                var subCategorySelect = $("#addproduct_sub_category_select");
                subCategorySelect.empty(); // Clear existing options
                if (result.length === 0) {
                    subCategorySelect.append('<option value="0">No sub-category in this category</option>');
                } else {
                    subCategorySelect.append('<option value="0">Please choose Sub-Category</option>'); // Add default option
                    for (let i = 0; i < result.length; i++) {
                        let subCategory = result[i];
                        subCategorySelect.append(`<option value="${subCategory.id}">${subCategory.sub_category_name}</option>`);
                    }
                }
                if (typeof callback === "function") {
                    callback();
                }
            }
        });
    }
    function fetch_Select_sub_Categories(callback) {
        var hidden_iddd=$("#hidden_secere_userid").val();
        $.ajax({
            url: 'billing_system.cfc?method=selectCategory',
            method: 'GET',
            dataType: 'json',
            data:{
                Control_ID:hidden_iddd
            },
            success: function(result) {
                //console.log("Categories fetched:", result);
                var categorySelect = $("#choose_category");
               // console.log("Categories length:", categorySelect.length);
                if (categorySelect.length === 0) {
                    console.error("Category select element not found.");
                    return;
                }
                categorySelect.empty(); // Clear any existing options
                categorySelect.append('<option value="0">Please choose Category</option>'); // Add the default option
                for (let i = 0; i < result.length; i++) {
                    let dat4 = result[i];
                   // console.log(dat4);
                   // console.log(dat4.category_name);
                    categorySelect.append(`<option value="${dat4.id}">${dat4.category_name}</option>`);
                    //console.log("Categories length:", categorySelect.length);
                }
                if (typeof callback === "function") {
                    callback();
                }
            }
        });
    }
    function fetchProfileValue() {
        var hiodden_iddd=$("#real_hidden_session_id").val();
       
       
        $.ajax({
            url: 'billing_system.cfc?method=getProfile',
            type: 'get',
            dataType: 'json',
            data: {
                user_id: hiodden_iddd
            },
            success: function(result) {
                console.log("here result",result)

                for(i=0;i<result.length>0;i++){
                    var dat=result[i];
                    console.log("here result",dat)
                    $('#userNames').val(dat.userName);
                    $('#shopName').val(dat.shopName);
                    $('#email').val(dat.email);
                    $('#password').val(dat.password); 
                    $('#currentImageName_ShopLogo').val(dat.shopLogo)
                    $('#currentImageName_ShopLogo').text("Current Shop Logo : " + dat.shopLogo)
                    
                  

                    
                    $('#mobileNumber').val(dat.MobileNumber);
                  

                    $('#currentShopLogo').html('<img src="./Assets/images/original_image/' + dat.shopLogo + '" title="Shop Logo :' + dat.shopLogo + ' " alt="Shop Logo" style="max-width: 100px; max-height: 100px;">');

                    console.log("Profile Image Name from database:", dat.ProfileImageName);

                    var profileImage = dat.ProfileImageName ? dat.ProfileImageName : 'account.png';
                    console.log("Using Profile Image:", profileImage);
                    
                    $('#currentProfileImage').html('<img src="./Assets/images/original_image/' + profileImage + '?t=' + new Date().getTime() + '" title="Profile Image : ' + profileImage + '" alt="Profile Image" style="max-width: 100px; max-height: 100px;">');
                    $('#currentImageName_ProfileImage').text("Current Profile Image : " + profileImage);
                    $('#currentImageName_ProfileImage').val(dat.ProfileImageName);
                    
                    //var cpi= $('#currentImageName_ProfileImage').val()
                   // alert(cpi)
                      
             
                }
               
        
            }
        });
        
    }

    function fetchCustomerDetails() {
        var hidden_iddd = $("#hidden_secere_userid").val();
    
        $.ajax({
            url: 'billing_system.cfc?method=getCustomerDetails',
            type: 'get',
            dataType: 'json',
            data: {
                Control_ID: hidden_iddd
            },
            success: function(result) {
                // Clear existing data
                $('.manage_customer_tbody').empty();
    
                // Loop through the result and build table rows
                for (let i = 0; i < result.length; i++) {
                    let dat2 = result[i];
                    var customerRow = '<tr>' +
                        '<td class="text-center">' + dat2.Date + '</td>' +
                        '<td class="text-center">' + dat2.CustomerName + '</td>' +
                        '<td class="text-center">' + dat2.PurchaseProducts + '</td>' +
                        '<td class="text-center">' + dat2.PurchaseAmount.toFixed(2) + '</td>' +
                        '<td class="text-center">' + dat2.InvoiceID + '</td>' +
                        '</tr>';
    
                    $('.manage_customer_tbody').append(customerRow);
                }
            }
        });
    }
    function fetchProfitData() {
        var hidden_iddd = $("#real_hidden_Shop_id").val();
        $.ajax({
            url: 'billing_system.cfc?method=getProfitData',
            type: 'GET',
            dataType: 'json',
            data: {
                Control_ID: hidden_iddd
            },
            success: function(result) {
                console.log("Received result:", result);
    
                // Prepare data for charts
                let profitData = [
                    {x: "Today", value: parseFloat(result.TODAYPROFIT) || 0},
                    {x: "Yesterday", value: parseFloat(result.YESTERDAYPROFIT) || 0},
                    {x: "This Week", value: parseFloat(result.THISWEEKPROFIT) || 0},
                    {x: "Last Week", value: parseFloat(result.LASTWEEKPROFIT) || 0},
                    {x: "This Month", value: parseFloat(result.THISMONTHPROFIT) || 0},
                    {x: "Last Month", value: parseFloat(result.LASTMONTHPROFIT) || 0},
                    {x: "This Year", value: parseFloat(result.THISYEARPROFIT) || 0},
                    {x: "Last Year", value: parseFloat(result.LASTYEARPROFIT) || 0}
                ];
                
                // Log the profit data to verify it's correctly prepared
                console.log("Profit Data for Chart:", profitData);
    
                // Render the profit charts
                anychart.onDocumentReady(function() {
                    // Profit Comparison Chart
                    const profitComparisonChart = anychart.column();
                    profitComparisonChart.data(profitData);
                    profitComparisonChart.title("Profit Comparison");
                    profitComparisonChart.tooltip().format("Profit Amount: {%value}");
                    profitComparisonChart.container("profitComparisonChart");
                    profitComparisonChart.draw();
                });
            }
        });
    }
    function fetchInvoiceDetails(filter) {
        var hidden_iddd = $("#real_hidden_Shop_id").val();
        $.ajax({
            url: 'billing_system.cfc?method=getInvoiceDetails',
            type: 'GET',
            dataType: 'json',
            data: {
                Control_ID: hidden_iddd,
                filter: filter
            },
            success: function(result) {
                let tableBody = $('.invoice_profit_details_tbody');
                tableBody.empty(); // Clear existing rows
    
                // Check if result is empty
                if (result.length === 0) {
                    // Add a row with a message indicating no sales
                    let noSalesRow = `<tr>
                        <td colspan="10" class="text-center">${filter}, no sales found.</td>
                    </tr>`;
                    tableBody.append(noSalesRow);
                } else {
                    // Process and add rows as usual
                    result.forEach(function(invoice) {
                        // Convert the DateTime string to a Date object
                        let date = new Date(invoice.DateTime);
                        // Format the date to 'YYYY-MM-DD'
                        let formattedDate = date.toISOString().split('T')[0];
    
                        let row = `<tr>
                            <td class="text-center">${invoice.invoiceID}</td>
                            <td class="text-center">${formattedDate}</td>
                            <td class="text-center">${invoice.productName}</td>
                            <td class="text-center">${invoice.purchasePrice}</td>
                            <td class="text-center">${invoice.sellingPrice}</td>
                            <td class="text-center">${invoice.totalPurchaseAmount}</td>
                            <td class="text-center">${invoice.discountAmount}</td>
                            <td class="text-center">${invoice.taxAmount}</td>
                            <td class="text-center">${invoice.quantity}</td>
                            <td class="text-center">${invoice.profitAmount}</td>
                        </tr>`;
                        tableBody.append(row);
                    });
                }
            }
        });
    }
    function fetchStockData() {
         var hidden_iddd = $("#real_hidden_Shop_id").val();
        $.ajax({
            url: 'billing_system.cfc?method=getStockss',
            type: 'GET',
            dataType: 'json',
            data:{userID:hidden_iddd},
            success: function(result) {
                // Clear existing data
                $('#stockTable tbody').empty();
    
                // Loop through the result data and build table rows
                for (let i = 0; i < result.length; i++) {
                    let item = result[i];
                    var stockRow = '<tr>' +
                        '<td>' + item.product_name + '</td>' +
                        '<td>' + item.total_stock + '</td>' +
                        '<td><button class="btn btn-success add-stock-btn" data-product-id="' + item.id + '" data-product-name="' + item.product_name + '" data-current-stock="' + item.total_stock + '">Add Stock</button></td>' +
                        '</tr>';
    
                    $('#stockTable tbody').append(stockRow);
                }
            },
            error: function() {
                alert('An error occurred while loading stock data');
            }
        });
    }
    function showLowStockAlert() {
        checkLowStock(); 
        setInterval(checkLowStock, 60000); 
    }
    function checkLowStock() {
         var hidden_iddd = $("#real_hidden_Shop_id").val();
        $.ajax({
            url: 'billing_system.cfc?method=getStockss',
            type: 'GET',
            dataType: 'json',
            data:{userID:hidden_iddd},
            success: function(result) {
                var lowStockCount = 0;
                var lowStockProducts = [];

                for (let i = 0; i < result.length; i++) {
                    if (result[i].total_stock < 10) {
                        lowStockCount++;
                        lowStockProducts.push(result[i].product_name);
                    }
                }

                if (lowStockCount > 0) {
                    $('#lowStockToast .toast-body').html('Warning: ' + lowStockCount + '  product(s) have stock levels lower than 10: ' + lowStockProducts.join(', ') +   ' <a href="#" id="addStockLink" class="text-warning font-weight-bold">Add Stock</a>');
                    $('#lowStockToast').toast('show');
                } else {
                    $('#lowStockToast').toast('hide');
                }
            }
        });
    }
    showLowStockAlert();
    $('.close').click(function() {
        $('#lowStockToast').toast('hide');
    });
    $(document).on('click', '#addStockLink', function(event) {
        event.preventDefault(); 
        loadContent('stock');   
        fetchStockData();      
        $('#lowStockToast').toast('hide');
    });
    
    
    
    
    
    
    
 

    $(document).on('click', '.delete-tax', function() {
        var id = $(this).data('id');
        var taxRow = $(this).closest('tr');

        $.ajax({
            url: 'billing_system.cfc?method=deleteTax',
            type: 'post',
            data: {
                id: id
            },
            success: function(response) {
                alert("Are you sure to delete this");
                taxRow.remove();
                alert(response);
            }
        });
    });
    $(document).on('click', '.edit-tax', function() {
        var id = $(this).data('id');
        var taxRow = $(this).closest('tr');
        var taxAmount = taxRow.find('td').eq(0).text();
        var status = taxRow.find('td').eq(1).text();

        loadContent('add_tax');
        $('#tax_amount').val(taxAmount);
        $('#status').val(status);

        // Ensure to pass both tax_amount and status parameters to the updateTax function
        $(document).off('click', '#add_tax_btn').on('click', '#add_tax_btn', function() {
            var updatedTaxAmount = $('#tax_amount').val();
           // Ensure this is capturing the correct value

            $.ajax({
                url: 'billing_system.cfc?method=updateTax',
                type: 'post',
                data: {
                    id: id,
                    tax_amount: updatedTaxAmount,
                    status: status // Ensure this is being sent
                },
                success: function(response) {
                    alert(response);
                    loadContent('manage_tax');
                    fetchTaxes();
                }
            });
        });
    });
    $(document).on('click', '.add_new_tax_page', function() {
        loadContent('add_tax');
    });
    $(document).on('click', '.manage_tax_page', function() {
        loadContent('manage_tax');
        fetchTaxes();
    });

    $(document).on('click', '.edit-category', function() {
        var id = $(this).data('id');
        var categoryRow = $(this).closest('tr');
        var category_name = categoryRow.find('td').eq(0).text();
        var status = categoryRow.find('td').eq(1).text();

        loadContent('add_category');
        $('#category_name').val(category_name);
        $('#status').val(status);

        // Ensure to pass both tax_amount and status parameters to the updateTax function
        $(document).off('click', '.add_category_btn').on('click', '.add_category_btn', function() {
            var updatedcategory_name = $('#category_name').val();
           // Ensure this is capturing the correct value

            $.ajax({
                url: 'billing_system.cfc?method=updateCategory',
                type: 'post',
                data: {
                    id: id,
                    category_name: updatedcategory_name,
                    status: status // Ensure this is being sent
                },
                success: function(response) {
                    alert(response);
                    loadContent('manage_category');
                    fetchCategory();
                }
            });
        });
    });
    $(document).on('click', '.delete-category', function() {
        var id = $(this).data('id');
        var categoryRow = $(this).closest('tr');

        $.ajax({
            url: 'billing_system.cfc?method=deleteCategory',
            type: 'post',
            data: {
                id: id
            },
            success: function(response) {
                alert("Are you sure to delete this");
                categoryRow.remove();
                alert(response);
            }
        });
    });
    $(document).on('click', '.add_category_page', function() {
        loadContent('add_category');
    });
    $(document).on('click', '.manage_category_page', function() {
        loadContent('manage_category');
        fetchCategory();
    });

    $(document).on('click', '.edit-unit', function() {
        var id = $(this).data('id');
        var unitRow = $(this).closest('tr');
        var unit_name = unitRow.find('td').eq(0).text();
        var status = unitRow.find('td').eq(1).text();

        loadContent('add_unit');
        $('#unit_name').val(unit_name);
        $('#status').val(status);

        // Ensure to pass both tax_amount and status parameters to the updateTax function
        $(document).off('click', '#add_unit_btn').on('click', '#add_unit_btn', function() {
            var updatedunit_name = $('#unit_name').val();
           // Ensure this is capturing the correct value

            $.ajax({
                url: 'billing_system.cfc?method=updateUnit',
                type: 'post',
                data: {
                    id: id,
                    unit_name: updatedunit_name,
                    status: status // Ensure this is being sent
                },
                success: function(response) {
                    alert(response);
                    loadContent('manage_unit');
                    fetchUnit();
                }
            });
        });
    });
    $(document).on('click', '.delete-unit', function() {
        var id = $(this).data('id');
        var unitRow = $(this).closest('tr');

        $.ajax({
            url: 'billing_system.cfc?method=deleteUnit',
            type: 'post',
            data: {
                id: id
            },
            success: function(response) {
                alert("Are you sure to delete this");
                unitRow.remove();
                alert(response);
            }
        });
    });
    $(document).on('click', '.add_unit_page', function() {
        loadContent('add_unit');
    });
    $(document).on('click', '.manage_unit_page', function() {
        loadContent('manage_unit');
        fetchUnit();
    });

    $(document).on('click', '.edit-supplier', function() {
        var id = $(this).data('id');
         $.ajax({
            url: 'billing_system.cfc?method=getSupplierById',
            type: 'get',
            dataType: 'json',
            data: { id: id },
            success: function(result) {
                console.log(result);
                loadContent('add_supplier');
                if (result.length > 0) {
                    var supplier = result[0]; // Assuming the result is an array and we take the first element
                  
                    $('#supplierName').val(supplier.supplier_name);
                    $('#contact').val(supplier.contact);
                    $('#address').val(supplier.address);
                    $('#details').val(supplier.details);
                    $('#creditBalance').val(supplier.credit_balance);
            
                    // Show the save changes button and hide the add button
                    $('#add_supplier_btn').hide();
                    $('#saveSupplierBtn').show();
                } else {
                    alert('Supplier not found'); // Handle case where no supplier is returned
                }
                // Update supplier details on save button click
                $(document).off('click', '#saveSupplierBtn').on('click', '#saveSupplierBtn', function() {
                    var updated_supplier_name = $('#supplierName').val();
                    var updated_contact = $('#contact').val();
                    var updated_address = $('#address').val();
                    var updated_details = $('#details').val();
                    var updated_credit_balance = $('#creditBalance').val();
    
                    // Validation checks
                    if (updated_supplier_name === '') {
                        alert('Please enter a Supplier name.');
                        return;
                    }
                    if (updated_contact === '') {
                        alert('Please enter a contact.');
                        return;
                    }
                    if (updated_address === '') {
                        alert('Please enter an address.');
                        return;
                    }
                    if (updated_details === '') {
                        alert('Please enter details.');
                        return;
                    }
    
                    $.ajax({
                        url: 'billing_system.cfc?method=updateSupplier',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            id: id,
                            supplier_name: updated_supplier_name,
                            contact: updated_contact,
                            address: updated_address,
                            details: updated_details,
                            credit_balance: updated_credit_balance
                        },
                        success: function(response) {
                            // Hide the save changes button and show the add button
                            $('#saveSupplierBtn').hide();
                            $('#add_supplier_btn').show();
    
                            // Refresh the supplier list or provide feedback to the user
                            alert('Supplier updated successfully.');
                            $('#supplierName').val('');
                            $('#contact').val('');
                            $('#address').val('');
                            $('#details').val('');
                            $('#creditBalance').val('');
                            loadContent('manage_supplier');
                            fetchSupplier(); // Refresh the supplier list
                        }
                    });
                });
            }
        });
    });
    $(document).on('click', '.delete-supplier', function() {
        var id = $(this).data('id');
        var supplierRow = $(this).closest('tr');

        $.ajax({
            url: 'billing_system.cfc?method=deleteSupplier',
            type: 'post',
            data: {
                id: id
            },
            success: function(response) {
                alert("Are you sure to delete this");
                supplierRow.remove();
                alert(response);
            }
        });
    });
    $(document).on('click', '.add_supplier_page', function() {
        loadContent('add_supplier');
    });
    $(document).on('click', '.manage_supplier_page', function() {
        loadContent('manage_supplier');
        fetchSupplier();
    });

    $(document).on('click', '.edit-sub-category', function() {
       
        var id = $(this).data('id');
        alert(id);
        $.ajax({
            url: 'billing_system.cfc?method=getSubCategoryById',
            type: 'get',
            dataType: 'json',
            data: { id: id },
            success: function(result) {
                alert(JSON.stringify(result)); // Show the JSON result as a string
                console.log("sub_Catgeory ", result);
                console.log("length ", result.length);
                console.log("Result: ", result); // Debugging step
              
    
                loadContent('add_sub_category');
                if (result.DATA && result.DATA.length > 0) {
                    var subcategory = result.DATA[0];
                    console.log("Sub Category:", subcategory);
    
                    fetch_Select_sub_Categories(function() {
                        $('#choose_category').val(subcategory[1]);
                        $('#sub_category_name').val(subcategory[3]);
                        $('#status').val(subcategory[2]);
                        $('.add_sub_category_btn').hide();
                        $('#saveSubCategoryBtn').show();
                    });
                } 
            
               /*  if (result.length > 0) {
                    var subcategory = result[0]; 
               
                    console.log("Sub Category:", subcategory);

                    var categorySelect = $("#choose_category");
                    if (categorySelect.length === 0) {
                        console.error("Category select element not found.");
                        return;
                    }
    
                    console.log("Category options:", categorySelect.find('option').length); // Log options length
    
                    // Find the option with matching category_id and set as selected
                    var selectedCategoryId = subcategory.category_id;
                    var selectedCategoryName= subcategory.category_name;
                    console.log("selectedCategoryId",selectedCategoryId)
                    console.log("selectedCategoryName",selectedCategoryName)
                    categorySelect.val(selectedCategoryId);
                    //$('#choose_category').prop("value",selectedCategoryId);
                    fetch_Select_sub_Categories();
                    $('#choose_category').val(subcategory.category_id);
          
                    $('#sub_category_name').val(subcategory.sub_category_name);
                    $('#status').val(subcategory.status);
    
                    $('.add_sub_category_btn').hide();
                    $('#saveSubCategoryBtn').show();
                } else {
                    alert('Sub Category not found');
                } */
    
                $(document).off('click', '#saveSubCategoryBtn').on('click', '#saveSubCategoryBtn', function() {
                    var Update_CategoryId = $('#choose_category').val();
                    var Update_CategoryName = $('#choose_category option:selected').text();
                    
                    var updated_sub_category_name = $('#sub_category_name').val();
                    var updated_status = 'Active'; 
    
                    if (Update_CategoryId === '') {
                        alert('Please enter a category.');
                        return;
                    }
                    if (updated_sub_category_name === '') {
                        alert('Please enter a sub-category name.');
                        return;
                    }
    
                    $.ajax({
                        url: 'billing_system.cfc?method=updateSubCategory',
                        type: 'post',
                        dataType: 'json',
                        data: {
                            id: id,
                            Update_CategoryId: Update_CategoryId,
                            Update_CategoryName:Update_CategoryName,
                            updated_sub_category_name: updated_sub_category_name,
                            updated_status: updated_status
                        },
                        success: function(response) {
                            $('#saveSubCategoryBtn').hide();
                            $('.add_sub_category_btn').show();
    
                            alert('Sub category updated successfully.');
                            $('#choose_category').val('');
                            $('#sub_category_name').val('');
                            $('#status').val('');
    
                            loadContent('manage_sub_category');
                            fetchSubCategory(); 
                        }
                    });
                });
            }
        });
    });
    $(document).on('click', '.delete-sub-category', function() {
        var id = $(this).data('id');
        var categoryRow = $(this).closest('tr');

        $.ajax({
            url: 'billing_system.cfc?method=deleteSubCategory',
            type: 'post',
            data: {
                id: id
            },
            success: function(response) {
                alert("Are you sure to delete this");
                categoryRow.remove();
                alert(response);
            }
        });
    });
    $(document).on('click', '.add_sub_category_page', function() {
        loadContent('add_sub_category');
    });
    $(document).on('click', '.manage_sub_category_page', function() {
        loadContent('manage_sub_category');
        fetchSubCategory();
    });

    $(document).on('click', '.edit-product', function() {
        var id = $(this).data('id');
        currentProductId = id; // Store the current product ID
        console.log("Edit button clicked, product ID:", id); // Debug log
    
        $.ajax({
            url: 'billing_system.cfc?method=getProductById',
            type: 'get',
            dataType: 'json',
            data: { id: id },
            success: function(result) {
                console.log("Product details fetched:", result); // Debug log
                if (result.length > 0) {
                    var product = result[0];
                    loadContent('add_product');
    
                    // Populate form fields with product details
                    $("#productName").val(product.product_name);
                    $("#serialNumber").val(product.serial_number);
                    $("#productModel").val(product.product_model);
                    $("#sellingPrice").val(product.selling_price);
                    $("#totalstock").val(product.total_stock);
                    $("#purchase_price").val(product.purchase_price);
    
                    // Fetch and populate select fields
                    fetch_Select_Categories(function() {
                        $("#category_select").val(product.category_id);
                        if (product.category_id != 0) {
                            fetch_Select_Sub_catgeory_addproduct(product.category_id, function() {
                                $("#addproduct_sub_category_select").val(product.sub_category_id);
                            });
                        } else {
                            $("#addproduct_sub_category_select").empty().append('<option value="0">Please choose Sub-Category</option>');
                        }
                    });
                    fetch_Select_Unit(function() {
                        $("#unit_select").val(product.unit_id);
                    });
                    fetch_Select_Taxes(function() {
                        $("#tax_select").val(product.tax_id);
                    });
                    fetch_Select_Supplier(function() {
                        $("#supplier_select").val(product.supplier_id);
                    });
    
                    // Display current image name if available
                    if (product.product_image) {
                        $('#currentImageName').text('Current Image: ' + product.product_image);
                    } else {
                        $('#currentImageName').text('No image uploaded.');
                    }
    
                    // Show appropriate buttons
                    $('.add-product-btn').hide();
                    $('#saveProductBtn').show();
    
                    // Handle update button click
                    $(document).off('click', '#saveProductBtn').on('click', '#saveProductBtn', function() {
                        var productname = $("#productName").val();
                        var serialnumber = $("#serialNumber").val();
                        var productmodel = $("#productModel").val();
                        var categoryselect = $("#category_select").val();
                        var selectedcategoryname = $('#category_select option:selected').text();
                        var sellingprice = $("#sellingPrice").val();
                        var unitselect = $("#unit_select").val();
                        var selectedunitname = $('#unit_select option:selected').text();
                        var taxselect = $("#tax_select").val();
                        var selectedtaxamount = $('#tax_select option:selected').text();
                        var supplierselect = $("#supplier_select").val();
                        var selectedsupplier = $('#supplier_select option:selected').text();
                        var totalstock = $("#totalstock").val();
                        var purchaseprice = $("#purchase_price").val();
                        var subcategoryselect = $("#addproduct_sub_category_select").val();
                        var selectedsubcategory = $('#addproduct_sub_category_select option:selected').text();
                        var productimage = $("#productImage")[0].files[0];
    
                        // Form validation
                        if (productname === '') {
                            alert("Please enter product name.");
                            return;
                        }
                        if (serialnumber === '') {
                            alert("Please enter serial number.");
                            return;
                        }
                        if (categoryselect === '0') {
                            alert("Please choose a category.");
                            return;
                        }
                        if (productmodel === '') {
                            alert("Please enter product model.");
                            return;
                        }
                        if (sellingprice === '') {
                            alert("Please enter selling price.");
                            return;
                        }
                        if (unitselect === '0') {
                            alert("Please choose a unit.");
                            return;
                        }
                        if (taxselect === '0') {
                            alert("Please choose a tax.");
                            return;
                        }
                        if (supplierselect === '0') {
                            alert("Please choose a supplier.");
                            return;
                        }
                        if (totalstock === '') {
                            alert("Please enter stock.");
                            return;
                        }
                        if (purchaseprice === '') {
                            alert("Please enter purchase price.");
                            return;
                        }
                        if (subcategoryselect === '0') {
                            alert("Please choose a subcategory.");
                            return;
                        }
    
                        var formData = new FormData();
                        formData.append("id", currentProductId); // Pass the id here
                        formData.append("productname", productname);
                        formData.append("serialnumber", serialnumber);
                        formData.append("productmodel", productmodel);
                        formData.append("categoryselect", categoryselect);
                        formData.append("selectedcategoryname", selectedcategoryname);
                        formData.append("sellingprice", sellingprice);
                        formData.append("unitselect", unitselect);
                        formData.append("selectedunitname", selectedunitname);
                        formData.append("taxselect", taxselect);
                        formData.append("selectedtaxamount", selectedtaxamount);
                        formData.append("supplierselect", supplierselect);
                        formData.append("selectedsupplier", selectedsupplier);
                        formData.append("totalstock", totalstock);
                        formData.append("purchaseprice", purchaseprice);
                        formData.append("subcategoryselect", subcategoryselect);
                        formData.append("selectedsubcategory", selectedsubcategory);
                        if ($("#productImage")[0].files.length > 0) {
                            formData.append("productimage", productimage);
                        } else {
                            formData.append("productimage", ""); // Append an empty string if no file is selected
                        }
    
                        // Debugging the FormData
                        for (var pair of formData.entries()) {
                            console.log(pair[0] + ': ' + pair[1]); // Log each key-value pair
                        }
    
                        $.ajax({
                            url: 'billing_system.cfc?method=updateProduct',
                            type: 'POST',
                            data: formData,
                            contentType: false,
                            processData: false,
                            dataType: 'json', // Expecting a JSON response
                            success: function(result) {
                                $('#saveProductBtn').hide();
                                $('.add-product-btn').show();
                                alert(result.message || "Product updated successfully");
                                // Clear form fields after successful update
                                $("#productName").val('');
                                $("#serialNumber").val('');
                                $("#productModel").val('');
                                $("#category_select").val('0');
                                $("#sellingPrice").val('');
                                $("#unit_select").val('0');
                                $("#tax_select").val('0');
                                $("#supplier_select").val('0');
                                $("#totalstock").val('');
                                $("#purchase_price").val('');
                                $("#addproduct_sub_category_select").val('0');
                                $("#productImage").val('');
                                $('#currentImageName').text('');
    
                                // Refresh product list or do other necessary actions
                                fetchProduct();
                            },
                            error: function(xhr, status, error) {
                                console.log("AJAX Error:", error); // Debug log
                                alert("Error: " + error);
                            }
                        });
                    });
    
                    // Hide current image name on file input change
                    $('#productImage').on('change', function() {
                        $('#currentImageName').hide();
                    });
                }
            },
            error: function(xhr, status, error) {
                console.log("Error fetching product details:", error); // Debug log
                alert("Error fetching product details: " + error);
            }
        });
    });
    $(document).on('click', '.delete-product', function() {
        var id = $(this).data('id');
        var supplierRow = $(this).closest('tr');

        $.ajax({
            url: 'billing_system.cfc?method=deleteProduct',
            type: 'post',
            data: {
                id: id
            },
            success: function(response) {
                alert("Are you sure to delete this");
                supplierRow.remove();
                alert(response);
            }
        });
    });
    $(document).on('click', '.add_product_page', function() {
        loadContent('add_product');
    });
    $(document).on('click', '.manage_product_page', function() {
        loadContent('manage_product');
        fetchProduct();
    });

    $(document).on('click', '#add_invoice_page_id', function() {
        loadContent('add_invoice');
    });

    $(document).on('click', '.view-invoices', function() {
        var id = $(this).data('id');
        $.ajax({
            url: 'billing_system.cfc?method=getViewInvoicess',
            type: 'get',
            dataType: 'json',
            data: { invoiceId: id },
            success: function(response) {
                console.log("this is response", response);
                var invoiceData = response;
                var hidden_shop_name= $("#real_hidden_shop_name").val();
                var hidden_shop_logo = $('#real_hidden_shop_logo').val();
            
                // Construct the image URL
                var logoSrc = './Assets/images/original_image/' + hidden_shop_logo;
                
                // Create the view content dynamically
                var view_content = `
                   <html>
                <head>
                    <title>Invoice Slip</title>
                    <style>
                        body { font-family: Arial, sans-serif;  }
                        h2 { color: #007bff; }
                        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                        th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
                        .total { font-weight: bold; }
                        h1{ font-weight: bold; }
                        img#hidden_shop_logo { max-height: 70px; vertical-align: middle; }
                        h1{align-items:center;}
                    </style>
                </head>
                <body>
                    <button class="btn btn-primary back_to_manage_invoice mb-2 mt-2">Back</button>
                    <h1 class="text-center">  <img id="hidden_shop_logo" src="${logoSrc}" alt="Shop Logo"> ${hidden_shop_name}</h1> 
                   
                    <h2>Invoice Slip</h2>
                    <p><strong>Customer Name:</strong> ${invoiceData.CUSTOMERNAME}</p>
                    <p><strong>Date and Time:</strong> ${invoiceData.INVOICEDATETIME}</p>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th class="text-center">Description</th>
                                <th class="text-center">Quantity</th>
                                <th class="text-center">Unit Price</th>
                                <th class="text-center">Discount (%)</th>
                                <th class="text-center">Tax (%)</th>
                                <th class="text-center">Actual Amount</th>
                                <th class="text-center">Discount Amount</th>
                                <th class="text-center">Tax Amount</th>
                                <th class="text-center">Total</th>
                            </tr>
                        </thead>
                        <tbody>
                        </body>
                          </html>`;
    
                invoiceData.ITEMS.forEach(function(item) {
                    view_content += `
                        <tr>
                            <td class="text-center">${item.description}</td>
                            <td class="text-center">${item.quantity}</td>
                            <td class="text-center">${item.unitPrice}</td>
                            <td class="text-center">${item.discount}</td>
                            <td class="text-center">${item.tax}</td>
                            <td class="text-center">${item.actualAmount}</td>
                            <td class="text-center">${item.discountAmount}</td>
                            <td class="text-center">${item.taxAmount}</td>
                            <td class="text-center">${item.total}</td>
                        </tr>`;
                });
    
                view_content += `
                        </tbody>
                    </table>
                    <p class="total">Total Amount: ${invoiceData.TOTALAMOUNT}</p>
                    <button class="btn btn-success mt-2" onclick="printViewInvoiceInNewWindow()">Print</button>`;
    
                $(".view_invoice").html(view_content);
            }
        });
        loadContent('view_invoice');
    });
    window.printViewInvoiceInNewWindow = function() {
        const invoiceContent1 = $(".view_invoice").html();
        const printWindow = window.open("", "_blank");
        printWindow.document.write(invoiceContent1);
        printWindow.document.close();
        printWindow.print();
    };

    $(document).on('click', '.back_to_manage_invoice', function() {
        loadContent('manage_invoice');
        fetchInvoices();
    });
    
    $(document).on("click", ".edit-invoices", function() {
        var invoiceId = $(this).data("id"); // Ensure correct data attribute extraction
       // console.log(id);
    
        $.ajax({
            url: 'billing_system.cfc?method=getEditInnvoices',
            type: 'get',
            dataType: 'json',
            data: { invoiceId: invoiceId },
            success: function(response) {
                console.log("this is response", response);
                //alert(response.CUSTOMERNAME)
                loadContent('add_invoice')
                populateInvoiceForm(response);
                populateInvoiceItems(response.ITEMS);
                $('.btn-print').hide();
                $('#saveInvoiceBtn').show();

                $(document).off('click', '#saveInvoiceBtn').on('click', '#saveInvoiceBtn', function() {
                    const customerName = $("#customerNames").val();
                    const invoiceDate = $("#invoiceDate").val();
                    let hidden_formattedDate = $("#hidden_invoiceDate").val();
                    const items = [];
                    let totalAmount = 0;
                
                    // Validate customer name
                    if (!customerName) {
                        alert("Please enter the customer name.");
                        return;
                    }
                
                    // Validate that at least one product is selected
                    let productSelected = false;
                    $("tr[id^='itemRow']").each(function() {
                        const description = $(this).find("select option:selected").text();
                        if (description !== "Select Product") {
                            productSelected = true;
                            const itemId = $(this).data("item-id");
                            const productId = $(this).find(".Product_select").val();
                            const quantity = $(this).find("td:eq(1) input").val();
                            const unitPrice = $(this).find("td:eq(2) input").val();
                            let discount = $(this).find("td:eq(3) input").val();
                            let tax = $(this).find("td:eq(4) input").val();
                            const actualAmount = $(this).find("td:eq(5) input").val();
                            const discountAmount = $(this).find("td:eq(6) input").val();
                            const taxAmount = $(this).find("td:eq(7) input").val();
                            const totalItemPrice = $(this).find("td:eq(8) input").val();
                            tax = tax.replace('%', '');
                            discount = discount || "0.00";
                
                            items.push({
                                itemId: itemId,
                                productId: productId,
                                description: description,
                                quantity: quantity,
                                unitPrice: unitPrice,
                                discount: discount,
                                tax: tax,
                                actualAmount: actualAmount,
                                discountAmount: discountAmount,
                                taxAmount: taxAmount,
                                totalItemPrice: totalItemPrice,
                            });
                        }
                    });
                
                    if (!productSelected) {
                        alert("Please select at least one product.");
                        return;
                    }
                
                    totalAmount = $("#totalAmount").val();
                    const invoiceContent = `
                        <html>
                            <head>
                                <title>Invoice Slip</title>
                                <style>
                                    body { font-family: Arial, sans-serif; }
                                    h2 { color: #007bff; }
                                    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
                                    th, td { border: 1px solid #dddddd; text-align: left; padding: 8px; }
                                    .total { font-weight: bold; }
                                </style>
                            </head>
                            <body>
                                <h2>Invoice Slip</h2>
                                <p><strong>Customer Name:</strong> ${customerName}</p>
                                <p><strong>Date and Time:</strong> ${invoiceDate}</p>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Description</th>
                                            <th>Quantity</th>
                                            <th>Unit Price</th>
                                            <th>Discount (%)</th>
                                            <th>Tax (%)</th>
                                            <th>Actual Amount</th>
                                            <th>Discount Amount</th>
                                            <th>Tax Amount</th>
                                            <th>Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        ${items.map(item => `
                                            <tr>
                                                <td>${item.description}</td>
                                                <td>${item.quantity}</td>
                                                <td>${item.unitPrice}</td>
                                                <td>${item.discount}%</td>
                                                <td>${item.tax}</td>
                                                <td>${item.actualAmount}</td>
                                                <td>${item.discountAmount}</td>
                                                <td>${item.taxAmount}</td>
                                                <td>${item.totalItemPrice}</td>
                                            </tr>`).join("")}
                                    </tbody>
                                </table>
                                <p class="total">Total Amount: ${totalAmount}</p>
                            </body>
                        </html>`;
                
                    $("#invoicePreview").empty();  // Clear previous content
                    $("#invoicePreview").append(invoiceContent);
                
                    // Hide the invoice form and show the preview
                    $("#addinvoicecontent").hide();
                    $("#invoicePreview").show();
                
                    // Attach the print button functionality to open the invoice in a new window and print
                    $("#invoicePreview").append('<button class="btn btn-primary me-3" onclick="backToInvoiceForm()">Back</button>');
                    $("#invoicePreview").append('<button class="btn btn-success" onclick="printInvoiceInNewWindow()">Print</button>');
                
                    const hidden_iddd = $("#hidden_secere_userid").val();
                    $.ajax({
                        url: "billing_system.cfc?method=updateStock",
                        type: "POST",
                        dataType: "json",
                        data: {
                            items: JSON.stringify(items),
                            Control_ID: hidden_iddd
                        },
                        success: function(response) {
                            $.ajax({
                                url: "billing_system.cfc?method=UpdateInvoice",
                                type: "POST",
                                dataType: "json",
                                data: {
                                    invoiceId: invoiceId,
                                    customerName: customerName,
                                    hidden_formattedDate: hidden_formattedDate,
                                    totalAmount: totalAmount,
                                    items: JSON.stringify(items)
                                },
                                complete: function(result) {
                                    alert("Invoice updated successfully!");
                                    clearFields();
                                }
                            });
                        }
                    });
                });
                
            },
           
        });
    });
    $(document).on('click', '#manage_invoice_page_id', function() {
        loadContent('manage_invoice');
        fetchInvoices();
    });

    $(document).on('click', '.delete-invoices', function() {
        var id = $(this).data('id');
        var unitRow = $(this).closest('tr');

        $.ajax({
            url: 'billing_system.cfc?method=deleteInvoices',
            type: 'post',
            data: {
                id: id
            },
            success: function(response) {
                alert("Are you sure to delete this");
                unitRow.remove();
                alert(response);
            }
        });
    });


    
    function populateInvoiceForm(response) {
        $('#customerNames').val(response.CUSTOMERNAME);
        $('#invoiceDate').val(response.INVOICEDATETIME);
        $('#hidden_invoiceDate').val(response.INVOICEDATETIME);
        $('#totalAmount').val(response.TOTALAMOUNT);
    }
    
    function populateInvoiceItems(items) {
        $('#invoiceItems').empty(); // Clear existing items
    
        items.forEach((item, index) => {
            const itemCounter = index + 1;
            const newItemRow = `
                <tr id="itemRow${itemCounter}" data-item-id="${item.itemId}">
                    <td>
                        <div class="search_select_box">
                            <select id="productSelect${itemCounter}" class="form-control Product_select">
                                <option value="${item.product_id}"></option>
                            </select>
                        </div>
                    </td>
                    <td><input type="number" class="form-control quantity text-center" name="quantity" value="${item.quantity}" required></td>
                    <td><input type="text" class="form-control unitPrice text-center" name="unitPrice" value="${item.unitPrice}" disabled readonly></td>
                    <td><input type="number" class="form-control discount text-center" name="discount" value="${item.discount}" min="0" max="100"></td>
                    <td><input type="text" class="form-control tax text-center" name="tax" value="${item.tax}%" disabled readonly></td>
                    <td><input type="text" class="form-control actualAmount text-center" name="actualAmount" value="${item.actualAmount}" disabled readonly></td>
                    <td><input type="text" class="form-control discountAmount text-center" name="discountAmount" value="${item.discountAmount}" disabled readonly></td>
                    <td><input type="text" class="form-control taxAmount text-center" name="taxAmount" value="${item.taxAmount}" disabled readonly></td>
                    <td><input type="text" class="form-control totalItemPrice text-center" name="totalItem" value="${item.total}" disabled readonly></td>
                    <td><button type="button" class="btn btn-danger" onclick="removeInvoiceItem(${itemCounter})">Remove</button></td>
                </tr>`;
            $("#invoiceItems").append(newItemRow);
            fetchSelectInvoiceProduct(`productSelect${itemCounter}`, item.product_id);
            previousStock();
        });
    
        updateTotalAmount();
    }
    

    $(document).on('click', '#update_button_profile_image', function() {
        var profileImage = $('#profileImage')[0].files[0];
        var formData = new FormData();
    
        if (profileImage) {
            formData.append('profileImage', profileImage);
        } else {
            formData.append('profileImage', ""); // Append an empty string if no file is selected
        }
    
        formData.append('user_id', $("#real_hidden_session_id").val()); 
    
        $.ajax({
            url: 'billing_system.cfc?method=updateProfileImage',
            type: 'POST',
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
            success: function(result) {
                console.log("Profile Image update result:", result);
                $('#currentImageName_ProfileImage').css({
                    'opacity': 1,
                    'cursor': 'default' // Ensure cursor is a normal arrow
                });
                fetchProfileValue();
                

                // Handle success
            }
        });
       
    });
    $(document).on('click','#update_button_shop_logo',function(){
        //var userNames = $('#userNames').val();
       // var shopName  = $('#shopName').val();
       // var email  = $('#email').val();
       // var password  = $('#password').val(); 
       // var currentImageName_ShopLogo  =$('#currentImageName_ShopLogo').val();
       // var mobileNumber= $('#mobileNumber').val();
       // var currentImageName_ProfileImage=$('#currentImageName_ProfileImage').val();
        var shopLogo= $('#shopLogo')[0].files[0];
        //var profileImage = $('#profileImage')[0].files[0];

        var formData = new FormData();
/*         formData.append('userNames', userNames);
        formData.append('shopName', shopName);
        formData.append('email', email);
        formData.append('password', password);
        formData.append('currentImageName_ShopLogo', currentImageName_ShopLogo);
        formData.append('mobileNumber', mobileNumber);
        formData.append('currentImageName_ProfileImage', currentImageName_ProfileImage); */

        if ($("#shopLogo")[0].files.length > 0) {
            formData.append("shopLogo", shopLogo);
        } else {
            formData.append("shopLogo", ""); // Append an empty string if no file is selected
        }
        /* if ($("#profileImage")[0].files.length > 0) {
            formData.append("profileImage", profileImage);
        } else {
            formData.append("profileImage", ""); // Append an empty string if no file is selected
        }

        for (var pair of formData.entries()) {
            console.log(pair[0] + ': ' + pair[1]); // Log each key-value pair


        } */
        //alert(formData)
        //console.log("bajbjsbj",formData)
        formData.append('user_id', $("#hidden_secere_userid").val()); 

        //var hiodden_iddd=$("#hidden_secere_userid").val();
        //alert(hiodden_iddd)
        $.ajax({
            url:`billing_system.cfc?method=updateShopLogo`,
            type:'POST',
            contentType: false,
            processData: false,
            dataType:'json',
            data:formData,
            success:function(result){
                console.log(result);
                    $('#currentImageName_ShopLogo').css({
                        'opacity': 1,
                        'cursor': 'default' // Ensure cursor is a normal arrow
                    });
                fetchProfileValue();


            }
        })
    })
    $(document).on('click', '#update_button_profile_name', function() {
        var userName = $('#userNames').val();
        var formData = new FormData();
        
        formData.append('userName', userName);
        formData.append('user_id', $("#real_hidden_session_id").val());
    
        $.ajax({
            url: 'billing_system.cfc?method=updateProfileName',
            type: 'POST',
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
            success: function(result) {
                fetchProfileValue();
                //alert(""); // Fetch updated profile values
                fetchProfileImage();
            }
        });
    });
    $(document).on('click', '#update_button_shop_name', function() {
        var shopName = $('#shopName').val();
        var formData = new FormData();
    
        formData.append('shopName', shopName);
        formData.append('user_id', $("#hidden_secere_userid").val());
    
        $.ajax({
            url: 'billing_system.cfc?method=updateShopName',
            type: 'POST',
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
            success: function(result) {
                //console.log("Shop Name update result:", result);
                window.ShopDetails();
                fetchProfileValue(); // Fetch updated profile values
            }
        });
    });
    $(document).on('click', '#update_button_email', function() {
        var email = $('#email').val();
        var formData = new FormData();
    
        formData.append('email', email);
        formData.append('user_id', $("#real_hidden_session_id").val());
    
        $.ajax({
            url: 'billing_system.cfc?method=updateEmail',
            type: 'POST',
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
            success: function(result) {
                console.log("Email update result:", result);
                fetchProfileValue(); // Fetch updated profile values
            },
            error: function(xhr, status, error) {
                console.error("Error updating email:", error);
            }
        });
    });
    $(document).on('click', '#update_button_password', function() {
        var password = $('#password').val();
        var formData = new FormData();
    
        formData.append('password', password);
        formData.append('user_id', $("#real_hidden_session_id").val());
    
        $.ajax({
            url: 'billing_system.cfc?method=updatePassword',
            type: 'POST',
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
            success: function(result) {
                console.log("Password update result:", result);
                fetchProfileValue(); // Fetch updated profile values
            }
        });
    });
    $(document).on('click', '#update_button_mobile_number', function() {
        var mobileNumber = $('#mobileNumber').val();
        var formData = new FormData();
    
        formData.append('mobileNumber', mobileNumber);
        formData.append('user_id', $("#real_hidden_session_id").val());
    
        $.ajax({
            url: 'billing_system.cfc?method=updateMobileNumber',
            type: 'POST',
            contentType: false,
            processData: false,
            dataType: 'json',
            data: formData,
            success: function(result) {
                console.log("Mobile Number update result:", result);
                fetchProfileValue(); // Fetch updated profile values
            }
        });
    });

    $(document).on('click', '#add_subscription', function () {
        $("#no_subs_message").hide();
        $(".container2_subs").show();
        
    });
    $(document).on('click', '.upgrade_subscription', function () {
        //alert(1)
        $(".subscription-card").hide();
        $(".container2_subs").show();
    });

    $(document).on('click', '#back_index_btn', function () {
        $("#no_subs_message").show();
        $(".container2_subs").hide();
        
    });
    $(document).on('click', '#back_index_btn2', function () {
        $(".subscription-card").show();
        $(".container2_subs").hide();
        
    });
    $(document).on('click', '.add-stock-btn', function() {
        var productId = $(this).data('product-id');
        var productName = $(this).data('product-name');
        var currentStock = $(this).data('current-stock');
        
        $('#productId').val(productId);
        $('#productName').val(productName);
        $('#currentStock').val(currentStock);

        
        

        $('#stockContainer').hide();
        $('#addStockContainer').show();
    });

    // Handle form submission for adding stock
    $(document).on('submit', '#addStockForm', function(event) {
        event.preventDefault();
      
     
        
    
        var formData = $(this).serialize();
        var hidden_iddd = $("#real_hidden_Shop_id").val();
        console.log("Serialized formData:", formData);
    
        $.ajax({
            url: 'billing_system.cfc?method=updateStockss',
            type: 'POST',
            data: formData + '&userID=' + hidden_iddd,
            dataType: 'json',
            success: function(result) {
                if (result ==="success") {
                    alert('Stock updated successfully');
                    $('#addStock').val("");

                    $('#addStockContainer').hide();
                    $('#stockContainer').show();
                    fetchStockData();// Refresh stock data
                    showLowStockAlert(); 
                } else {
                    alert('Error updating stock');
                }
            }
        });
    });
    
    // Cancel button functionality
    $(document).on('click', '#cancelUpdate', function() {
        $('#addStockContainer').hide();
        $('#stockContainer').show();
    });
    
       
  

    
    
    


  
});
$(document).on('click','#add_tax_btn',function(){
        alert("you are clicking add atx btn")
        var taxAmount = $('#tax_amount').val().trim(); // Ensure no leading/trailing whitespace
        var status = 'Active'; // Set the status as required
        var hidden_iddd=$("#hidden_secere_userid").val();

        // Validate taxAmount to ensure it is a valid numeric value
        if (isNaN(taxAmount) || taxAmount === '') {
            alert('Please enter a valid numeric tax amount.');
            return;
        }
        
        // No need to convert to float and fix precision here; the database will handle it
        // taxAmount = parseFloat(taxAmount).toFixed(2);
        
        $.ajax({
            url: 'billing_system.cfc?method=inserttax',
            type: 'POST',
            data: {
                tax_amount: taxAmount,
                status: status,
                Control_ID:hidden_iddd
            },
            success: function(response) {
                alert('Tax inserted successfully.');
                $('#tax_amount').val('');
            },
            error: function() {
                alert('Error adding tax.');

            }
        });

    
})

$(document).on('click','.add_category_btn',function(){
    alert("you are clicking add category btn")
    var category_name = $('#category_name').val().trim(); 
    var status = 'Active'; 
    var hidden_iddd=$("#hidden_secere_userid").val();

    
    if ( category_name === '') {
        alert('Please enter a valid numeric tax amount.');
        return;
    }
    
    
    
    $.ajax({
        url: 'billing_system.cfc?method=insertcategory',
        type: 'POST',
        data: {
            category_name: category_name,
            status: status,
            Control_ID:hidden_iddd
        },
        success: function(response) {
            alert('Category inserted successfully.');
            $('#category_name').val('');
        },
        error: function() {
            alert('Error adding category.');

        }
    });
})
$(document).on('click','#add_unit_btn',function(){
    alert("you are clicking add unit btn")
    var unit_name = $('#unit_name').val().trim(); // Ensure no leading/trailing whitespace
    var status = 'Active'; // Set the status as required
    var hidden_iddd=$("#hidden_secere_userid").val();

    // Validate taxAmount to ensure it is a valid numeric value
    if ( unit_name === '') {
        alert('Please enter a valid unit name.');
        return;
    }
   
    // No need to convert to float and fix precision here; the database will handle it
    // category_name = parseFloat(category_name).toFixed(2);
    
    $.ajax({
        url: 'billing_system.cfc?method=insertUnit',
        type: 'POST',
        data: {
            unit_name: unit_name,
            status: status,
            Control_ID:hidden_iddd
        },
        success: function(response) {
            alert('Unit inserted successfully.');
            $('#unit_name').val('');
        },
        error: function() {
            alert('Error adding Unit.');

        }
    });


})

$(document).on('click','#add_supplier_btn',function(){
    alert("you are clicking add supplier btn")
    var supplier_name = $('#supplierName').val().trim(); // Ensure no leading/trailing whitespace
    var contact = $('#contact').val().trim();
    var address = $('#address').val().trim();
    var details = $('#details').val().trim();
    var hidden_iddd=$("#hidden_secere_userid").val();
    var credit_balance = $('#creditBalance').val().trim();
    // Check if credit_balance is empty or less than 0
    if (credit_balance === '' || parseFloat(credit_balance) < 0) {
        credit_balance = '0.00'; // Set default value to '0.00'
    } else {
        // Ensure that credit_balance is formatted properly as a float with 2 decimal places
        credit_balance = parseFloat(credit_balance).toFixed(2);
    }

    
    if ( supplier_name === '') {
        alert('Please enter a Supplier name.');
        return;
    }
    if ( contact === '') {
        alert('Please enter a contact.');
        return;
    }
    if ( address === '') {
        alert('Please enter a address.');
        return;
    }
    if ( details === '') {
        alert('Please enter a details name.');
        return;
    }

    $.ajax({
        url: 'billing_system.cfc?method=insertSupplier',
        type: 'POST',
        data: {
            supplier_name: supplier_name,
            contact:contact,
            address:address,
            details:details,
            credit_balance:credit_balance,
            Control_ID:hidden_iddd
            
        },
        success: function(response) {
            alert('Supplier inserted successfully.');
            $('#supplierName').val('');
            $('#contact').val('');
            $('#address').val('');
            $('#details').val('');
            $('#creditBalance').val('');
        },
        error: function() {
            alert('Error adding Supplier.');

        }
    });


})

$(document).on('click','.add_sub_category_btn',function(){
    alert("you are clicking add sub category btn")
  
    var selectedCategoryId = $('#choose_category').val();
    var selectedCategoryName = $('#choose_category option:selected').text();
    var subCategoryName = $('#sub_category_name').val();
    var status = 'Active'; 
    var hidden_iddd=$("#hidden_secere_userid").val();
    
    if ( (selectedCategoryId && subCategoryName) === '') {
        alert('Please choose a category name.');
        return;
    }
    if ( subCategoryName === '') {
        alert('Please enter a valid sub-category  name.');
        return;
    }
   
    
    $.ajax({
        url: 'billing_system.cfc?method=insertSub_Category',
        type: 'POST',
        data: {
            selectedCategoryId:selectedCategoryId,
            selectedCategoryName: selectedCategoryName,
            subCategoryName: subCategoryName,
            status:status,
            Control_ID:hidden_iddd
        },
        success: function(response) {
            alert('Sub Category  inserted successfully.');
            $('#choose_category').val('0');
            $('#sub_category_name').val('');
        },
        error: function() {
            alert('Error adding Sub Category.');

        }
    });


})


$(document).on('click', '.add-product-btn', function (e) {
    e.preventDefault(); // Prevent form submission

    alert("You are clicking the add product button");

    var productname = $("#productName").val();
    var serialnumber = $("#serialNumber").val();
    var productmodel = $("#productModel").val();
    var categoryselect = $("#category_select").val();
    var selectedcategoryname = $('#category_select option:selected').text();
    var sellingprice = $("#sellingPrice").val();
    var unitselect = $("#unit_select").val();
    var selectedunitname = $('#unit_select option:selected').text();
    var taxselect = $("#tax_select").val();
    var selectedtaxamount = $('#tax_select option:selected').text();
    var supplierselect = $("#supplier_select").val();
    var selectedsupplier = $('#supplier_select option:selected').text();
    var totalstock = $("#totalstock").val();
    var purchaseprice = $("#purchase_price").val();
    var subcategoryselect = $("#addproduct_sub_category_select").val();
    var selectedsubcategory = $('#addproduct_sub_category_select option:selected').text();
    var productimage = $("#productImage")[0].files[0];
    var productimage1 = $("#productImage").val();


    if(productname === ''){
        alert("please enter productname");
        return;
    }
    if(serialnumber === ''){
        alert("please enter serialnumber");
        return;
    }
    if(categoryselect === '0'){
        alert("please choose category");
        return;
    }
    if(productmodel === ''){
        alert("please enter productmodel");
        return;
    }
    if(sellingprice === ''){
        alert("please enter sellingprice");
        return;
    }
    if(unitselect === '0'){
        alert("please choose unit");
        return;
    }
    if(taxselect === '0'){
        alert("please choose tax");
        return;
    }
    if(productimage1 === ''){
        alert("please choose Image file");
        return;
    }
    if(supplierselect === '0'){
        alert("please choose supplier");
        return;
    }
    if(totalstock === ''){
        alert("please enter stock");
        return;
    }
    if(purchaseprice === ''){
        alert("please enter purchaseprice");
        return;
    }
    if(subcategoryselect === '0'){
        alert("please choose subcategory");
        return;
    }


    
    

    
    var formData = new FormData();
    formData.append("productname", productname);
    formData.append("serialnumber", serialnumber);
    formData.append("productmodel", productmodel);
    formData.append("categoryselect", categoryselect);
    formData.append("selectedcategoryname", selectedcategoryname);
    formData.append("sellingprice", sellingprice);
    formData.append("unitselect", unitselect);
    formData.append("selectedunitname", selectedunitname);
    formData.append("taxselect", taxselect);
    formData.append("selectedtaxamount", selectedtaxamount);
    formData.append("productimage", productimage);
    formData.append("supplierselect", supplierselect);
    formData.append("selectedsupplier", selectedsupplier);
    formData.append("totalstock", totalstock);
    formData.append("purchaseprice", purchaseprice);
    formData.append("subcategoryselect", subcategoryselect);
    formData.append("selectedsubcategory", selectedsubcategory);
    formData.append('Control_ID', $("#hidden_secere_userid").val());

    $.ajax({
        url: 'billing_system.cfc?method=insertProduct',
        type: 'POST',
        data: formData,
        contentType: false, // Important for file upload
        processData: false, // Important for file upload
        success: function (result) {
            alert(result);
            $("#productName").val('');
            $("#serialNumber").val('');
            $("#productModel").val('');
            $("#category_select").val('0');
            $("#sellingPrice").val('');
            $("#unit_select").val('0');
            $("#tax_select").val('0');
            $("#supplier_select").val('0');
            $("#totalstock").val('');
            $("#purchase_price").val('');
            $("#addproduct_sub_category_select").val('0');
            $("#productImage").val('');
        
        }
       
    });
});


$(document).ready(function() {
    $("select[id^='productSelect']").each(function() {
        const selectId = $(this).attr('id');
        fetchSelectInvoiceProduct(selectId);
        previousStock();

    });

    $(document).ready(function(){
        $('[data-bs-toggle="collapse"]').on('click', function() {
            var target = $(this).attr('data-bs-target');
            $(target).collapse('toggle');
        });


       
    });


   
    
    
}); 

$(document).ready(function() {
    // Function to enable editing
    function enableEditing(inputId, editButtonId, updateButtonId) {
        $(inputId).prop('disabled', false); // Enable input field
        $(editButtonId).hide(); // Hide the Edit button
        $(updateButtonId).show(); // Show the Update button
        $('#saveButton').hide();  // Show the Save Profile button
    }

    // Function to handle update
    function handleUpdate(inputId, editButtonId, updateButtonId) {
        var value = $(inputId).val();
        console.log("Updating " + inputId + " with value: " + value);

        // Perform the update operation here (e.g., send data to the server)
        // For demonstration, we'll just log the value
        console.log("Updated value:", value);

        $(inputId).prop('disabled', true); // Disable input field
        $(updateButtonId).hide(); // Hide the Update button
        $(editButtonId).show(); // Show the Edit button
        $('#saveButton').hide(); // Hide the Save Profile button
    }

    // Bind Edit button click events using delegated event handling
    $(document).on('click', '#edit_button_profile_name', function() {
        enableEditing('#userNames', '#edit_button_profile_name', '#update_button_profile_name');
    });
    
    $(document).on('click', '#edit_button_shop_name', function() {
        enableEditing('#shopName', '#edit_button_shop_name', '#update_button_shop_name');
    });

    $(document).on('click', '#edit_button_email', function() {
        enableEditing('#email', '#edit_button_email', '#update_button_email');
    });
    
    $(document).on('click', '#edit_button_password', function() {
        enableEditing('#password', '#edit_button_password', '#update_button_password');
    });
    
    $(document).on('click', '#edit_button_mobile_number', function() {
        enableEditing('#mobileNumber', '#edit_button_mobile_number', '#update_button_mobile_number');
    });

    // Bind Edit button click events for file inputs
    $(document).on('click', '#edit_button_shop_logo', function() {
        enableEditing('#shopLogo', '#edit_button_shop_logo', '#update_button_shop_logo');
        $('#shopLogo').on('change', function() {
            $('#currentImageName_ShopLogo').css({
                'opacity': 0,
                'cursor': 'default' // Ensure cursor is a normal arrow
            });
             
        });
    });

    $(document).on('click', '#edit_button_profile_image', function() {
        enableEditing('#profileImage', '#edit_button_profile_image', '#update_button_profile_image');
        $('#profileImage').on('change', function() {
            $('#currentImageName_ProfileImage').css({
                'opacity': 0,
                'cursor': 'default' // Ensure cursor is a normal arrow
            });
             
        });
        //$('#profileImage').prop('disabled', false); // Enable profile image file input
       // $('#saveButton').show(); // Show the Save Profile button
    });

    // Bind Update button click events using delegated event handling

    $(document).on('click', '#update_button_profile_name', function() {
        handleUpdate('#userNames', '#edit_button_profile_name', '#update_button_profile_name');
    });
    
    $(document).on('click', '#update_button_shop_name', function() {
        handleUpdate('#shopName', '#edit_button_shop_name', '#update_button_shop_name');
    });

    $(document).on('click', '#update_button_email', function() {
        handleUpdate('#email', '#edit_button_email', '#update_button_email');
    });
    
    $(document).on('click', '#update_button_password', function() {
        handleUpdate('#password', '#edit_button_password', '#update_button_password');
    });
    
    $(document).on('click', '#update_button_mobile_number', function() {
        handleUpdate('#mobileNumber', '#edit_button_mobile_number', '#update_button_mobile_number');
    });



    $(document).on('click', '#update_button_shop_logo', function() {
        handleUpdate('#shopLogo', '#edit_button_shop_logo', '#update_button_shop_logo');
    });

    $(document).on('click', '#update_button_profile_image', function() {
        handleUpdate('#profileImage', '#edit_button_profile_image', '#update_button_profile_image');
    });

    $(document).on('submit', '#profileForm', function(event) {
        event.preventDefault();
        
        var formData = new FormData(this);
        formData.append('hidden_user_id', $("#hidden_secere_userid").val()); // Add hidden user ID

        console.log("formdata",formData)
        for (var pair of formData.entries()) {
            console.log(pair[0] + ': ' + pair[1]);
        }
       
        /* $.ajax({
            url: 'billing_system.cfc?method=updateProfile', // Update URL to your CFC method
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
           
            success: function(response) {
                console.log("Profile updated successfully");
                // Handle success
            },
            error: function(xhr, status, error) {
                console.error("Error updating profile:", error);
                // Handle error
            }
        }); */
    });


    
});












