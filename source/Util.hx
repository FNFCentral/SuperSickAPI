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
            var rawDiff = song.getDiffs().get(diff);

            if (rawDiff != null) {
                return rawDiff.getDiffID();
            }
        }

        return null;
    }

    static public function getTopScoreSavedFromServer(song: String, diff: Int): Int {
        var processedSong = Info.songs.get(song);

        if (processedSong != null) {
            var processedDiff = processedSong.getDiffs().get(diff);

            if (processedDiff != null) {
                var score = processedDiff.getTopScore();

                trace("Looking For Top Score From Server For Diff: " + diff + " of Song " + song + "\nFound Score: " + score);

                return score;
            } else {
                trace("Could not find top score for diff " + diff + " of song " + song + " as it does not exist.");
            }
        } else {
            trace("Could not find top score for song " + song + " as it does not exist.");
        }

        return 0;
    }

    static public function saveUserExtraInfo(internalName: String, value: Dynamic) {
        var extraInfo = Info.extraInfos.get(internalName);

        if (extraInfo != null) {
            extraInfo.save(value);
            trace("Sent save request for Extra Info " + internalName + " of value " + value);
        } else {
            trace("Attempted To Save Extra Info " + internalName + " which does not exist of value " + value);
        }
    }

    static public function getUserExtraInfoStringFromServer(internalName: String): String {
        var extraInfo = Info.extraInfos.get(internalName);

        var value = null;

        if (extraInfo != null) {
            value = extraInfo.getString();
            trace("Looking For Extra Info String From Server For: " + internalName + "\nFound Value of " + value);
        } else {
            trace("Could Not Find Extra Info String From Server For: " + internalName);
        }

        return value;
    }

    static public function getUserExtraInfoNumberFromServer(internalName: String): Float {
        var extraInfo = Info.extraInfos.get(internalName);

        var value = null;

        if (extraInfo != null) {
            value = extraInfo.getNumber();
            trace("Looking For Extra Info Number From Server For: " + internalName + "\nFound Value of " + value);
        } else {
            trace("Could Not Find Extra Info Number From Server For: " + internalName);
        }

        return value;
    }

    static public function getUserExtraInfoBooleanFromServer(internalName: String): Bool {
        var extraInfo = Info.extraInfos.get(internalName);

        var value = null;

        if (extraInfo != null) {
            value = extraInfo.getBoolean();
            trace("Looking For Extra Info Boolean From Server For: " + internalName + "\nFound Value of " + value);
        } else {
            trace("Could Not Find Extra Info Boolean From Server For: " + internalName);
        }

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