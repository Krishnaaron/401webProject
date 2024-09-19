package com.jobportal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jobportal.mapper.ChartMapper;
import com.jobportal.model.Chart;
@Service
public class ChartServicesImp implements ChartServices{
	@Autowired ChartMapper chartMapper;
	@Override
	public void addChart(Chart chart) {
	 
		chartMapper.updateChart(chart);
		
	}

	@Override
	public List<Chart> retriveChart() {
		// TODO Auto-generated method stub
		return chartMapper.retriveChart();
	}

}
