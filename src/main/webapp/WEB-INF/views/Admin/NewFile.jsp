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

<style>

.chart-actions {
    display: flex;
    align-items: center; 
    gap: 10px;
    margin-bottom: 10px; 
}

.chart-actions i {
    cursor: pointer; /* Change cursor to pointer to indicate clickable icons */
    font-size: 20px; /* Adjust icon size as needed */
    color: #333; /* Adjust color as needed */
}

#dataToggleBox {
    margin-bottom: 20px; /* Adjust spacing below the filter controls */
}

  #dataToggleBoxs {
    margin-bottom: 20px; 
            display: none;
        }

.chart-actions {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 10px;
}

.chart-actions i {
    font-size: 15px;
    margin-left: 10px;
    cursor: pointer;
}
   #dataToggleBox {
            display: none;
            position: absolute;
            background: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            margin-left:250px;
            z-index: 100;
        }
        #dataToggleBo {
            display: none;
            position: absolute;
            background: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            margin-left:250px;
            z-index: 100;
        }
         #dataToggleBoxs {
            display: none;
            position: absolute;
            background: #fff;
            border: 1px solid #ccc;
            padding: 10px;
            margin-left:250px;
            z-index: 100;
        }
        .custom-export-icon {
            font-size: 24px;
            cursor: pointer;
        }
</style>

</head>


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
                <i class="fas fa-filter" id="filterIcon"></i>
                <i class="fas fa-download" id="exportIcon"></i> <!-- Export icon -->
            </div>
            <div id="dataToggleBox">
                <label for="chartTypes">Choose chart type:</label>
                <select id="chartTypes">
                    <option value="pie">Pie Chart</option>
                    <option value="bar">Bar Chart</option>
                    <option value="line">Line Chart</option>
                     <option value="area">Area Chart</option>
                </select>
                <br>
                <input type="checkbox" id="threeDCheckBox">
                <label for="threeDCheckBox">3D</label>
                <br>
                <button id="applyFilter">Filter</button>
            </div>
            <div id="m1"></div>
        </div>
       <div class="col-lg-5 col-md-12 chart">
        <div class="chart-actions">
            <i class="fas fa-filter" id="filterIcons"></i>
            <i class="fas fa-download" id="exportIcons"></i> <!-- Export icon -->
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
             <label for="JobCatory">Choose Job Catgory:</label>
            <select id="JobCatory">
                <option value="pie">Pie Chart</option>
                <option value="bar">Bar Chart</option>
                <option value="line">Line Chart</option>
                <option value="area">Area Chart</option>
            </select>
            <br>
              <button id="applyFilter">Filter</button>
            
        </div>
        <div id="m2"></div>
    </div>

