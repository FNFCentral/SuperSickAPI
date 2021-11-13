package html;

import js.Browser;

/**
 * Manages Messages For An HTML Game
**/
class HTMLMessage {
    public static function sendMessage(message: Dynamic) {
        getParent().postMessage(message, getTargetURL());
    }

    public static function getParent() {
        var parentWindow = Browser.window.parent;

        return parentWindow;
    }

    public static function getTargetURL() {
        var target;

        #if local
        target = "https://local.fnfcentral.com";
        #elseif canary
        target = "https://canary.fnfcentral.com";
        #else 
        target = "https://fnfcentral.com";
        #end

        return target;
    }
}