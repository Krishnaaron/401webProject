package com.jobportal.model;

import java.util.List;

import org.springframework.stereotype.Controller;

@Controller
public class ChartValues
{
	private String	chartType;

	private String	title;

	private String	xAxisTitle;

	private String	exportText;

	public String getExportText()
	{
		return exportText;
	}

	public void setExportText(String exportText)
	{
		this.exportText = exportText;
	}

	private String	yAxisTitle;

	private int		alpha;

	private int		beta;

	private int		depath;

	public int getDepath()
	{
		return depath;
	}

	public void setDepath(int depath)
	{
		this.depath = depath;
	}

	private String	fontSize;

	private String	color;

	private String	text;

	private String	idustries;

	private String	categories;

	public String getIdustries()
	{
		return idustries;
	}

	public void setIdustries(String idustries)
	{
		this.idustries = idustries;
	}

	public String getCategories()
	{
		return categories;
	}

	public void setCategories(String categories)
	{
		this.categories = categories;
	}

	private List<String>	menuItems;

	private boolean			is3d;

	public int getAlpha()
	{
		return alpha;
	}

	public String getFontSize()
	{
		return fontSize;
	}

	public void setFontSize(String fontSize)
	{
		this.fontSize = fontSize;
	}

	public String getColor()
	{
		return color;
	}

	public void setColor(String color)
	{
		this.color = color;
	}

	public String getText()
	{
		return text;
	}

	public void setText(String text)
	{
		this.text = text;
	}

	public List<String> getMenuItems()
	{
		return menuItems;
	}

	public void setMenuItems(List<String> menuItems)
	{
		this.menuItems = menuItems;
	}

	public boolean isIs3d()
	{
		return is3d;
	}

	public void setIs3d(boolean is3d)
	{
		this.is3d = is3d;
	}

	public boolean getIs3d()
	{
		return is3d;
	}

	public void setAlpha(int alpha)
	{
		this.alpha = alpha;
	}

	public int getBeta()
	{
		return beta;
	}

	public void setBeta(int beta)
	{
		this.beta = beta;
	}

	public int getDeppth()
	{
		return deppth;
	}

	public void setDeppth(int deppth)
	{
		this.deppth = deppth;
	}

	public boolean isEnabled()
	{
		return enabled;
	}

	public void setEnabled(boolean enabled)
	{
		this.enabled = enabled;
	}

	private int				deppth;

	private boolean			enabled;

	private List<Integer>	xCategory;

	private List<Series>	series;

	private List<String>	xAxisCategories;

	public List<String> getxAxisCategories()
	{
		return xAxisCategories;
	}

	public void setxAxisCategories(List<String> xAxisCategories)
	{
		this.xAxisCategories = xAxisCategories;
	}

	public List<Series> getSeries()
	{
		return series;
	}

	public void setSeries(List<Series> series)
	{
		this.series = series;
	}

	public static class Series
	{
		private String name;

		public String getName()
		{
			return name;
		}

		public void setName(String name)
		{
			this.name = name;
		}

		public List<Integer> getData()
		{
			return data;
		}

		public void setData(List<Integer> data)
		{
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
