package com.jobportal.service;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.jobportal.model.ChartData;

import java.util.*;
import java.util.stream.Collectors;
import org.springframework.stereotype.Service;

@Service
public class ChartService {
	public String getChartData(String selectedCategory, String selectedIndustry, String is3D, String chartType) {
        Map<String, Map<String, Map<String, Integer>>> companyCategoriesJson = getCompanyCategoriesData();

        ChartData chartData = new ChartData();
        chartData.setType(chartType);
        chartData.setIs3D(is3D);

        List<Object[]> chartSeriesData = new ArrayList<>();
        List<String> chartCategories = new ArrayList<>();
        String title;

        if (selectedCategory != null && selectedIndustry != null) {
            Map<String, Integer> roles = companyCategoriesJson.get(selectedCategory).get(selectedIndustry);
            roles.forEach((role, openings) -> {
                chartSeriesData.add(new Object[]{role, openings});
            });
            title = "Job Openings in " + selectedIndustry + " (" + selectedCategory + ")";
        } else {
            // Aggregate data for all categories and industries
            companyCategoriesJson.forEach((category, industries) -> {
                industries.forEach((industry, roles) -> {
                    int totalOpenings = roles.values().stream().reduce(0, Integer::sum);
                    chartSeriesData.add(new Object[]{industry + " (" + category + ")", totalOpenings});
                });
            });
            title = "Job Openings Across All Industries";
        }

        chartData.setTitle(title);
        chartData.setSeriesData(chartSeriesData);

        // Convert ChartData to JSON
        JSONObject chartJson = new JSONObject();
        chartJson.put("type", chartData.getType());
        chartJson.put("is3D", chartData.getIs3D());
        chartJson.put("title", chartData.getTitle());
        chartJson.put("seriesData", chartData.getSeriesData());

        return chartJson.toString();
    }

    // Dummy method for company data (You can replace it with your actual data source)
    private Map<String, Map<String, Map<String, Integer>>> getCompanyCategoriesData() {
        Map<String, Map<String, Map<String, Integer>>> data = new HashMap<>();

        Map<String, Map<String, Integer>> techIndustry = new HashMap<>();
        techIndustry.put("Tech", Map.of("Software Developer", 50, "UI/UX Designer", 30));

        Map<String, Map<String, Integer>> financeIndustry = new HashMap<>();
        financeIndustry.put("Finance", Map.of("Accountant", 40, "Financial Analyst", 25));

        data.put("Category1", techIndustry);
        data.put("Category2", financeIndustry);

        return data;
    }
	
	
	
}
