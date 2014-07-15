<!-- saved from url=(0014)about:internet -->
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<html lang="en">

<!-- 
Smart developers always View Source. 
This application was built using Adobe Flex, an open source framework
for building rich Internet applications that get delivered via the
Flash Player or to desktops via Adobe AIR. 
Learn more about Flex at http://flex.org 
// -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script src="AC_OETags.js" language="javascript"></script>
<style>
body { margin: 0px; overflow:hidden }
</style>
<script language="JavaScript" type="text/javascript">

<!--
// -----------------------------------------------------------------------------
// Globals
// Major version of Flash required
var requiredMajorVersion = 9;
// Minor version of Flash required
var requiredMinorVersion = 0;
// Minor version of Flash required
var requiredRevision = 28;
// -----------------------------------------------------------------------------
// -->
</script>
</head>
<%
    String websiteRoot =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>

<body scroll="no">
<script language="JavaScript" type="text/javascript">
<!--
// Version check for the Flash Player that has the ability to start Player Product Install (6.0r65)
var hasProductInstall = DetectFlashVer(6, 0, 65);
// Version check based upon the values defined in globals
var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);


// Check to see if a player with Flash Product Install is available and the version does not meet the requirements for playback
if ( hasProductInstall && !hasRequestedVersion ) {
	// MMdoctitle is the stored document.title value used by the installation process to close the window that started the process
	// This is necessary in order to close browser windows that are still utilizing the older version of the player after installation has completed
	// DO NOT MODIFY THE FOLLOWING FOUR LINES
	// Location visited after installation is complete if installation is required
	var MMPlayerType = (isIE == true) ? "ActiveX" : "PlugIn";
	var MMredirectURL = window.location;
    document.title = document.title.slice(0, 47) + " - Flash Player Installation";
    var MMdoctitle = document.title;
	AC_FL_RunContent(
		"src", "playerProductInstall",
		"FlashVars", "MMredirectURL="+MMredirectURL+'&MMplayerType='+MMPlayerType+'&MMdoctitle='+MMdoctitle+"",
		"width", "100%",
		"height", "100%",
		"align", "middle",
		"id", "MainApp",
		"quality", "high",
		"bgcolor", "#869ca7",
		"name", "MainApp",
		"allowScriptAccess","sameDomain",
		"type", "application/x-shockwave-flash",
		"pluginspage", "http://www.adobe.com/go/getflashplayer"	
	);
} else if (hasRequestedVersion) {
	// if we've detected an acceptable version
	// embed the Flash Content SWF when all tests are passed
	AC_FL_RunContent(
			"src", "MainApp",
			"width", "100%",
			"height", "100%",
			"align", "middle",
			"id", "MainApp",
			"quality", "high",
			"bgcolor", "#869ca7",
			"name", "MainApp",
			"allowScriptAccess","sameDomain",
			"type", "application/x-shockwave-flash",
			"pluginspage", "http://www.adobe.com/go/getflashplayer",
			"flashVars","websiteRoot=<%= websiteRoot %>"
	);
  } else {  // flash is too old or we can't detect the plugin
    var alternateContent = '本网站需要Flash9或更高版本的插件才能正常工作，请从官方网下载最新版本或者从本网站下载安装Flash9插件, '
   	+ '<li><a href=http://www.adobe.com/go/getflash/>从官方网站获取最新Flash插件</a>'
   	+'<br>'
   	+'<li><a href=/theme/plugin/Install Flash Player 9 ActiveX.exe>从本网站获取Flash9插件</a>';
    document.write(alternateContent);  // insert non-flash content
  }
// -->
</script>
<noscript>
  	<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
			id="MainApp" width="100%" height="100%"
			codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
			<param name="movie" value="MainApp" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#869ca7" />
			<param name="allowScriptAccess" value="sameDomain" />
			<param name='flashVars' value='websiteRoot=<%= websiteRoot %>' />
			<embed src="MainApp.swf" quality="high" bgcolor="#869ca7"
				width="100%" height="100%" name="MainApp" align="middle"
				play="true"
				loop="false"
				quality="high"
				allowScriptAccess="sameDomain"
				type="application/x-shockwave-flash"
				pluginspage="http://www.adobe.com/go/getflashplayer">
			</embed>
	</object>
</noscript>
</body>
</html>
