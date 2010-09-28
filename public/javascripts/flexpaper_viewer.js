<!-- For version detection, set to min. required Flash Player version, or 0 (or 0.0.0), for no version detection. --> 
var swfVersionStr = "10.0.0";
<!-- To use express install, set to playerProductInstall.swf, otherwise the empty string. -->
var xiSwfUrlStr = "playerProductInstall.swf";

var flashvars = { 
      SwfFile : escape($.trim($('#swf_file_name').text())),
Scale : 0.6, 
ZoomTransition : "easeOut",
ZoomTime : 0.5,
ZoomInterval : 0.1,
FitPageOnLoad : false,
FitWidthOnLoad : true,
PrintEnabled : true,
FullScreenAsMaxWindow : false,
ProgressiveLoading : true,

PrintToolsVisible : true,
ViewModeToolsVisible : true,
ZoomToolsVisible : true,
FullScreenVisible : true,
NavToolsVisible : true,
CursorToolsVisible : true,
SearchToolsVisible : true,

localeChain: "en_US"
};

var params = {

}
params.quality = "high";
params.bgcolor = "#ffffff";
params.allowscriptaccess = "sameDomain";
params.allowfullscreen = "true";
var attributes = {};
attributes.id = "FlexPaperViewer";
attributes.name = "FlexPaperViewer";
swfobject.embedSWF(
    "../flash/FlexPaperViewer.swf", "flashContent", 
    "935", "719",
    swfVersionStr, xiSwfUrlStr, 
    flashvars, params, attributes);
swfobject.createCSS("#flashContent", "display:block;text-align:left;");