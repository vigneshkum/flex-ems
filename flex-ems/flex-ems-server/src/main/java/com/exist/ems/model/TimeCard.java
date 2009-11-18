/**
 * 
 */
package com.exist.ems.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Proxy;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 11 - 13:59:25
 * 
 */
@Entity
@Proxy(lazy = false)
@Table(name = "tbl_timecard")
public class TimeCard implements Serializable {

	@Id()
	@GeneratedValue(generator = "system-uuid")
	@GenericGenerator(name = "system-uuid", strategy = "uuid")
	@Column(name = "id", length = 32)
	private String id;

	@Basic
	@Column(length = 20)
	private String empCode;
	
	@Basic
	@Column
	@Temporal(TemporalType.DATE)
	private Date timesheetDate;
	
	@Basic
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeIn;
	
	@Basic
	@Column
	@Temporal(TemporalType.TIMESTAMP)
	private Date timeOut;
	
	@Basic
	@Column
	private String remarks;

	public String getId() {
		return id;
	}

	public String getEmpCode() {
		return empCode;
	}

	public Date getTimesheetDate() {
		return timesheetDate;
	}

	public Date getTimeIn() {
		return timeIn;
	}

	public Date getTimeOut() {
		return timeOut;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public void setTimesheetDate(Date timesheetDate) {
		this.timesheetDate = timesheetDate;
	}

	public void setTimeIn(Date timeIn) {
		this.timeIn = timeIn;
	}

	public void setTimeOut(Date timeOut) {
		this.timeOut = timeOut;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public boolean equals(Object obj) {
		
		return EqualsBuilder.reflectionEquals(this, obj);
	}
	
}
