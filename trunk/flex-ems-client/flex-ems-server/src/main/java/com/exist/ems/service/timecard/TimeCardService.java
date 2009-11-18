/**
 * 
 */
package com.exist.ems.service.timecard;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.exist.ems.exception.EmsException;
import com.exist.ems.model.TimeCard;
import com.exist.ems.service.EmsService;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 11 - 14:16:30
 * 
 */
public interface TimeCardService extends EmsService {

	void save(TimeCard timeCard) throws EmsException;
	
	void saveTimeIn(String empCode) throws EmsException;
	
	void saveTimeOut(String empCode) throws EmsException;
	
	List<TimeCard> loadAll() throws EmsException;
	
	List<TimeCard> listCurrentWeekLog(String empCode) throws DataAccessException;
	
	List<TimeCard> listPreviousWeekLog(String empCode) throws DataAccessException;
}
