package com.jobportal.model;

import java.util.List;
import java.util.Map;

public class ChartData {
    private String type;
    private String is3D;
    private String title;
    private int alpha;
    private int beta;
    private int depth;
    private String enabled;
    private Map<String, Map<String, Map<String, Integer>>> jobOpenings;
    private List<String> categories;
    public int getAlpha() {
		return alpha;
	}

	public void setAlpha(int alpha) {
		this.alpha = alpha;
	}

	public int getBeta() {
		return beta;
	}

	public void setBeta(int beta) {
		this.beta = beta;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getEnabled() {
		return enabled;
	}

	public void setEnabled(String enabled) {
		this.enabled = enabled;
	}

	private List<Object[]> seriesData;
    
    // Getters and Setters

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIs3D() {
        return is3D;
    }

    public void setIs3D(String is3D) {
        this.is3D = is3D;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    public List<Object[]> getSeriesData() {
        return seriesData;
    }

    public void setSeriesData(List<Object[]> seriesData) {
        this.seriesData = seriesData;
    }
    public Map<String, Map<String, Map<String, Integer>>> getJobOpenings() {
        return jobOpenings;
    }

    public void setJobOpenings(Map<String, Map<String, Map<String, Integer>>> jobOpenings) {
        this.jobOpenings = jobOpenings;
    }
}