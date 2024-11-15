<cfoutput>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Subscription Plans</title>
        <link rel="stylesheet" href="./Assets/CSS/style2.css"> 
        <link href="https://cdn.lineicons.com/4.0/lineicons.css" rel="stylesheet" /> 
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <div class="container2" id="container">
            <div class="subscription-container">
                <h1><span class="me-5 " id="back_index_btn"><i class="lni lni-reply"></i>Back</span>Choose Your Subscription Plan</h1>
                <div class="subscription-cards">
                    <form id="subscriptionForms" method="post" action="process_payment.cfm">

                
                        <div class="subscription-card" >
                            <h2>Free Trial</h2>
                            <p>Duration: 1 Day</p>
                            <p>Cost: Free</p>
                            <button type="submit" name="plan" value="free_trial" id="subs_btn">Free Trial</button>
                        </div>
                        <div class="subscription-card" >
                            <h2>One Month</h2>
                            <p>Duration: 30 Days</p>
                            <p>Cost: <i class="lni lni-rupee"></i>30</p>
                            <button type="submit" name="plan" value="one_month" id="subs_btn">Buy Plan</button>
                        </div>
                        <div class="subscription-card" >
                            <h2>Six Months</h2>
                            <p>Duration: 180 Days</p>
                            <p>Cost: <i class="lni lni-rupee"></i>150</p>
                            <button type="submit" name="plan" value="six_months" id="subs_btn">Buy Plan</button>
                        </div>
                    </form>
                </div>
                <div  class="without-subscription"  name="plan" value="without_subscription" >
                    Without Subscription ?
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function() {
                $("##back_index_btn").click(function(){
                    $.ajax({
                        url: 'clear_session.cfm',
                        type: 'GET',
                        success: function() {
                            window.location.href = 'index.cfm';
                        }
                    });
                });
                $(".without-subscription").click(function(){
                    
                    window.location.href = 'home.cfm';
                });
            });
        </script>
    </body>

    </html>
</cfoutput>