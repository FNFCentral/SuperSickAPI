package;

import js.Browser;

/**
 * The status manager.  
**/
class Status {
    static public function Note(hit: Bool, currentScore: Int, combo: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "note_hit", hit: hit, currentScore: currentScore, combo: combo, accuracy: accuracy, songID: calcSongID(song), diffID: calcDiffID(diff)}, Util.getTargetURL());
    }

    static public function Start(song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "song_start", songID: calcSongID(song), diffID: calcDiffID(diff)}, Util.getTargetURL());
    }

    static public function Pass(score: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "song_pass", songID: calcSongID(song), diffID: calcDiffID(diff)}, Util.getTargetURL());
    }

    static public function Fail(score: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "song_fail", score: score, accuracy: accuracy, songID: calcSongID(song), diffID: calcDiffID(diff)}, Util.getTargetURL());
    }

    static function calcSongID(song: String) {
        var songID = Info.songIDs.get(song);

        if (songID != null) {
            return songID;
        }

        return null;
    }

    static function calcDiffID(diff: Int) {
        var diffID = Info.difficultyIDs.get(diff);

        if (diffID != null) {
            return diffID;
        }

        return null;
    }
}