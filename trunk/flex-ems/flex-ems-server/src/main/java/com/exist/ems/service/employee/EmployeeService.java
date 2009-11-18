/**
 * 
 */
package com.exist.ems.service.employee;

import java.util.Map;

import com.exist.ems.exception.EmsException;
import com.exist.ems.model.Employee;
import com.exist.ems.service.EmsService;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 11 - 14:10:01
 * 
 */
public interface EmployeeService extends EmsService {

	void save(Employee employee) throws EmsException;
	
	void update(Employee employee) throws EmsException;
	
	Map<String, String> login(String username, String password) throws EmsException;
}
