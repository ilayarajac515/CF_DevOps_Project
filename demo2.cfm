<!DOCTYPE html>
<html>
<head>
    <title>JavaScript Donut Chart</title>
    <style>
        #chart-container {
            height: 500px;
        }
    </style>
    <!-- Include FusionCharts library -->
    <script src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"></script>
    <script src="https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.theme.fusion.js"></script>
</head>
<body>
    <div id="chart-container"></div>

    <script>
        // Create a FusionCharts instance
        FusionCharts.ready(function () {
            var chart = new FusionCharts({
                type: 'doughnut2d',
                renderAt: 'chart-container',
                width: '100%',
                height: '100%',
                dataFormat: 'json',
                dataSource: {
                    chart: {
                        caption: "Android Distribution for our app",
                        enableSmartLabels: false,
                        subcaption: "For all users in 2017",
                        showpercentvalues: "1",
                        defaultcenterlabel: "Android Distribution",
                        aligncaptionwithcanvas: "0",
                        captionpadding: "0",
                        decimals: "0",
                        plottooltext:
                            "<b>$percentValue</b> of our Android users are on <b>$label</b>",
                        theme: "fusion"
                    },
                    data: [
                        {
                            color: "#29577b",
                            label: "Ice Cream Sandwich",
                            value: "18900"
                        },
                        {
                            color: "#35c09c",
                            label: "Jelly Bean",
                            value: "5300"
                        },
                        {
                            color: "#f6ce49",
                            label: "Kitkat",
                            value: "10500"
                        },
                        {
                            color: "#f7a35c",
                            label: "Lollipop",
                            value: "1900"
                        }
                    ]
                }
            });

            // Render the chart
            chart.render();
        });
        
    </script>
</body>
</html>
