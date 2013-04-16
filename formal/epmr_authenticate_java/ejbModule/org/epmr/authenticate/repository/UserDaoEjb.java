package org.epmr.authenticate.repository;

import java.util.List;

import javax.ejb.Stateless;
import javax.inject.Named;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.epmr.authenticate.po.EpmrUser;

@Stateless
@Named
public class UserDaoEjb  implements IUserDao
{
	@PersistenceContext(unitName="epmr_authenticate_java")
	private EntityManager em;
	
	@Override
	public EpmrUser getUser(String loginCode) 
	{

		Query q=em.createQuery(" select  user from  EpmrUser user where user.loginCode=:loginCode", EpmrUser.class);
		q.setParameter("loginCode", loginCode);
		EpmrUser user=(EpmrUser)q.getSingleResult();
		return user;
	}

	@Override
	public EpmrUser getUser(String loginCode, String password) 
	{
		Query q=em.createQuery(" select  user from EpmrUser user where user.loginCode=:loginCode and user.password=:password", EpmrUser.class);
		q.setParameter("loginCode", loginCode).setParameter("password", password);
		EpmrUser user=(EpmrUser)q.getSingleResult();
		return user;
	}
	
	@Override
	public List<EpmrUser> getAllUsers() {
		Query q=em.createQuery(" select  user from  EpmrUser user ", EpmrUser.class);
		List<EpmrUser> result=q.getResultList();
		return result;
	}
}
