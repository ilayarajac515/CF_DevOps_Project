<!DOCTYPE html>
<html>
<head>
    <title>Sales Comparison Graphs</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.anychart.com/releases/8.10.0/js/anychart-bundle.min.js"></script>
</head>
<body>
    <div id="dailySalesChart" style="width: 100%; height: 400px;"></div>
    <div id="weeklySalesChart" style="width: 100%; height: 400px;"></div>

    <script>
        $(document).ready(function() {
            // Fetch the sales data using AJAX
            $.ajax({
                url: 'billing_system.cfc?method=getSalesDataaaa',
                type: 'GET',
                dataType: 'json',
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
        });
    </script>
</body>
</html>
