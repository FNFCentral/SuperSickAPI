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
        if (event.origin != HTMLMessage.getTargetURL()) {
            trace("Message Recieved!  From Bad Origin: " + event.origin); 
            return;
        }

        trace("Message Recieved!  From Good Origin: " + event.origin + "\nWith Purpose: " + event.data.purpose);

        switch (event.data.purpose) {
            case "set_mod_data": Info.setModData(event.data);

            case "set_score_data": Info.setScoreData(event.data);

            case "set_extra_info": Info.setExtraInfo(event.data);

            case "set_settings": Info.setSettingData(event.data);

            default: trace("Unknown Message Purpose: " + event.data.purpose);
        }
    }
}