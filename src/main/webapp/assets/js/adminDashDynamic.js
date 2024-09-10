
document.addEventListener('DOMContentLoaded', function() {
	// Retrieve the JSON string from JSP
	console.log(jobCategoriesJson)
	// Debug: Log raw JSON data

	const categories = Object.keys(jobCategoriesJson);
	const data = Object.values(jobCategoriesJson);

	function initializeChart3D(type, is3D) {
		Highcharts.chart('m2', {
			chart: {
				type: type,
				options3d: {
					enabled: is3D,
					alpha: 10,
					beta: 25,
					depth: 250
				}

			}, credits: {
				enabled: false
			},
			title: {
				text: 'Job Portal Data'
			},
			xAxis: {
				categories: type !== 'pie' ? categories : undefined
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
				data: type === 'pie' ? categories.map((cat, index) => [cat, data[index]]) : data
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

	// Add event listeners

	document.getElementById('applyFilters').addEventListener('click', function() {
		const type = document.getElementById('chartType').value;
		const is3D = document.getElementById('threeDCheckBoxs').checked;
		
		initializeChart3D(type, is3D);
		const dataToggleBox = document.getElementById('dataToggleBoxs');
		dataToggleBox.style.display = 'none';
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
	// Initial chart load
	initializeChart3D('line', false); // Default to line chart without 3D
});



//


document.addEventListener('DOMContentLoaded', function() {
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
	document.getElementById('filterIcon').addEventListener('click', function() {
		const dataToggleBox = document.getElementById('dataToggleBox');
		dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
	});

	// Handle export icon click
	document.getElementById('exportIcon').addEventListener('click', function() {
		chart.exportChart(); // Trigger the export menu
	});

	// Handle filter application
	document.getElementById('applyFilter').addEventListener('click', function() {
		const chartType = document.getElementById('chartTypes').value;
		
		const employers = staticData.numberOfEmployers;
		const jobSeekers = staticData.numberOfJobSeekers;

		const chartOptions = {
			pie: 'pie',
			bar: 'bar',
			line: 'line',
			area: 'area'
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
			
		});

		// Close the dataToggleBox after applying the filter
		document.getElementById('dataToggleBox').style.display = 'none';
	});
});


