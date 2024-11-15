<cfoutput>
    <html>
        <head>
            <title>Invoice module</title>
            <link rel="stylesheet" href="./Assets/CSS/style.css">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
            <style>
                body{
                    background-color: ##1d2630 !important;
                }
                .container{
                    background-color: ##fff !important;
                    padding:30px;
                    border-radius: 10px;
                    margin-top: 150px;
                }
                h2{
                    color:##007bff !important;

                }
                th,td{
                    text-align: center !important;
                }
                ##totalAmount{
                    font-weight:bold !important;
                    font-size: 18px;
                }
                .special_label{
                    font-weight:600!important;
                
                }
            </style>
            
        </head>
        <body>
            <div class="container ">
                <h2 class="mb-5 text-center">Billing invoice</h2>
                <form id="invoiceForm">
                    <div class="row mt-5 mb-5">
                        <div class="form group col-md-6" >
                            <label for="customerName" class="special_label"> Customer Name</label>
                            <input type="text" class="form-control" id="customername" name="customername" placeholder="Enter Customer Name">
                        </div>
                        <div class="form group col-md-6" >
                            <label for="invoiceData" class="special_label">Invoice Data</label>
                            <input type="text" class="form-control" id="invoiceDate" name="invoiceDate" disabled readonly>
                        </div>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col" >Description</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Unit Price</th>
                                <th scope="col">Total</th>
                                <th scope="col" colspan="2">Action</th>
                            </tr>
                        </thead>
                        <tbody id="invoiceItems">
                            <!--- Items will be added here dynamically --->
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-primary" onclick="addInvoiceItem()">Add Item</button>
                   
                        <div class="form group col-md-6 mt-4" >
                            <label for="invoiceData" class="special_label">Total Amount</label>
                            <input type="text" class="form-control" id="totalAmount" name="invoiceData" disabled readonly>
                        </div>
                   
                    <button type="submit" class="btn btn-success mt-2">Genarte Invoice</button>
                </form>
                <button type="button" class="btn btn-danger btn-print mt-4" onclick="printInvoice()">Print Invoice</button>
            </div>
            <script src="./Assets/js/script.js"></script>
        </body>
    </html>
</cfoutput>