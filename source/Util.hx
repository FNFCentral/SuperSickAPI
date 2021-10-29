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
        return "https://fnfcentral.com";
    }

    public static function calcSongID(song: String) {
        var songID = Info.songIDs.get(song);

        if (songID != null) {
            return songID;
        }

        return null;
    }

    public static function calcDiffID(diff: Int) {
        var diffID = Info.difficultyIDs.get(diff);

        if (diffID != null) {
            return diffID;
        }

        return null;
    }

    static public function getTopScoreSavedFromServer(song:String, diff:Int) {
        var score = Info.topScoresOnServer.get(calcSongID(song)+"~"+calcDiffID(diff));

        if (score != null) {
            return score;
        }

        return 0;
    }
}   