




package
{
import flash.system.Security;
import flash.text.Font;
import mx.core.mx_internal;
import mx.modules.ModuleBase;
import mx.styles.CSSCondition;
import mx.styles.CSSSelector;
import mx.styles.CSSStyleDeclaration;
import mx.styles.StyleManager;
import mx.styles.IStyleManager2;
import mx.styles.IStyleModule;



[ExcludeClass]
public class xdfglobalStyle extends ModuleBase implements IStyleModule
{
    /**
     * @private
     */
    private var selectors:Array = [];
    /**
     * @private
     */
    private var overrideMap:Object = {};
    /**
     * @private
     */
    private var effectMap:Object = {};
    /**
     * @private
     */
    private var unloadGlobal:Boolean;
    /**
     * @private
     */
    private var styleManager:IStyleManager2;
    /**
     * @private
     */
    private static var domainsAllowed:Boolean = allowDomains();

    /**
     * @private
     */
    private static function allowDomains():Boolean
    {
		// allowDomain not allowed in AIR
		if (Security.sandboxType != "application")
			Security.allowDomain("*");
        return true;
    }
    

    public function xdfglobalStyle()
    {
        super();
    }
    
    public function setStyleDeclarations(styleManager:IStyleManager2):void
    {
        if (styleManager == null)
            styleManager = StyleManager.getStyleManager(null);

        this.styleManager = styleManager;
        
        var conditions:Array;
        var condition:CSSCondition;
        var selector:CSSSelector;
        var style:CSSStyleDeclaration;
        var keys:Array;
        var selectorString:String;
        var effects:Array;
        var addedEffects:Array;

        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.Tree", conditions, selector);
        // mx.controls.Tree
        selectorString = "mx.controls.Tree";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('color', 0x000000);
        keys.push("color");
        style.mx_internal::setLocalStyle('fontSize', 12);
        keys.push("fontSize");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "xdfPopuPanle");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .xdfPopuPanle
        selectorString = ".xdfPopuPanle";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('backgroundColor', 0xffffff);
        keys.push("backgroundColor");
        style.mx_internal::setLocalStyle('shadowDistance', 5);
        keys.push("shadowDistance");
        style.mx_internal::setLocalStyle('cornerRadius', 8);
        keys.push("cornerRadius");
        style.mx_internal::setLocalStyle('borderAlpha', 0xffffff);
        keys.push("borderAlpha");
        style.mx_internal::setLocalStyle('borderThicknessTop', 0);
        keys.push("borderThicknessTop");
        style.mx_internal::setLocalStyle('titleStyleName', "myTitleWindowsTitle");
        keys.push("titleStyleName");
        style.mx_internal::setLocalStyle('shadowDirection', "right");
        keys.push("shadowDirection");
        style.mx_internal::setLocalStyle('borderThicknessBottom', 0);
        keys.push("borderThicknessBottom");
        style.mx_internal::setLocalStyle('borderThicknessRight', 0);
        keys.push("borderThicknessRight");
        style.mx_internal::setLocalStyle('highlightAlphas', [0.48, 0.08]);
        keys.push("highlightAlphas");
        style.mx_internal::setLocalStyle('headerColors', [0x2b9df3, 0x0a83e8]);
        keys.push("headerColors");
        style.mx_internal::setLocalStyle('borderThicknessLeft', 0);
        keys.push("borderThicknessLeft");
        style.mx_internal::setLocalStyle('footerColors', [0xffffff, 0xffffff]);
        keys.push("footerColors");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "myTitleWindowsTitle");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .myTitleWindowsTitle
        selectorString = ".myTitleWindowsTitle";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('fontWeight', "bold");
        keys.push("fontWeight");
        style.mx_internal::setLocalStyle('color', 0xffffff);
        keys.push("color");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "myTabs");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .myTabs
        selectorString = ".myTabs";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('backgroundColor', 0xffffff);
        keys.push("backgroundColor");
        style.mx_internal::setLocalStyle('letterSpacing', 0);
        keys.push("letterSpacing");
        style.mx_internal::setLocalStyle('cornerRadius', 3);
        keys.push("cornerRadius");
        style.mx_internal::setLocalStyle('highlightAlphas', [1, 0]);
        keys.push("highlightAlphas");
        style.mx_internal::setLocalStyle('fontSize', 12);
        keys.push("fontSize");
        style.mx_internal::setLocalStyle('fillColors', [0xffffff, 0xdcf0fe]);
        keys.push("fillColors");
        style.mx_internal::setLocalStyle('backgroundAlpha', 1);
        keys.push("backgroundAlpha");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "mySelectedTabs");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .mySelectedTabs
        selectorString = ".mySelectedTabs";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('fontWeight', "bold");
        keys.push("fontWeight");
        style.mx_internal::setLocalStyle('color', 0x0068b0);
        keys.push("color");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "xdfbox");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .xdfbox
        selectorString = ".xdfbox";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('backgroundColor', 0xf3f3f3);
        keys.push("backgroundColor");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "xdfleibielablefont");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .xdfleibielablefont
        selectorString = ".xdfleibielablefont";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('color', 0x40acfe);
        keys.push("color");
        style.mx_internal::setLocalStyle('fontSize', 12);
        keys.push("fontSize");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "myAlert");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .myAlert
        selectorString = ".myAlert";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('fontWeight', "bold");
        keys.push("fontWeight");
        style.mx_internal::setLocalStyle('color', 0xffffff);
        keys.push("color");
        style.mx_internal::setLocalStyle('fontSize', 12);
        keys.push("fontSize");



        selector = null;
        conditions = null;
        conditions = [];
        condition = new CSSCondition("class", "errorTip");
        conditions.push(condition); 
        selector = new CSSSelector("", conditions, selector);
        // .errorTip
        selectorString = ".errorTip";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('fontSize', 12);
        keys.push("fontSize");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.containers.TitleWindow", conditions, selector);
        // mx.containers.TitleWindow
        selectorString = "mx.containers.TitleWindow";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('backgroundColor', 0xffffff);
        keys.push("backgroundColor");
        style.mx_internal::setLocalStyle('shadowDistance', 5);
        keys.push("shadowDistance");
        style.mx_internal::setLocalStyle('cornerRadius', 8);
        keys.push("cornerRadius");
        style.mx_internal::setLocalStyle('borderAlpha', 0xffffff);
        keys.push("borderAlpha");
        style.mx_internal::setLocalStyle('borderThicknessTop', 0);
        keys.push("borderThicknessTop");
        style.mx_internal::setLocalStyle('titleStyleName', "myTitleWindowsTitle");
        keys.push("titleStyleName");
        style.mx_internal::setLocalStyle('shadowDirection', "right");
        keys.push("shadowDirection");
        style.mx_internal::setLocalStyle('borderThicknessBottom', 0);
        keys.push("borderThicknessBottom");
        style.mx_internal::setLocalStyle('borderThicknessRight', 0);
        keys.push("borderThicknessRight");
        style.mx_internal::setLocalStyle('highlightAlphas', [0.48, 0.08]);
        keys.push("highlightAlphas");
        style.mx_internal::setLocalStyle('headerColors', [0x2b9df3, 0x0a83e8]);
        keys.push("headerColors");
        style.mx_internal::setLocalStyle('borderThicknessLeft', 0);
        keys.push("borderThicknessLeft");
        style.mx_internal::setLocalStyle('footerColors', [0xffffff, 0xffffff]);
        keys.push("footerColors");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.DataGrid", conditions, selector);
        // mx.controls.DataGrid
        selectorString = "mx.controls.DataGrid";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('color', 0x000000);
        keys.push("color");
        style.mx_internal::setLocalStyle('headerColors', [0xdcf0fe, 0xffffff]);
        keys.push("headerColors");
        style.mx_internal::setLocalStyle('themeColor', 0x86ccfc);
        keys.push("themeColor");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.Button", conditions, selector);
        // mx.controls.Button
        selectorString = "mx.controls.Button";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('fontWeight', "normal");
        keys.push("fontWeight");
        style.mx_internal::setLocalStyle('color', 0x0b333c);
        keys.push("color");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.ComboBox", conditions, selector);
        // mx.controls.ComboBox
        selectorString = "mx.controls.ComboBox";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('height', 22);
        keys.push("height");
        style.mx_internal::setLocalStyle('width', 100);
        keys.push("width");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.TextInput", conditions, selector);
        // mx.controls.TextInput
        selectorString = "mx.controls.TextInput";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('borderStyle', "solid");
        keys.push("borderStyle");
        style.mx_internal::setLocalStyle('borderColor', 0xa8d9fe);
        keys.push("borderColor");
        style.mx_internal::setLocalStyle('backgroundColor', 0xfffff6);
        keys.push("backgroundColor");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.containers.TabNavigator", conditions, selector);
        // mx.containers.TabNavigator
        selectorString = "mx.containers.TabNavigator";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('firstTabStyleName', "myTabs");
        keys.push("firstTabStyleName");
        style.mx_internal::setLocalStyle('selectedTabTextStyleName', "mySelectedTabs");
        keys.push("selectedTabTextStyleName");
        style.mx_internal::setLocalStyle('tabStyleName', "myTabs");
        keys.push("tabStyleName");
        style.mx_internal::setLocalStyle('lastTabStyleName', "myTabs");
        keys.push("lastTabStyleName");
        style.mx_internal::setLocalStyle('borderThickness', 1);
        keys.push("borderThickness");
        style.mx_internal::setLocalStyle('textIndent', 0);
        keys.push("textIndent");
        style.mx_internal::setLocalStyle('horizontalGap', 1);
        keys.push("horizontalGap");
        style.mx_internal::setLocalStyle('themeColor', 0x009dff);
        keys.push("themeColor");
        style.mx_internal::setLocalStyle('paddingLeft', 1);
        keys.push("paddingLeft");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.Alert", conditions, selector);
        // mx.controls.Alert
        selectorString = "mx.controls.Alert";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('borderColor', 0x7d7d7d);
        keys.push("borderColor");
        style.mx_internal::setLocalStyle('backgroundColor', 0xf6f6f6);
        keys.push("backgroundColor");
        style.mx_internal::setLocalStyle('cornerRadius', 3);
        keys.push("cornerRadius");
        style.mx_internal::setLocalStyle('fontSize', 12);
        keys.push("fontSize");
        style.mx_internal::setLocalStyle('borderAlpha', 1);
        keys.push("borderAlpha");
        style.mx_internal::setLocalStyle('backgroundAlpha', 1);
        keys.push("backgroundAlpha");
        style.mx_internal::setLocalStyle('borderThicknessTop', 1);
        keys.push("borderThicknessTop");
        style.mx_internal::setLocalStyle('paddingLeft', 2);
        keys.push("paddingLeft");
        style.mx_internal::setLocalStyle('titleStyleName', "myAlert");
        keys.push("titleStyleName");
        style.mx_internal::setLocalStyle('modalTransparency', 0);
        keys.push("modalTransparency");
        style.mx_internal::setLocalStyle('modalTransparencyBlur', 0);
        keys.push("modalTransparencyBlur");
        style.mx_internal::setLocalStyle('borderThicknessBottom', 1);
        keys.push("borderThicknessBottom");
        style.mx_internal::setLocalStyle('borderThicknessRight', 1);
        keys.push("borderThicknessRight");
        style.mx_internal::setLocalStyle('color', 0x0b333c);
        keys.push("color");
        style.mx_internal::setLocalStyle('borderThickness', 1);
        keys.push("borderThickness");
        style.mx_internal::setLocalStyle('headerColors', [0x0000ff, 0x00ffff]);
        keys.push("headerColors");
        style.mx_internal::setLocalStyle('highlightAlphas', [0, 0.24]);
        keys.push("highlightAlphas");
        style.mx_internal::setLocalStyle('textAlign', "left");
        keys.push("textAlign");
        style.mx_internal::setLocalStyle('borderThicknessLeft', 1);
        keys.push("borderThicknessLeft");



        selector = null;
        conditions = null;
        conditions = null;
        selector = new CSSSelector("mx.controls.ToolTip", conditions, selector);
        // mx.controls.ToolTip
        selectorString = "mx.controls.ToolTip";
        style = styleManager.getStyleDeclaration(selectorString);
        if (!style)
        {
            style = new CSSStyleDeclaration(selector, styleManager);
            selectors.push(selectorString);
        }

        keys = overrideMap[selectorString];

        if (keys == null)
        {
            keys = [];
            overrideMap[selectorString] = keys;
        }

        style.mx_internal::setLocalStyle('fontSize', 12);
        keys.push("fontSize");




    }

    public function unload():void
    {
        unloadOverrides();
        unloadStyleDeclarations();

        if (unloadGlobal)
        {
            styleManager.stylesRoot = null;
            styleManager.initProtoChainRoots();
        }
    }

    /**
     * @private
     */
    private function unloadOverrides():void
    {
        for (var selector:String in overrideMap)
        {
            var style:CSSStyleDeclaration = styleManager.getStyleDeclaration(selector);

            if (style != null)
            {
                var keys:Array = overrideMap[selector];
                var numKeys:int;
                var i:uint;

                if (keys != null)
                {
                    numKeys = keys.length;

                    for (i = 0; i < numKeys; i++)
                    {
                        style.mx_internal::clearOverride(keys[i]);
                    }
                }

                keys = effectMap[selector];

                if (keys != null)
                {
                    numKeys = keys.length;
                    var index:uint;
                    var effects:Array = style.mx_internal::effects;

                    for (i = 0; i < numKeys; i++)
                    {
                        index = effects.indexOf(numKeys[i]);
                        if (index >= 0)
                        {
                            effects.splice(index, 1);
                        }
                    }                    
                }
            }
        }

        overrideMap = null;
        effectMap = null;
    }

    /**
     * @private
     */
    private function unloadStyleDeclarations():void
    {
        var numSelectors:int = selectors.length;

        for (var i:int = 0; i < numSelectors; i++)
        {
            var selector:String = selectors[i];
            styleManager.clearStyleDeclaration(selector, false);
        }

        selectors = null;
    }
}

}
