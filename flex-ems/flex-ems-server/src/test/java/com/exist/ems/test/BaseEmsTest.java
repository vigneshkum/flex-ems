/**
 * 
 */
package com.exist.ems.test;

import org.springframework.test.AbstractDependencyInjectionSpringContextTests;

/**
 * @author Emmanuel Nollase emanux
 * @created 2009 11 18 - 09:37:11
 * 
 */
public abstract class BaseEmsTest extends AbstractDependencyInjectionSpringContextTests
{

    @Override
    protected String[] getConfigLocations()
    {
        return new String[] {"classpath:applicationContext.xml"};
    }
}
