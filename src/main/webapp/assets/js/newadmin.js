/**
 * 
 */



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

//chart3  Industries
document.addEventListener('DOMContentLoaded', function() {
    // Define the sample JSON for job categories
    let companyCategoriesJson = companyJobCategoriesJson;
       

    const categoryDropdown = document.getElementById('Categories');
    const industryDropdown = document.getElementById('Industries');

    Object.keys(companyCategoriesJson).forEach(category => {
        const option = document.createElement('option');
        option.value = category;
        option.textContent = category;
        categoryDropdown.appendChild(option);
    });

    // Populate industry dropdown based on category selection
    function populateIndustryDropdown(selectedCategory) {
        industryDropdown.innerHTML = ''; // Clear previous options
        if (selectedCategory && companyCategoriesJson[selectedCategory]) {
            Object.keys(companyCategoriesJson[selectedCategory]).forEach(industry => {
                const option = document.createElement('option');
                option.value = industry;
                option.textContent = industry;
                industryDropdown.appendChild(option);
            });
        }
    }

    // When category is changed, update the industry dropdown
    categoryDropdown.addEventListener('change', function() {
        const selectedCategory = categoryDropdown.value;
        populateIndustryDropdown(selectedCategory);
    });

    // Function to initialize charts
    function initializeCharts(type, is3D, selectedCategory = null, selectedIndustry = null) {
        let chartData = [];

        if (selectedCategory && selectedIndustry) {
            // Get data for the selected category and industry
            const roles = Object.keys(companyCategoriesJson[selectedCategory][selectedIndustry]);
            const openings = Object.values(companyCategoriesJson[selectedCategory][selectedIndustry]);
            chartData = roles.map((role, index) => [role, openings[index]]);
        } else {
            // Aggregate data for all categories and industries
            chartData = Object.entries(companyCategoriesJson).flatMap(([category, industries]) => {
                return Object.entries(industries).map(([industry, roles]) => {
                    const totalOpenings = Object.values(roles).reduce((sum, count) => sum + count, 0);
                    return [`${industry} (${category})`, totalOpenings];
                });
            });
        }

        // Render the chart
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
                text: selectedCategory && selectedIndustry
                    ? `Job Openings in ${selectedIndustry} (${selectedCategory})`
                    : 'Job Openings Across All Industries'
            },
            xAxis: {
                categories: type !== 'pie' ? chartData.map(data => data[0]) : undefined
            },
          
            series: [{
                name: selectedCategory && selectedIndustry ? selectedIndustry : 'Industry',
                data: chartData
            }],
			navigation: {
			                    buttonOptions: {
			                        theme: {
			                            style: {
			                                fontSize: '13px',
			                                color: '#000'
			                                	 
			                            },
			                            states: {
			                                hover: {
			                                    style: {
			                                        color: '#000'
			                                    }
			                                }
			                            }
			                        },
			                        useHTML: true
			                    }
			                },

			                exporting: {
			                    buttons: {
			                        contextButton: {
			                            enabled: false
			                        },
			                        
			                            tableButton : {
			                            	text: '<i class="fa fa-table" aria-hidden="true"></i>',
			                            
			                            onclick: function() {
			                              if (this.dataTableDiv && this.dataTableDiv.style.display !== 'none') {
			                                this.dataTableDiv.style.display = 'none';
			                              } else {
			                                this.viewData();
			                                this.dataTableDiv.style.display = '';
			                              }
			                            }
			                          },
			                        filterButton: {
			                        	text :'<i class="fa fa-filter"></i>',
			                        		 onclick: function () {
			                                     const filterPanel = document.getElementById('dataToggleBoxss');
												 
			                                     filterPanel.style.display = filterPanel.style.display === 'none' ? 'block' : 'none';
			                                 }
			                        },
			                        
			                      
			                        
			                        exportButton: {
			                            text: '<i class="fa fa-download"></i>',
			                            // Use only the download related menu items from the default
			                            // context button
			                            menuItems: [
			                                'downloadPNG',
			                                'downloadJPEG',
			                                'downloadPDF',
			                                'downloadSVG'
			                            ]
			                        },
			                        printButton: {
			                            text: '<i class="fa fa-print"></i>',
			                            onclick: function () {
			                                this.print();
			                            }
			                        }
			                        
			                        
			                    }
			                }
			
			
			
		
			                });
		console.log('Chart object:', chart);
    }

    // Fetch button event listener to update chart
    document.getElementById('fetch').addEventListener('click', function() {
        const type = document.getElementById('cartType').value;
        const is3D = document.getElementById('3Dview').checked;
        const selectedCategory = document.getElementById('Categories').value;
        const selectedIndustry = document.getElementById('Industries').value;

        initializeCharts(type, is3D, selectedCategory, selectedIndustry);

        // Hide the data toggle box after fetching
        const dataToggleBox = document.getElementById('dataToggleBoxss');
        dataToggleBox.style.display = 'none';
    });

    // Cancel button event listener to hide data box
    document.getElementById('cancel').addEventListener('click', function() {
        const dataToggleBox = document.getElementById('dataToggleBoxss');
        dataToggleBox.style.display = 'none';
    });
/*
    // Filter button event listener to toggle data box visibility
    document.getElementById('filter').addEventListener('click', function() {
        const dataToggleBox = document.getElementById('dataToggleBoxss');
        dataToggleBox.style.display = dataToggleBox.style.display === 'none' ? 'block' : 'none';
    });
	
	// Custom download button event listener
	/*
	document.getElementById('custom-download').addEventListener('click', function() {
	              if (chart) {
	                  console.log('Exporting chart'); // Debugging line
	                  chart.exportChart(); // Ensure this is called on the correct chart instance
	              } else {
	                  console.log('Chart is not initialized or exportChart method is not available');
	              }
	          });
			  
			  */
    // Initialize chart with aggregated data for all industries and categories
    initializeCharts('pie', false);
});
