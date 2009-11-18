/**
 * 
 */
package com.exist.ems.dao.employee;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.exist.ems.model.Employee;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 12 - 17:02:09
 * 
 */
public class EmployeeDaoImpl extends HibernateDaoSupport implements EmployeeDao {

	/* (non-Javadoc)
	 * @see com.exist.ems.dao.employee.EmployeeDao#login(java.lang.String, java.lang.String)
	 */
	public Employee login(String username, String password)
			throws DataAccessException {
		
		final Criteria crit = this.getSession().createCriteria(Employee.class);
		crit.add(Restrictions.eq("username", username));
		crit.add(Restrictions.eq("password", password));
		
		return (Employee) crit.uniqueResult();
	}

	/*
	 * (non-Javadoc)
	 * @see com.exist.ems.dao.employee.EmployeeDao#getEmployeeByEmpCode(java.lang.String)
	 */
	public Employee getEmployeeByEmpCode(String empcode)
			throws DataAccessException {
		final Criteria crit = this.getSession().createCriteria(Employee.class);
		crit.add(Restrictions.eq("empCode", empcode));
		
		return (Employee) crit.uniqueResult();
	}

	/*
	 * (non-Javadoc)
	 * @see com.exist.ems.dao.employee.EmployeeDao#save(com.exist.ems.model.Employee)
	 */
	public void save(Employee employee) throws DataAccessException
	{
	    getHibernateTemplate().save(employee);
	}

}
