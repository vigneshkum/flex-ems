/**
 * 
 */
package com.exist.ems.dao.timecard;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.exist.ems.model.TimeCard;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 11 - 14:19:17
 * 
 */
public class TimeCardDaoImpl extends HibernateDaoSupport implements TimeCardDao
{

	public void save(TimeCard timeCard) throws DataAccessException
	{
		getHibernateTemplate().saveOrUpdate(timeCard);
	}

	@SuppressWarnings("unchecked")
	public List<TimeCard> loadAll() throws DataAccessException
	{
		return getHibernateTemplate().loadAll(TimeCard.class);
	}

	public TimeCard getCurrentTimeCard(String empCode)
			throws DataAccessException
	{

		final Criteria crit = this.getSession().createCriteria(TimeCard.class);
		crit.add(Restrictions.eq("empCode", empCode));
		crit.add(Restrictions.eq("timesheetDate", new Date()));

		return (TimeCard) crit.uniqueResult();
	}

	@SuppressWarnings("unchecked")
	public List<TimeCard> getWeekLog(String empCode, Date from, Date to)
			throws DataAccessException
	{
		final Criteria crit = this.getSession().createCriteria(TimeCard.class);
		crit.add(Restrictions.eq("empCode", empCode));
		crit.add(Restrictions.between("timesheetDate", from, to));

		return crit.list();
	}

	/* (non-Javadoc)
	 * @see com.exist.ems.dao.timecard.TimeCardDao#countReportsLog(java.lang.String, java.util.Date, java.util.Date)
	 */
	public int countReportsLog(String empCode, Date from, Date to)
			throws DataAccessException
	{
		final Criteria crit = this.getSession().createCriteria(TimeCard.class);
		crit.setProjection(Projections.rowCount());
		crit.add(Restrictions.eq("empCode", empCode));
		crit.add(Restrictions.between("timesheetDate", from, to));
		
		return (Integer) crit.uniqueResult();
	}

	/* (non-Javadoc)
	 * @see com.exist.ems.dao.timecard.TimeCardDao#listReportsLog(java.lang.String, java.util.Date, java.util.Date, int, int)
	 */
	@SuppressWarnings("unchecked")
	public List<TimeCard> listReportsLog(String empCode, Date from, Date to,
			int first, int max) throws DataAccessException
	{
		final Criteria crit = this.getSession().createCriteria(TimeCard.class);
		crit.add(Restrictions.eq("empCode", empCode));
		crit.add(Restrictions.between("timesheetDate", from, to));
		crit.setFirstResult(first).setMaxResults(max);
		
		return crit.list();
	}

}
