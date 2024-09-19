package com.jobportal.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
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
public class ChartController
{
	@Autowired
	ChartServices				chartServices;

	@Autowired
	AdminService				adminService;

	private static final Logger	LOGGER	= LogManager.getLogger(ChartController.class);

	@PostMapping("/chartData")
	public ResponseEntity<ChartData> getChartData(@RequestBody Chart charts)
	{
		LOGGER.traceEntry("initialize chart Data controller in ajax");
		List<Jobs> jobsList = adminService.viewJobs();
		chartServices.addChart(charts);
		if (jobsList.isEmpty())
		{

			LOGGER.warn("No Job Found On Data Base");
		}
		ChartData chartData = new ChartData();
		chartData.setType(charts.getChartType());
		chartData.setIs3D(charts.getIs3D());
		chartData.setAlpha(10);
		chartData.setBeta(25);
		chartData.setDepth(250);
		chartData.setEnabled("true");
		chartData.setTitle("Job Openings");
		Map<String, Map<String, Map<String, Integer>>> aggregate = jobsList.stream().filter(job -> job.getJob_category() != null && job.getCompany_Name() != null)
				.collect(Collectors.groupingBy(Jobs::getJob_category,
						Collectors.groupingBy(Jobs::getCompany_Name, Collectors.toMap(Jobs::getJob_Title, Jobs::getNumber_Of_Openings, Integer::sum))));
		chartData.setJobOpenings(aggregate);
		return new ResponseEntity<>(chartData, HttpStatus.OK);
	}
}
