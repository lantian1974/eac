package org.epmr.authenticate.bo;

import java.io.Serializable;

import org.epmr.authenticate.po.EpmrUser;

public class User implements IUser , Serializable
{
    /**
	 * 
	 */
	private static final long serialVersionUID = -1299788111154224999L;
	private   UserType _userType=null;
	public User(EpmrUser userPo,UserType ut)
    {
    	this.userPo=userPo;
    	this._userType=ut;
    }
	private final   EpmrUser userPo;
	@Override
	public String getLoginCode() {
		return this.userPo.getLoginCode();
	}

	@Override
	public String getFirstName() {
	    return this.userPo.getFirstName();
	}

	@Override
	public String getLastName() {
		// TODO Auto-generated method stub
		return this.userPo.getLastName();
	}

	@Override
	public String getPrefix() {
		// TODO Auto-generated method stub
		return this.userPo.getPrefix();
	}

	@Override
	public String getErpPersonId() {
		// TODO Auto-generated method stub
		return this.userPo.getErpPersonId();
	}

	@Override
	public String getEmail() {
		// TODO Auto-generated method stub
		return this.userPo.getEmail();
	}

	@Override
	public String getOfficePhone() {
		// TODO Auto-generated method stub
		return this.userPo.getOfficePhone();
	}

	@Override
	public String getMobilePhone() {
		// TODO Auto-generated method stub
		return this.userPo.getMobilePhone();
	}

	@Override
	public String getMsnNumber() {
		// TODO Auto-generated method stub
		return this.userPo.getMsnNumber();
	}

	@Override
	public String getQqNumber() {
		// TODO Auto-generated method stub
		return this.userPo.getQqNumber();
	}

	@Override
	public UserType getUserType() {
		// TODO Auto-generated method stub
		return this._userType;
	}

	@Override
	public boolean isEnabled() {
		return this.userPo.getEnabled()==1?true:false;
	}
}
