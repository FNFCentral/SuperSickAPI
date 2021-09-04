package;

import js.Browser;

/**
 * A whole lotta utils  
**/
class Util {
    public static function getParent() {
        var parentWindow = Browser.window.parent;

        return parentWindow;
    }

    public static function getTargetURL() {
        if (Browser.location.protocol == "http:") return "http://fnfcentral.com";

        return "https://fnfcentral.com";
    }
}   