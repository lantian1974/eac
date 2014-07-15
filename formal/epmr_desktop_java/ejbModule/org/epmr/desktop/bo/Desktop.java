package org.epmr.desktop.bo;

import java.util.List;

import org.epmr.desktop.po.EpmrUserShortcut;

public class Desktop 
{
   private String userLoginCode;
   private List<Module> viewModules;
   private boolean allowOpenViewMultiInstance;
   private List<EpmrUserShortcut> shortcuts;
}
