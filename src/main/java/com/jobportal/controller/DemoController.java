package com.jobportal.controller;

import java.util.Arrays;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jobportal.model.ChartValues;

@Controller
public class DemoController {
      
	@RequestMapping("/demo")
    public String displayChart(Model model) throws JsonProcessingException {
        // Create and set chart values
        ChartValues chartValues = new ChartValues();
        chartValues.setChartType("line");
        chartValues.setTitle("Fruit Consumption");
        chartValues.setxAxisTitle("Years");
        chartValues.setyAxisTitle("Nuclear Weapon States");
        chartValues.setxCategory(Arrays.asList(150, 250, 350, 450, 550, 650, 750, 850, 950, 1050));

        // Create series data
        ChartValues.Series series1 = new ChartValues.Series();
        series1.setName("Jane");
        series1.setData(Arrays.asList(1, 0, 4,7));

        ChartValues.Series series2 = new ChartValues.Series();
        series2.setName("John");
        series2.setData(Arrays.asList(5, 7, 3,88));

        chartValues.setSeries(Arrays.asList(series1, series2));

        // Construct the JSON object
        JSONObject chart = new JSONObject();
        chart.put("type", chartValues.getChartType());

        JSONObject title = new JSONObject();
        title.put("text", chartValues.getTitle());

        JSONObject xAxis = new JSONObject();
        xAxis.put("categories", new JSONArray(Arrays.asList("Apples", "Bananas", "Oranges","mango")));

        JSONArray seriesArray = new JSONArray();
        for (ChartValues.Series series : chartValues.getSeries()) {
            JSONObject seriesObject = new JSONObject();
            seriesObject.put("name", series.getName());
            seriesObject.put("data", new JSONArray(series.getData()));
            seriesArray.put(seriesObject);
        }

        JSONObject chartData = new JSONObject();
        chartData.put("chart", chart);
        chartData.put("title", title);
        chartData.put("xAxis", xAxis);
        chartData.put("series", seriesArray);

        // Print the JSON object
        model.addAttribute("chartData",chartData);
        return "Admin/admin";
    }

    
	
	public String chartView(Model model) {
		 ChartValues chartdesign = new ChartValues();
		 
		 chartdesign.setChartType("column");
	//	 chartdesign.ti
		 
		 
		
		return null;
	}
	
	
	
}
