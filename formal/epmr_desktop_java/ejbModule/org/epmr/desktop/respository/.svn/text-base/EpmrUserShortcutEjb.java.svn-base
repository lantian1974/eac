package org.epmr.desktop.respository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.epmr.desktop.po.EpmrUserShortcut;

public class EpmrUserShortcutEjb implements ILocalEpmrUserShortCutDao
{

	@PersistenceContext(unitName="epmr_desktop_java")
	private EntityManager em;
	@Override
	public List<EpmrUserShortcut> getUserShortcuts(String loginCode) 
	{
		Query q=em.createQuery(" select  shortcut from  EpmrUserShortcut shortcut where shortcut.loginCode=:loginCode", EpmrUserShortcut.class);
		q.setParameter("loginCode", loginCode);
		List<EpmrUserShortcut> result=q.getResultList();
		return result;
	}

	@Override
	public void saveUserShortcuts(String loginCode,List<EpmrUserShortcut> shortcutList)
	{
		Query q=em.createQuery(" delete  from  EpmrUserShortcut shortcut where shortcut.loginCode=:loginCode", EpmrUserShortcut.class);
		q.setParameter("loginCode", loginCode);
		q.executeUpdate();
		this.em.flush();
		
	}

}
