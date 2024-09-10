

//chart 1
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


//chart 2

document.addEventListener('DOMContentLoaded', function() {
   
    
    let jobCategoriesJson = demoJobCategoriesJson;  
    console.log(jobCategoriesJson); 
    const categories = Object.keys(jobCategoriesJson);
    const jobCategoriesDropdown = document.getElementById('jobCategories');
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
                text: 'Jobs Category'
            },
			yAxis: {
						title: {
							text: 'Number of Opennings'
						}
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
        const dataToggleBox = document.getElementById('dataToggleBoxs');
		dataToggleBox.style.display = 'none';
    });

    document.getElementById('filterIcons').addEventListener('click', function() {
        const dataToggleBox = document.getElementById('dataToggleBoxs');
        dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
    });

   document.getElementById('exportIcons').addEventListener('click', function() {
   const chart = Highcharts.charts.find(chart => chart && chart.renderTo.id === 'm2');
    if (chart) {
        chart.exportChart();
    } else {
        console.error('Chart not found or no chart with id "m2"');
    }
});
 initializeChart3D('line', false); // Default to line chart 
});

//chart3

document.addEventListener('DOMContentLoaded', function() {
    let companyCategoriesJson = companyJobCategoriesJson;  
    console.log(companyCategoriesJson); 
    const categories = Object.keys(companyCategoriesJson);
    const industryCategoriesDropdown = document.getElementById('company');
    
    categories.forEach(category => {
        const option = document.createElement('option');
        option.value = category;
        option.textContent = category;
        industryCategoriesDropdown.appendChild(option);
    });

    function initializeCharts(type, is3D, selectedCategory = null) {
        let chartData;

        if (selectedCategory && selectedCategory !== "") {
            const roles = Object.keys(companyCategoriesJson[selectedCategory]);
            const openings = Object.values(companyCategoriesJson[selectedCategory]);
            chartData = roles.map((role, index) => [role, openings[index]]);
        } else {
            chartData = categories.map(category => {
                const totalOpenings = Object.values(companyCategoriesJson[category])
                    .reduce((sum, openings) => sum + openings, 0);
                return [category, totalOpenings];
            });
        }

        Highcharts.chart('m4', {
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
                text: 'industry Category'
            },
            xAxis: {
                categories: type !== 'pie' ? (selectedCategory ? Object.keys(companyCategoriesJson[selectedCategory]) : categories) : undefined
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
                name: selectedCategory !== null ? selectedCategory : 'industry',
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

    document.getElementById('apply').addEventListener('click', function() {
        const type = document.getElementById('chart').value;
        const is3D = document.getElementById('threeD').checked;
        const selectedCategory = document.getElementById('company').value;
        
        initializeCharts(type, is3D, selectedCategory);
        const dataToggleBox = document.getElementById('dataToggle');
        dataToggleBox.style.display = 'none';
    });

    document.getElementById('filter').addEventListener('click', function() {
        const dataToggleBox = document.getElementById('dataToggle');
        dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
    });

    document.getElementById('export').addEventListener('click', function() {
        const chart = Highcharts.charts.find(chart => chart && chart.renderTo.id === 'm4');
        if (chart) {
            chart.exportChart();
        } else {
            console.error('Chart not found or no chart with id "m4"');
        }
    });

    initializeCharts('pie', false); // Default to pie chart
});
