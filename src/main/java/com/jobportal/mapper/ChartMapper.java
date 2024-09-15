package com.jobportal.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.jobportal.model.Chart;

@Mapper
public interface ChartMapper {

	@Update("UPDATE CHART SET CHARTTYPE = #{chartType}, INDUSTRIES = #{industries}, CATEGORIES = #{categories}, IS3D = #{is3D}")
	boolean updateChart(Chart chart);

    
    @Select("select * from chart")
    Chart retriveChart();
}
