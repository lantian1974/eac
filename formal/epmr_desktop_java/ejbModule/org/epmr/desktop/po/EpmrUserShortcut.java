package org.epmr.desktop.po;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the EPMR_USER_SHORTCUTS database table.
 * 
 */
@Entity
@Table(name="EPMR_USER_SHORTCUTS")
public class EpmrUserShortcut implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;

	private String loginCode;

	private String postion;

	private String url;

    public EpmrUserShortcut() {
    }

	public long getId() {
		return this.id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getLoginCode() {
		return this.loginCode;
	}

	public void setLoginCode(String loginCode) {
		this.loginCode = loginCode;
	}

	public String getPostion() {
		return this.postion;
	}

	public void setPostion(String postion) {
		this.postion = postion;
	}

	public String getUrl() {
		return this.url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}