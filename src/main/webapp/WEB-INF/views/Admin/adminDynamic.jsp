<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Panel</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">

<link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
	rel="stylesheet">
<script src="https://code.highcharts.com/highcharts.js"></script>

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	rel="stylesheet">
<!-- high chart -->
 <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/funnel.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <script src="https://code.highcharts.com/highcharts-more.js"></script>
<script src="https://code.highcharts.com/10/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/admin.css">



</head>

<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//http 1.1
response.setHeader("Pragma", "no-cache");//http1.0
response.setHeader("Expires", "0");// Proxies

if (session.getAttribute("admin") == null)
{

	response.sendRedirect("index.jsp");

}
%>

<body id="body-pd">
	<header class="header" id="header">
		<div class="header_toggle">
			<i class='bx bx-menu' id="header-toggle"></i>
		</div>
		<div class="header_info">
			<div class="header_img">
				<img src="${pageContext.request.contextPath}/assets/images/user.png"
					alt="Profile Image">
			</div>
			<span class="admin_text">${admin.name}</span>
			<div class="header_icons">
				<i class='bx bx-bell' id="notification-icon" title="Notifications"></i>
				<i class='bx bx-envelope' id="message-icon" title="Messages"></i> <i
					class='bx' id="logout-icon" title=""></i>
			</div>
		</div>
	</header>
	<div class="l-navbar" id="nav-bar">
		<nav class="nav">
			<div>
				<a href="#" class="nav_logo"> <img
					src="${pageContext.request.contextPath}/assets/images/head.2.png"
					alt="">
				</a>
				<div class="nav_list">
					<a href="cart" class="nav_link active"> <i
						class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span>
					</a> <a href="AdminRetriveData" class="nav_link"> <i
						class='fas fa-users nav_icon'></i> <span class="nav_name">Job
							Seekers</span>
					</a> <a href="AdminEmployerRetriveData" class="nav_link"> <i
						class='fas fa-user-tie nav_icon'></i> <span class="nav_name">Employers</span>
					</a> <a href="AdminJobRetriveData" class="nav_link"> <i
						class='fas fa-briefcase nav_icon'></i> <span class="nav_name">Jobs</span>
					</a> <a href="AdminProfileView" class="nav_link"> <i
						class='bx bx-user nav_icon'></i> <span class="nav_name">My
							Profile</span>
					</a> <a href="adminPasswordController" class="nav_link"> <i
						class='fas fa-key nav_icon' title="Reset Password"></i> <span
						class="nav_name">Reset Password</span>
					</a> <a href="#" class="nav_link" id="logout-link"> <i
						class='bx bx-log-out nav_icon'></i> <span class="nav_name">Sign
							Out</span>
					</a>
				</div>
			</div>
		</nav>
	</div>

	<div class="container mt-6">
		<div class="row mt-4">
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white"
					style="background-color: rgba(54, 162, 235, 0.5);">
					<div class="card-body">
						<h6 class="card-title">Job Seekers</h6>
						<div class="text-center">
							<i class="fas fa-user-graduate fa-2x mb-2"></i>
						</div>
						<p class="card-text">${seekerSize}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-success">
					<div class="card-body">

						<h6 class="card-title">Employers</h6>
						<div class="text-center">
							<i class="fas fa-building fa-2x mb-2"></i>
						</div>
						<p class="card-text">${employe}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-warning">
					<div class="card-body">
						<h6 class="card-title">Jobs</h6>
						<div class="text-center">
							<i class="fas fa-briefcase fa-2x mb-2"></i>
						</div>
						<p class="card-text">${jobSize}</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-3 mb-4">
				<div class="card text-white bg-danger">
					<div class="card-body">
						<h6 class="card-title">Applications</h6>
						<div class="text-center">
							<i class="fas fa-file-alt fa-2x "></i>
						</div>
						<p class="card-text">${jobApplicationSize}</p>
					</div>
				</div>
			</div>
		</div>
     </div>



 <div class="row chart-container">
    <div class="col-lg-5 col-md-12 chart">
        <div class="chart-actions">
            <i class="fas fa-filter" id="filterIcons"></i>
            <i class="fas fa-download" id="exportIcons"></i>
        </div>
        <div id="dataToggleBoxs">
            <label for="chartType">Choose chart type:</label>
            <select id="chartType">
                <option value="pie">Pie Chart</option>
                <option value="bar">Bar Chart</option>
                <option value="line">Line Chart</option>
                <option value="area">Area Chart</option>
            </select>
            <br>
            <label for="jobCategories">Choose Job Categories:</label>
            <select id="jobCategories">
                <option value="">All Categories</option>
                <!-- Categories will be dynamically filled here -->
            </select>
            <br>
            <input type="checkbox" id="threeDCheckBoxs">
            <label for="threeDCheckBoxs">3D</label>
            <br>
            <button id="applyFilters">Filter</button>
        </div>
        <div id="m2"></div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Demo data to show initially
  
    const demoJobCategoriesJson = ${jobJson};

    // Initially use demo data, replace later with server-side data
    let jobCategoriesJson = demoJobCategoriesJson;  // Replace with actual data later
    console.log(jobCategoriesJson);  // Assuming actual data is passed later from the JSP

    const categories = Object.keys(jobCategoriesJson);
    const jobCategoriesDropdown = document.getElementById('jobCategories');
    
    // Populate the job categories dropdown
    categories.forEach(category => {
        const option = document.createElement('option');
        option.value = category;
        option.textContent = category;
        jobCategoriesDropdown.appendChild(option);
    });

    function initializeChart3D(type, is3D, selectedCategory = null) {
        let chartData;
        
        // Filter data based on the selected category
        if (selectedCategory && selectedCategory !== "") {
            const roles = Object.keys(jobCategoriesJson[selectedCategory]);
            const openings = Object.values(jobCategoriesJson[selectedCategory]);
            chartData = roles.map((role, index) => [role, openings[index]]);
        } else {
            // Show data for all categories if no specific category is selected
            chartData = categories.map(category => {
                const totalOpenings = Object.values(jobCategoriesJson[category])
                    .reduce((sum, openings) => sum + openings, 0);
                return [category, totalOpenings];
            });
        }

        Highcharts.chart('m2', {
            chart: {
                type: type,
                options3d: {
                    enabled: is3D,
                    alpha: 10,
                    beta: 25,
                    depth: 250
                }
            },
            credits: {
                enabled: false
            },
            title: {
                text: 'Job Portal Demo Data'
            },
            xAxis: {
                categories: type !== 'pie' ? (selectedCategory ? Object.keys(jobCategoriesJson[selectedCategory]) : categories) : undefined
            },
            plotOptions: {
                pie: {
                    innerSize: 100,
                    depth: 150,
                    dataLabels: {
                        enabled: true,
                        format: '{point.name}: {point.y}'
                    }
                },
                bar: {
                    depth: 100,
                    dataLabels: {
                        enabled: true
                    }
                },
                line: {
                    dataLabels: {
                        enabled: true
                    }
                },
                area: {
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            series: [{
                name: 'Jobs',
                data: chartData
            }],
            exporting: {
                enabled: true,
                buttons: {
                    contextButton: {
                        menuItems: ['viewFullscreen', 'printChart', 'downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG']
                    }
                }
            }
        });
    }

    // Add event listeners for filtering and exporting
    document.getElementById('applyFilters').addEventListener('click', function() {
        const type = document.getElementById('chartType').value;
        const is3D = document.getElementById('threeDCheckBoxs').checked;
        const selectedCategory = document.getElementById('jobCategories').value;
        
        initializeChart3D(type, is3D, selectedCategory);
    });

    document.getElementById('filterIcons').addEventListener('click', function() {
        const dataToggleBox = document.getElementById('dataToggleBoxs');
        dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
    });

    document.getElementById('exportIcons').addEventListener('click', function() {
        const chart = Highcharts.charts.find(chart => chart.renderTo.id === 'm2');
        if (chart) {
            chart.exportChart();
        }
    });

    // Initial chart load: Show demo data for all categories
    initializeChart3D('line', false); // Default to line chart without 3D
});
</script>

 
   
    
      
	<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>




</body>

</html>
