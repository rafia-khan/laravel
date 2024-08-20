<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-dashboard"></i> Dashboard</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        </ul>
    </div>
    <div class="row">
    <div class="col-md-6 col-lg-3">
        <div class="widget-small primary coloured-icon">
            <i class="icon fa fa-cube fa-3x"></i>
            <div class="info">
                <h4>Products</h4>
                <p><b>{{ $totalProducts }}</b></p>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-3">
        <div class="widget-small info coloured-icon">
            <i class="icon fa fa-shopping-cart fa-3x"></i>
            <div class="info">
                <h4>Sales</h4>
                <p><b>{{ $totalSales }}</b></p>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-3">
        <div class="widget-small warning coloured-icon">
            <i class="icon fa fa-truck fa-3x"></i>
            <div class="info">
                <h4>Suppliers</h4>
                <p><b>{{ $totalSuppliers }}</b></p>
            </div>
        </div>
    </div>
    <div class="col-md-6 col-lg-3">
        <div class="widget-small danger coloured-icon">
            <i class="icon fa fa-file fa-3x"></i>
            <div class="info">
                <h4>Invoices</h4>
                <p><b>{{ $totalInvoices }}</b></p>
            </div>
        </div>
    </div>
</div>

    <div class="row">
    <div class="col-md-6">
    <div class="tile">
        <h3 class="tile-title">Monthly Sales</h3>
        <!-- <div class="embed-responsive embed-responsive-16by9">
            <canvas class="embed-responsive-item" id="monthlySalesChart"></canvas>
        </div> -->
        <div id="monthlySalesChart" style="width: 100%; max-width: 100%; height: 300px;"></div>

    </div>
</div>
        <div class="col-md-6">
            <div class="tile">
                <h3 class="tile-title">Top 5 Sales Product</h3>
                <!-- <div class="embed-responsive embed-responsive-16by9">
                    <canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
                </div> -->
                <div id="topSalesChart" style="width:100%; max-width:100%; height:300px;"></div>

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="tile">
                <h3 class="tile-title">Today's vs. Yesterday's Sales</h3>
                <div id="sales_chart" style="width: 100%; height: 360px;"></div>

            </div>
        </div>
        <div class="col-md-6">
            <div class="tile">
                <h3 class="tile-title">Sales Comparison</h3>
                <!-- <p>This theme is not built for a specific framework or technology like Angular or React etc. But due to it's modular nature it's very easy to incorporate it into any front-end or back-end framework like Angular, React or Laravel.</p>
                <p>Go to <a href="http://pratikborsadiya.in/blog/vali-admin" target="_blank">documentation</a> for more details about integrating this theme with various frameworks.</p>
                <p>The source code is available on GitHub. If anything is missing or weird please report it as an issue on <a href="https://github.com/pratikborsadiya/vali-admin" target="_blank">GitHub</a>. If you want to contribute to this theme pull requests are always welcome.</p> -->
                <div id="weekSalesChart" style="width: 100%; height: 360px;"></div>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var salesData = <?php echo json_encode($monthlySales); ?>;
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Month');
        data.addColumn('number', 'Total Sales');

        salesData.forEach(function(sale) {
            data.addRow([sale.month, sale.total_amount]);
        });

        var options = {
//   title: 'Monthly Sales',
  curveType: 'function',
  legend: { position: 'bottom' },
  backgroundColor: 'transparent',
  titleTextStyle: {
    color: '#212529',
    fontSize: 24,
    bold: true
  },
  hAxis: {
    title: 'Month',
    titleTextStyle: { color: '#212529' },
    textStyle: { color: '#212529' }
  },
  vAxis: {
    title: 'Sales Figure',
    titleTextStyle: { color: '#212529' },
    textStyle: { color: '#212529' },
    gridlines: { color: '#e0e0e0' }
  },
  curveType: 'function',
  series: {
    0: { color: '#28a745' }
  },
  width: '100%',
  height: '100%'
};

        

    var chart = new google.visualization.LineChart(document.getElementById('monthlySalesChart'));
    chart.draw(data, options);
    }
</script>

<script>
    google.charts.load('current', { packages: ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Product Name');
    data.addColumn('number', 'Total Sales');
    data.addRows([
        @foreach($formattedTopSales as $sale)
            ['{{ $sale['productName'] }}', {{ $sale['totalSales'] }}],
        @endforeach
    ]);

    var options = {
        // title: 'Top 5 Sales Products',
        width: '100%',
        height: '100%',
        pieHole: 0.4, // Optional: creates a doughnut-like effect
        colors: ['#2196F3', '#4CAF50', '#FFC107', '#9C27B0', '#E91E63'] // Add your own colors
    };

    var chart = new google.visualization.PieChart(document.getElementById('topSalesChart'));
    chart.draw(data, options);
}
</script>

<script type="text/javascript">
        google.charts.load('current', {'packages': ['bar']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Day', 'Sales'],
                ['Yesterday', {{ $yesterdaySales }}],
                ['Today', {{ $todaySales }}],
            ]);

            var options = {
                chart: {
                    // title: 'Today\'s Sales vs. Yesterday\'s Sales',
                    subtitle: 'Amount in $',
                },
                colors: ['#1b9e77', '#d95f02']
            };

            var chart = new google.charts.Bar(document.getElementById('sales_chart'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
        }
    </script>

<script type="text/javascript">
    google.charts.load('current', { packages: ['corechart', 'bar'] });
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var data = google.visualization.arrayToDataTable([
            ['Week', 'Sales Amount', { role: 'style' }],
            ['This Week', {{ $thisWeekSales }}, 'color: #3366CC'],
            ['Last Week', {{ $lastWeekSales }}, 'color: #DC3912']
        ]);

        var options = {
            title: 'This Week vs Last Week Sales',
            chartArea: { width: '50%' },
            hAxis: {
                title: 'Sales Amount',
                minValue: 0,
            },
            vAxis: {
                title: 'Week'
            }
        };

        var chart = new google.visualization.BarChart(document.getElementById('weekSalesChart'));
        chart.draw(data, options);
    }
</script>