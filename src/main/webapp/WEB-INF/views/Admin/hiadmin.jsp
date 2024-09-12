<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chart Page</title>
    <script src="https://code.highcharts.com/highcharts.js"></script>
</head>
<body>
    <div id="container" style="width:100%; height:400px;"></div>
    <h1>Welcome</h1>
    <script>
        // Safely parse the JSON data from the model
        const chartData = ${chartData};

        document.addEventListener('DOMContentLoaded', function () {
            Highcharts.chart('container', chartData);
        });
    </script>
</body>
</html>