</div>

 <div class="row chart-container">
        <div class="col-lg-5 col-md-12 chart">
            <div class="chart-actions">
                <i class="fas fa-filter" id="filterIcon"></i>
                <i class="fas fa-download" id="exportIcon"></i> <!-- Export icon -->
            </div>
            <div id="dataToggleBo">
                <label for="chartTypes">Choose chart type:</label>
                <select id="chartTypes">
                    <option value="funnel">Funnel Chart</option>
                    <option value="pyramid">Pyramid Chart</option>
                </select>
                <br>
                <label for="JobCategories">Choose job categories:</label>
                <select id="JobCategories">
                    <option value="category1">Category 1</option>
                    <option value="category2">Category 2</option>
                </select>
                <br>
                <button id="applyFilter">Filter</button>
            </div>
            <div id="m3"></div>
        </div>
    </div>

    <script>
        function renderChart(chartType) {
            Highcharts.chart('m3', {
                chart: {
                    type: chartType
                },
                title: {
                    text: 'Job Categories And Number of Jobs ' + (chartType.charAt(0).toUpperCase() + chartType.slice(1))
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b> ({point.y:,.0f})',
                            softConnector: true
                        },
                        center: ['50%', '50%'],
                        width: '60%'
                    }
                },
                legend: {
                    enabled: false
                },
                series: [{
                    name: 'Job Portal',
                    data: [
                        ['Number Jobs', 15654],
                        ['Number of Applications', 4064],
                        ['Number of Job Categories', 1987]
                    ]
                }]
            });
        }

        document.getElementById('applyFilter').addEventListener('click', function () {
            const chartType = document.getElementById('chartTypes').value;
            renderChart(chartType);
        });

        // Initialize with the default chart type
        renderChart(document.getElementById('chartTypes').value);
    </script>


	<div id="logoutModal" class="modal fade center" tabindex="-1"
		aria-labelledby="logoutModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgb(36, 43, 94)">
					<h5 class="modal-title" id="logoutModalLabel" style="color: white">Logout</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>Are you sure you want to logout?</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" id="confirmLogout" class="btn btn-primary"
						style="color: white">Logout</button>
				</div>
			</div>
		</div>
	</div>

      
  
    <script>
        function renderChart(chartType) {
            Highcharts.chart('m3', {
                chart: {
                    type: chartType
                },
                title: {
                    text: 'Sales ' + (chartType.charAt(0).toUpperCase() + chartType.slice(1))
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b> ({point.y:,.0f})',
                            softConnector: true
                        },
                        center: ['50%', '50%'],
                        width: '60%'
                    }
                },
                legend: {
                    enabled: false
                },
                series: [{
                    name: 'Job Portal',
                    data: [
                        ['Number Jobs', 15654],
                        ['Number of Applications', 4064],
                        ['Number of Job Categories', 1987]
                    ]
                }]
            });
        }

        document.getElementById('filter').addEventListener('click', function () {
            const chartType = document.getElementById('select').value;
            renderChart(chartType);
        });

        // Initialize with the default chart type
        renderChart(document.getElementById('select').value);
    </script>
  <script>
        const employe =${employe} ; // Example value, replace with dynamic data
        const seekerSize = ${seekerSize}; // Example value, replace with dynamic data

        const staticData = {
            numberOfEmployers: employe,
            numberOfJobSeekers: seekerSize
        };

        document.addEventListener('DOMContentLoaded', function () {
            // Initialize the chart with static data
            const chart = Highcharts.chart('m1', {
                chart: {
                    type: 'column'
                },
                title: {
                    text: 'Number of Users in Job Portal'
                },
                xAxis: {
                    categories: ['Employers', 'Job Seekers']
                },
                yAxis: {
                    title: {
                        text: 'Number of Users'
                    }
                },
                credits: {
                    enabled: false
                },
                series: [{
                    name: 'Number of Users',
                    data: [staticData.numberOfEmployers, staticData.numberOfJobSeekers]
                }],
                plotOptions: {
                    column: {
                        depth: 0,
                        dataLabels: {
                            enabled: false
                        }
                    }
                },
                exporting: {
                    enabled: true,
                    buttons: {
                        contextButton: {
                            menuItems: ['viewFullscreen', 'printChart', 'downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG']
                        }
                    }
                }
            });

            // Handle filter icon click
            document.getElementById('filterIcon').addEventListener('click', function () {
                const dataToggleBox = document.getElementById('dataToggleBox');
                dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
            });

            // Handle export icon click
            document.getElementById('exportIcon').addEventListener('click', function () {
                chart.exportChart(); // Trigger the export menu
            });

            // Handle filter application
            document.getElementById('applyFilter').addEventListener('click', function () {
                const chartType = document.getElementById('chartTypes').value;
                const is3D = document.getElementById('threeDCheckBox').checked;
                const employers = parseInt(document.getElementById('employersInput')?.value, 10) || staticData.numberOfEmployers;
                const jobSeekers = parseInt(document.getElementById('jobSeekersInput')?.value, 10) || staticData.numberOfJobSeekers;

                const chartOptions = {
                    pie: 'pie',
                    bar: 'bar',
                    line: 'line',
                    area: 'area'
                };

                const plotOptions = {
                    [chartOptions[chartType]]: {
                        depth: chartType === 'bar' && is3D ? 400 : 0,
                        dataLabels: {
                            enabled: chartType === 'bar' && is3D,
                           
                        }
                    }
                };

                // Update the chart with new data
                chart.update({
                    chart: {
                        type: chartOptions[chartType]
                    },
                    series: [{
                        name: 'Number of Users',
                        data: [employers, jobSeekers]
                    }],
                    plotOptions: plotOptions
                });

                // Close the dataToggleBox after applying the filter
                document.getElementById('dataToggleBox').style.display = 'none';
            });
        });
    </script>

  <script>
  const jobSzie = 100; // Example value, replace with dynamic data
  const seekerSize =200; // Example value, replace with dynamic data

  const staticData = {
      numberOfEmployers: jobSize,
      numberOfJobSeekers: seekerSize
  };

  document.addEventListener('DOMContentLoaded', function () {
      // Initialize the chart with static data
      const chart = Highcharts.chart('m2', {
          chart: {
              type: 'column'
          },
          title: {
              text: 'Number of Users in Job Portal'
          },
          xAxis: {
              categories: ['Employers', 'Job Seekers']
          },
          yAxis: {
              title: {
                  text: 'Number of Users'
              }
          },
          credits: {
              enabled: false
          },
          series: [{
              name: 'Number of Users',
              data: [staticData.numberOfEmployers, staticData.numberOfJobSeekers] // Use dynamic data here
          }],
          plotOptions: {
              column: {
                  depth: 0, // Default depth for column chart
                  dataLabels: {
                      enabled: false
                  }
              }
          },
          exporting: {
              enabled: true,
              buttons: {
                  contextButton: {
                      menuItems: ['viewFullscreen', 'printChart', 'downloadPNG', 'downloadJPEG', 'downloadPDF', 'downloadSVG']
                  }
              }
          }
      });

      // Handle filter icon click
      document.getElementById('filterIcon').addEventListener('click', function () {
          const dataToggleBox = document.getElementById('dataToggleBox');
          dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
      });

      // Handle export icon click
      document.getElementById('exportIcon').addEventListener('click', function () {
          chart.exportChart(); // Trigger the export menu
      });

      // Handle filter application
      document.getElementById('applyFilter').addEventListener('click', function () {
          const chartType = document.getElementById('chartTypes').value;
          const is3D = document.getElementById('threeDCheckBox').checked;
          const employers = parseInt(document.getElementById('employersInput').value, 10);
          const jobSeekers = parseInt(document.getElementById('jobSeekersInput').value, 10);
          const chartOptions = {
              pie: 'pie',
              bar: 'column',
              line: 'line'
          };

          // Update the chart with new data
          chart.update({
              chart: {
                  type: chartOptions[chartType]
              },
              series: [{
                  name: 'Number of Users',
                  data: [employers, jobSeekers] // Updated data
              }],
              plotOptions: {
                  [chartOptions[chartType]]: {
                      depth: is3D ? 100 : 0,
                      dataLabels: {
                          enabled: is3D
                      }
                  }
              }
          });

          // Close the dataToggleBox after applying the filter
          document.getElementById('dataToggleBox').style.display = 'none';
      });
  });


    </script>
    
    <script>
        // Static data
        
        const staticDatas = {
            numberOfEmployers:${employe}, // Replace with dynamic data
            numberOfJobSeekers: ${seekerSize}, // Replace with dynamic data
            numberOfJobs:${jobSize}, // Replace with dynamic data
            numberOfApplications:${jobApplicationSize} // Replace with dynamic data
        };

        // Initialize the chart with static data
        function initializeChart3D(type, data) {
            Highcharts.chart('m2', {
                chart: {
                    type: type,
                    options3d: {
                        enabled: true,
                        alpha: 10,
                        beta: 25,
                        depth: 250
                    }
                },
                title: {
                    text: 'Job Portal Data'
                },
                xAxis: type === 'pie' ? undefined : { categories: ['Employers', 'Job Seekers', 'Jobs', 'Applications'] },
                yAxis: type === 'pie' ? undefined : { title: { text: 'Count' } },
                series: [{
                    name: 'Counts',
                    data: type === 'pie' ? [
                        ['Employers', data.numberOfEmployers],
                        ['Job Seekers', data.numberOfJobSeekers],
                        ['Jobs', data.numberOfJobs],
                        ['Applications', data.numberOfApplications]
                    ] : [
                        { name: 'Employers', y: data.numberOfEmployers },
                        { name: 'Job Seekers', y: data.numberOfJobSeekers },
                        { name: 'Jobs', y: data.numberOfJobs },
                        { name: 'Applications', y: data.numberOfApplications }
                    ],
                    colorByPoint: type === 'pie'
                }],
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

        // Handle chart type selection
        document.getElementById('chartType').addEventListener('change', function() {
            initializeChart3D(this.value, staticDatas);
        });

        // Handle filter icon click
        document.getElementById('filterIcons').addEventListener('click', function () {
            const dataToggleBox = document.getElementById('dataToggleBoxs');
            dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
        });

        // Handle export icon click
        document.getElementById('exportIcons').addEventListener('click', function () {
            const chart = Highcharts.charts.find(chart => chart.renderTo.id === 'm2');
            if (chart) {
                chart.exportChart();
            }
        });

        // Initial chart load
        initializeChart3D('line', staticDatas); // Default to line chart
    </script>
      <script>
        function renderChart(chartType) {
            Highcharts.chart('m3', {
                chart: {
                    type: chartType
                },
                title: {
                    text: 'Sales ' + (chartType.charAt(0).toUpperCase() + chartType.slice(1))
                },
                plotOptions: {
                    series: {
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b> ({point.y:,.0f})',
                            softConnector: true
                        },
                        center: ['50%', '50%'],
                        width: '60%'
                    }
                },
                legend: {
                    enabled: false
                },
                series: [{
                    name: 'Job Portal',
                    data: [
                        ['Number Jobs', 15654],
                        ['Number of Applications', 4064],
                        ['Number of Job Categories', 1987]
                    ]
                }]
            });
        }

        document.getElementById('filter').addEventListener('click', function () {
            const chartType = document.getElementById('select').value;
            renderChart(chartType);
        });

        // Initialize with the default chart type
        renderChart(document.getElementById('select').value);
    </script>
	<script src="${pageContext.request.contextPath}/assets/js/admin.js"></script>




</body>

</html>
