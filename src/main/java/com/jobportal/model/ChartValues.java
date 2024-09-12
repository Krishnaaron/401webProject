package com.jobportal.model;

import java.util.List;


public class ChartValues
{
	private String			chartType;

	private String			title;

	private String			xAxisTitle;

	private String			yAxisTitle;
    private boolean credits;
    
	private List<Integer>	xCategory;
	  private List<Series> series;
	
	  private List<String> xAxisCategories;
	
	  public List<String> getxAxisCategories() {
		return xAxisCategories;
	}

	public void setxAxisCategories(List<String> xAxisCategories) {
		this.xAxisCategories = xAxisCategories;
	}

	public List<Series> getSeries() {
		return series;
	}

	public void setSeries(List<Series> series) {
		this.series = series;
	}
	
	public static class ThreeDChart {
		private boolean  enabled ;
		private int alpha;
		private int beta ;
		private int depth;
		public boolean isEnabled() {
			return enabled;
		}
		public void setEnabled(boolean enabled) {
			this.enabled = enabled;
		}
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
	}

	public static class Series {
	        private String name;
	        public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public List<Integer> getData() {
				return data;
			}
			public void setData(List<Integer> data) {
				this.data = data;
			}
			private List<Integer> data;

	        // Constructors, getters, and setters
	    }
	public String getChartType()
	{
		return chartType;
	}

	public void setChartType(String chartType)
	{
		this.chartType = chartType;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getxAxisTitle()
	{
		return xAxisTitle;
	}

	public void setxAxisTitle(String xAxisTitle)
	{
		this.xAxisTitle = xAxisTitle;
	}

	public String getyAxisTitle()
	{
		return yAxisTitle;
	}

	public void setyAxisTitle(String yAxisTitle)
	{
		this.yAxisTitle = yAxisTitle;
	}

	public List<Integer> getxCategory()
	{
		return xCategory;
	}

	public void setxCategory(List<Integer> xCategory)
	{
		this.xCategory = xCategory;
	}

}
