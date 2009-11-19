/**
 * 
 */
package com.exist.ems.service.employee;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.exist.ems.dao.employee.EmployeeDao;
import com.exist.ems.exception.EmsException;
import com.exist.ems.model.Employee;

import flex.contrib.stereotypes.RemotingDestination;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 12 - 17:06:02
 * 
 */
@Service("userService")
@RemotingDestination
public class EmployeeServiceImpl implements EmployeeService
{

    @Autowired
    private EmployeeDao employeeDao;

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.exist.ems.service.employee.Employeeservice#login(java.lang.String,
     * java.lang.String)
     */
    public Map<String, String> login(String username, String password)
	    throws EmsException
    {
	Map<String, String> creds = null;
	final Employee emp = employeeDao.login(username, DigestUtils.md5Hex(password));
	if (emp != null)
	{
	    creds = new HashMap<String, String>();
	    creds.put("empCode", emp.getEmpCode());
	    creds.put("firstName", emp.getFirstName());
	    creds.put("lastName", emp.getLastName());
	}
	return creds;
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.exist.ems.service.employee.Employeeservice#save(com.exist.ems.model
     * .Employee)
     */
    public void save(Employee employee) throws EmsException
    {
	final String md5pass = DigestUtils.md5Hex(employee.getPassword());
	employee.setPassword(md5pass);
	try
	{
	    employeeDao.save(employee);
	} catch (DataAccessException e)
	{
	    e.printStackTrace();
	    throw new EmsException(e.getMessage(), e);
	}
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.exist.ems.service.employee.Employeeservice#update(com.exist.ems.model
     * .Employee)
     */
    public void update(Employee employee) throws EmsException
    {
	// TODO Auto-generated method stub

    }

}
