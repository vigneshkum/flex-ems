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
 * 
 * @author Emmanuel Nollase emanux
 * @created 2009 11 11 - 13:43:01
 * 
 */
@Entity
@Proxy(lazy = false)
@Table(name = "tbl_employee")
public class Employee implements Serializable
{

    @Id()
    @GeneratedValue(generator = "system-uuid")
    @GenericGenerator(name = "system-uuid", strategy = "uuid")
    @Column(name = "id", length = 32)
    private String id;

    @Basic
    @Column(length = 20)
    private String empCode;

    @Basic
    @Column(length = 35)
    private String position;

    @Basic
    @Column(length = 3)
    private String jobLevel;

    @Basic
    @Column(length = 35)
    private String firstName;

    @Basic
    @Column(length = 35)
    private String lastName;

    @Basic
    @Column
    @Temporal(TemporalType.DATE)
    private Date birthDate;

    @Basic
    @Column
    @Temporal(TemporalType.DATE)
    private Date dateHired;

    @Basic
    @Column(length = 32)
    private String username;

    @Basic
    @Column(length = 35)
    private String password;

    @Basic
    @Column(length = 35)
    private String email;

    public String getId()
    {
	return id;
    }

    public String getEmpCode()
    {
	return empCode;
    }

    public String getPosition()
    {
	return position;
    }

    public String getJobLevel()
    {
	return jobLevel;
    }

    public String getFirstName()
    {
	return firstName;
    }

    public String getLastName()
    {
	return lastName;
    }

    public Date getBirthDate()
    {
	return birthDate;
    }

    public Date getDateHired()
    {
	return dateHired;
    }

    public String getUsername()
    {
	return username;
    }

    public String getPassword()
    {
	return password;
    }

    public String getEmail()
    {
	return email;
    }

    public void setId(String id)
    {
	this.id = id;
    }

    public void setEmpCode(String empCode)
    {
	this.empCode = empCode;
    }

    public void setPosition(String position)
    {
	this.position = position;
    }

    public void setJobLevel(String jobLevel)
    {
	this.jobLevel = jobLevel;
    }

    public void setFirstName(String firstName)
    {
	this.firstName = firstName;
    }

    public void setLastName(String lastName)
    {
	this.lastName = lastName;
    }

    public void setBirthDate(Date birthDate)
    {
	this.birthDate = birthDate;
    }

    public void setDateHired(Date dateHired)
    {
	this.dateHired = dateHired;
    }

    public void setUsername(String username)
    {
	this.username = username;
    }

    public void setPassword(String password)
    {
	this.password = password;
    }

    public void setEmail(String email)
    {
	this.email = email;
    }

    @Override
    public boolean equals(Object obj)
    {
	return EqualsBuilder.reflectionEquals(this, obj);
    }

    
}
