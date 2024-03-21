package com.ace.schedule.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ScheduleDAOImple implements ScheduleDAO {
	
	private SqlSessionTemplate sqlmap;

	public ScheduleDAOImple(SqlSessionTemplate sqlmap) {
		super();
		this.sqlmap = sqlmap;
	}

	public int addSchedule(ScheduleDTO dto) {
		int result=sqlmap.insert("insertSchedule", dto);
		return result;
	}
	
	public List<ScheduleDTO> listSchedule(Map map) {
		List<ScheduleDTO> list=sqlmap.selectList("selectSchedule", map);
		return list;
	}

}
