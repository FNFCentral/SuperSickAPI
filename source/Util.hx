package;

/**
 * A whole lotta utils  
**/
class Util {
    public static function sendMessage(message: Dynamic) {
        #if html5
        html.HTMLMessage.sendMessage(message);
        #end
    }

    public static function calcDiffID(intenalSong: String, diff: Int): Null<Int> {
        var song = Info.songs.get(intenalSong);

        if (song != null) {
            var diffID = song.get(diff);

            if (diffID != null) {
                return diffID;
            }
        }

        return null;
    }

    public static function calcExtraInfoID(intenalName: String): Null<Int> {
        return Info.extraInfos.get(intenalName);
    }

    static public function getTopScoreSavedFromServer(song: String, diff: Int): Int {
        var diffID = calcDiffID(song, diff);

        if (diffID != null) {
            var score = Info.topScoresOnServer.get(diffID);

            trace("Looking For Top Score From Server For: " + song + " " + diff + "\nFound Diff ID of " + diffID + "\nFound Score: " + score);

            if (score != null) {
                return score;
            }
        }

        return 0;
    }

    static public function saveUserExtraInfo(internalName: String, value: Dynamic) {
        var extraInfoID = calcExtraInfoID(internalName);

        if (extraInfoID != null) {
            sendMessage({purpose: "save_extra_info", extraInfoID: extraInfoID, value: value});
            trace("Sent save request for Extra Info " + extraInfoID + " of value " + value);
        } else {
            trace("Attempted To Save Extra Info " + internalName + " which does not exist of value " + value);
        }
    }

    static public function getUserExtraInfoStringFromServer(internalName: String): String {
        var value = Info.userExtraInfosStringsOnServer.get(internalName);

        trace("Looking For Extra Info String From Server For: " + internalName + "\nFound Value of " + value);

        return value;
    }

    static public function getUserExtraInfoNumberFromServer(internalName: String): Int {
        var value = Info.userExtraInfosNumbersOnServer.get(internalName);

        trace("Looking For Extra Info Number From Server For: " + internalName + "\nFound Value of " + value);

        return value;
    }

    static public function getUserExtraInfoBooleanFromServer(internalName: String): Bool {
        var value = Info.userExtraInfosBooleansOnServer.get(internalName);

        trace("Looking For Extra Info Boolean From Server For: " + internalName + "\nFound Value of " + value);

        return value;
    }

    static public function saveSetting(internalName: String, value: String) {
        var userSetting = Info.userSettings.get(internalName);

        if (userSetting != null) {
            userSetting.save(value);
            trace("Sent save request for Setting " + internalName + " of value " + value);
        } else {
            trace("Attempted To Save Setting " + internalName + " which does not exist of value " + value);
        }
    }

    static public function getSettingFromServer(internalName: String): String {
        var value = Info.userSettings.get(internalName);

        var returnValue: Null<String>;

        if (value != null) {
            returnValue = value.get();
        } else {
            returnValue = null;
        }

        trace("Looking For Extra Info String From Server For: " + internalName + "\nFound Value of " + value);

        return returnValue;
    }
}   