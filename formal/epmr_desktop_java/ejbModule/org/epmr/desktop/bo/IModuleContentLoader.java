package org.epmr.desktop.bo;

import java.util.List;
import java.util.Properties;

public interface IModuleContentLoader 
{
    Properties   getPorperties();
    List<Module>getModules();
    List<View> getViews();
    
}
