/**
 * 
 */
package com.exist.ems.dao.timecard;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.exist.ems.model.TimeCard;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 11 - 14:18:24
 * 
 */
public interface TimeCardDao {

	void save(TimeCard timeCard) throws DataAccessException;
	
	List<TimeCard> loadAll() throws DataAccessException;
	
	TimeCard getCurrentTimeCard(String empCode) throws DataAccessException;
	
	List<TimeCard> getWeekLog(String empCode, Date from, Date to) throws DataAccessException;
}
