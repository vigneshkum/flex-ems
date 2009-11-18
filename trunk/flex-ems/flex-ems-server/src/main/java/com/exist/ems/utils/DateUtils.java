/**
 * 
 */
package com.exist.ems.utils;

import java.util.Calendar;
import java.util.Date;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 14 - 00:44:50
 * 
 */
public final class DateUtils
{

    /**
     * Get the date interval after calculations.
     * Time is shifted to 00:00:00
     * @param date - date to be manipulated
     * @param field - date field to be manipulated
     * @param amount - the amount to be added/subtracted
     * @return Date
     */
    public static Date getDateInterval(Date date,int field,int amount)
    {
	Calendar cdr = Calendar.getInstance();
	cdr.setTime(date);
	cdr.set(cdr.get(Calendar.YEAR), cdr.get(Calendar.MONTH), cdr
		.get(Calendar.DAY_OF_MONTH), 0, 0, 0);
	if(amount != 0)
	{
	    cdr.add(Calendar.DATE, amount);
	}
	return cdr.getTime();
    }
    
    /**
     * Get the DAY_OF_WEEK of the current date
     * @param date
     * @return
     */
    public static int numberDaysAfter(Date date)
    {
	Calendar cdr = Calendar.getInstance();
	cdr.setTime(date);
	return cdr.get(Calendar.DAY_OF_WEEK);
    }
    
    private DateUtils()
    {
    }
}
