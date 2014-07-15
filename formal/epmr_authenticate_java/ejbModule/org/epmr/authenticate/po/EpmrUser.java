package org.epmr.authenticate.po;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * The persistent class for the EPMR_USER database table.
 * 
 */
@Entity
@Table(name="EPMR_USER")
public class EpmrUser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private String loginCode;

	private String email;

	private short enabled;

	private String erpPersonId;

	private String firstName;

	private String lastName;

	private String mobilePhone;

	private String officePhone;

	private String password;

	private String prefix;

	private String qqNumber;
	
	private String msnNumber;

	private short userType;

    public EpmrUser() {
    }

	public String getLoginCode() {
		return this.loginCode;
	}

	public void setLoginCode(String loginCode) {
		this.loginCode = loginCode;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public short getEnabled() {
		return this.enabled;
	}

	public void setEnabled(short enabled) {
		this.enabled = enabled;
	}

	public String getErpPersonId() {
		return this.erpPersonId;
	}

	public void setErpPersonId(String erpPersonId) {
		this.erpPersonId = erpPersonId;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMobilePhone() {
		return this.mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getOfficePhone() {
		return this.officePhone;
	}

	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPrefix() {
		return this.prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getQqNumber() {
		return this.qqNumber;
	}

	public void setQqNumber(String qqNumber) {
		this.qqNumber = qqNumber;
	}

	public String getMsnNumber() {
		return msnNumber;
	}

	public void setMsnNumber(String msnNumber) {
		this.msnNumber = msnNumber;
	}

	public short getUserType() {
		return this.userType;
	}

	public void setUserType(short userType) {
		this.userType = userType;
	}
}