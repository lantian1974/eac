package org.epmr.desktop.respository;

import java.util.List;

import org.epmr.desktop.po.EpmrUserShortcut;

public interface IEpmrUserShortcutDao 
{
   List<EpmrUserShortcut> getUserShortcuts(String loginCode);
   /**
    *在业务层有一个业务规则： 一个用户不能超过100个快捷方式，一旦超过系统认为快捷方式就不快捷了。
    *因此，这里可以放心操作用户的快捷方式。
    * @param shortcutList  被保存的用户快捷方式列表。
    */
   void saveUserShortcuts(String loginCode,List<EpmrUserShortcut> shortcutList);
   
}
