/**
 * 
 */
package com.exist.ems.dao.employee;

import org.springframework.dao.DataAccessException;

import com.exist.ems.model.Employee;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 12 - 17:01:02
 * 
 */
public interface EmployeeDao
{

    void save(Employee employee) throws DataAccessException;

    Employee login(String username, String password) throws DataAccessException;

    Employee getEmployeeByEmpCode(String empcode) throws DataAccessException;
}
