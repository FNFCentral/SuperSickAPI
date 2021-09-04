package;

import js.Browser;
import js.html.MessageEvent;

/**
 * Communicates to the server that the API is ready to recieve game info.
**/
class Register {
    static public function register() {
        sendRegistration();
        listenForGameInfo();
    }

    static function sendRegistration() {
        var parentWindow = Util.getParent();

        parentWindow.postMessage({purpose: "register"}, "fnfcentral.com");
    }

    static function listenForGameInfo() {
        Browser.window.onmessage = setData;
    }

    static function setData(event: MessageEvent) {
        trace("Message Recieved!  From:" + event);

        if (event.origin != "http://fnfcentral.com" || event.origin != "https://fnfcentral.com")
            return;

        if (event.data.purpose = "set-ID-data")

        Info.songIDs = event.data.songIDs;
        Info.difficultyIDs = event.data.difficultyIDs;
        trace("Set Info From:" + event.data);
    }
}