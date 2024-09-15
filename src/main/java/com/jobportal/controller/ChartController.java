package com.jobportal.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.jobportal.model.Chart;
import com.jobportal.model.ChartData;
import com.jobportal.model.Jobs;
import com.jobportal.service.AdminService;
import com.jobportal.service.ChartServices;

@RestController
public class ChartController {
    @Autowired
    ChartServices chartServices;
    
    @Autowired 
    AdminService adminService;

    @PostMapping("/saveChart")  // Save chart configuration
    public void saveChart(@RequestBody Chart chart) {
        chartServices.addChart(chart);
    }
    
    @PostMapping("/chartData")  // New endpoint for chart data
    public ResponseEntity<ChartData> getChartData(@RequestBody Chart charts) {
        List<Jobs> jobsList = adminService.viewJobs();
        chartServices.addChart(charts);
        // Create ChartData object
        ChartData chartData = new ChartData();
        Chart chart = chartServices.retriveChart();

        // Set chart configuration
        chartData.setType(chart.getChartType());
        chartData.setIs3D(chart.getIs3D());
        chartData.setAlpha(10);  // Customize as needed
        chartData.setBeta(25);
        chartData.setDepth(250);
        chartData.setEnabled("true");  // Customize if necessary
        chartData.setTitle("Job Openings");

        // Aggregate the job openings data
        Map<String, Map<String, Map<String, Integer>>> aggregate = jobsList.stream()
            .filter(job -> job.getJob_category() != null && job.getCompany_Name() != null)
            .collect(Collectors.groupingBy(
                Jobs::getJob_category,
                Collectors.groupingBy(
                    Jobs::getCompany_Name,
                    Collectors.toMap(
                        Jobs::getJob_Title,
                        Jobs::getNumber_Of_Openings,
                        Integer::sum
                    )
                )
            ));

        // Set the job openings data in chartData
        chartData.setJobOpenings(aggregate);

        // Return the chart data as JSON
        return new ResponseEntity<>(chartData, HttpStatus.OK);
    }
}
