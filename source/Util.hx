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

    public static function calcDiffID(song: String, diff: Int): Null<Int> {
        var song = Info.songs.get(song);

        if (song != null) {
            var diffID = song.get(diff);

            if (diffID != null) {
                return diffID;
            }
        }

        return null;
    }

    static public function getTopScoreSavedFromServer(song: String, diff: Int): Int {
        var diffID = calcDiffID(song, diff);

        if (diffID != null) {
            var score = Info.topScoresOnServer.get(diffID);

            if (score != null) {
                return score;
            }
        }

        return 0;
    }
}   