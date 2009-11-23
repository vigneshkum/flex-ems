/**
 * 
 */
package com.exist.ems.service.timecard;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.exist.ems.dao.timecard.TimeCardDao;
import com.exist.ems.exception.EmsException;
import com.exist.ems.model.TimeCard;
import com.exist.ems.utils.DateUtils;
import com.exist.ems.utils.ReportVO;

import flex.contrib.stereotypes.RemotingDestination;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 11 - 14:29:34
 * 
 */
@Service("timecardService")
@RemotingDestination
public class TimeCardServiceImpl implements TimeCardService {

    private static final Log log = LogFactory.getLog(TimeCardServiceImpl.class);
    
	@Autowired private TimeCardDao timeCardDao;
	//@Autowired private EmployeeDao employeeDao;
	/* (non-Javadoc)
	 * @see com.exist.ems.service.timecard.TimeCardService#loadAll()
	 */
	public List<TimeCard> loadAll() throws EmsException {
		try {
			return timeCardDao.loadAll();
		} catch (DataAccessException e) {
			e.printStackTrace();
			throw new EmsException("Error retrieving time cards",e);
		}
	}

	/* (non-Javadoc)
	 * @see com.exist.ems.service.timecard.TimeCardService#save(com.exist.ems.model.TimeCard)
	 */
	public void save(TimeCard timeCard) throws EmsException {
		try {
			timeCardDao.save(timeCard);
		} catch (DataAccessException e) {
		    	e.printStackTrace();
			throw new EmsException("Error saving time card",e);
		}
	}

	public void saveTimeIn(String empCode) throws EmsException {
		//checkEmployee(empCode);
		TimeCard timeIn = new TimeCard();
		timeIn.setEmpCode(empCode);
		timeIn.setTimeIn(Calendar.getInstance().getTime());
		timeIn.setTimesheetDate(new Date());
		
		try
		{
		    save(timeIn);
		} catch (Exception e)
		{
		    e.printStackTrace();
		    throw new EmsException(e.getMessage(), e);
		}
	}

	public void saveTimeOut(String empCode) throws EmsException {
		
		//checkEmployeeTimecard(empCode);
		TimeCard timeOut = timeCardDao.getCurrentTimeCard(empCode);
		timeOut.setTimeOut(Calendar.getInstance().getTime());
		
		try
		{
		    save(timeOut);
		} catch (Exception e)
		{
		    e.printStackTrace();
		    throw new EmsException(e.getMessage(), e);
		}
	}

	
	private void checkEmployeeTimecard(String empCode) throws EmsException
	{
		final TimeCard cardCheck = timeCardDao.getCurrentTimeCard(empCode);
		
		if(cardCheck == null)
		{
			throw new EmsException("Employee has no Time In");
		}
	}

	public List<TimeCard> listCurrentWeekLog(String empCode)
		throws DataAccessException
	{
	    final Date currentDate = new Date();
	    int numOfDays = DateUtils.numberDaysAfter(currentDate) - 1;
	    if(numOfDays != 0)
	    {
		numOfDays = -numOfDays;
	    }
	    
	    final Date from = DateUtils.getDateInterval(currentDate, Calendar.DATE, numOfDays);
	    List<TimeCard> result = timeCardDao.getWeekLog(empCode, from, currentDate);
	    return result;
	}

	public List<TimeCard> listPreviousWeekLog(String empCode)
		throws DataAccessException
	{
	    final Date currentDate = new Date();
	    int numOfDays = DateUtils.numberDaysAfter(currentDate) - 1;
	    if(numOfDays != 0)
	    {
		numOfDays = -numOfDays;
	    }
	    
	    // current week
	    final Date currentWeek = DateUtils.getDateInterval(currentDate, Calendar.DATE, numOfDays);
	    // previous weeks
	    final Date fromLastWeek = DateUtils.getDateInterval(currentWeek, Calendar.DATE, -7);
	    final Date toLastWeek = DateUtils.getDateInterval(fromLastWeek, Calendar.DATE, 6);
	    
	    return timeCardDao.getWeekLog(empCode, fromLastWeek, toLastWeek);
	}

	/* (non-Javadoc)
	 * @see com.exist.ems.service.timecard.TimeCardService#countReportsLog(java.lang.String, java.util.Date, java.util.Date)
	 */
	public int countReportsLog(ReportVO reportVO)
			throws DataAccessException
	{
		return timeCardDao.countReportsLog(reportVO.getEmpCode(), reportVO.getFromDate(), reportVO.getToDate());
	}

	/* (non-Javadoc)
	 * @see com.exist.ems.service.timecard.TimeCardService#listReportsLog(java.lang.String, java.util.Date, java.util.Date, int, int)
	 */
	public List<TimeCard> listReportsLog(ReportVO reportVO) throws DataAccessException
	{
		
		return timeCardDao.listReportsLog(reportVO.getEmpCode(), reportVO.getFromDate(), 
										  reportVO.getToDate(), reportVO.getFirst(),
										  reportVO.getCount());
	}

}
