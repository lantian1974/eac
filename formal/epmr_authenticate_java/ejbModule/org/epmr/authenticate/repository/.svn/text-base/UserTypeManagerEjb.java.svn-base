package org.epmr.authenticate.repository;

import javax.ejb.Singleton;

import org.epmr.authenticate.bo.UserType;
@Singleton
public class UserTypeManagerEjb implements IUserTypeManager {

	@Override
	public UserType getUsrType(short value) 
	{
		if (UserType.EMPLOYEE.ordinal()==value)
			return UserType.EMPLOYEE;
		else if (UserType.CUSTOMER.ordinal()==value)
			return  UserType.CUSTOMER;
		else if (UserType.PARTNER.ordinal()==value)
			return UserType.PARTNER;
		else if (UserType.SUPPLIER.ordinal()==value)
			return UserType.SUPPLIER;
		else if (UserType.SYSTEM.ordinal()==value)
			return UserType.SYSTEM;
		else 
		    throw new RuntimeException("error user type value");
	}

}
