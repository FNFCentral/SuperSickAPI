package html;

import js.Browser;
import js.html.MessageEvent;

/**
 * Manages Registration For An HTML Game
**/
class HTMLRegister {
    static public function register() {
        sendRegistration();
        Browser.window.onmessage = listenForMessages;
    }

    static function sendRegistration() {
        var parentWindow = HTMLMessage.getParent();

        parentWindow.postMessage({purpose: "register"}, HTMLMessage.getTargetURL());
    }

    static function listenForMessages(event: MessageEvent) {
        trace("Message Recieved!  From: " + event.origin);

        if (event.origin != HTMLMessage.getTargetURL())
            return;

        if (event.data.purpose = "set_mod_data") Info.setModData(event.data);

        if (event.data.purpose = "set_score_data") Info.setScoreData(event.data);
    }
}