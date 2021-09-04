package;

import js.Browser;

/**
 * The status manager.  
**/
class Status {
    static public function Note(hit: Bool, currentScore: Int, combo: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "note-hit", hit: hit, currentScore: currentScore, combo: combo, accuracy: accuracy, timetamp: Date.now(), songID: calcSongID(song), diffID: calcDiffID(diff)}, Util.getTargetURL());
    }

    static function calcSongID(song: String) {
        var songID = Info.songIDs.get(song);

        if (songID != null) {
            return songID;
        }

        return 0;
    }

    static function calcDiffID(diff: Int) {
        var diffID = Info.difficultyIDs.get(diff);

        if (diffID != null) {
            return diffID;
        }

        return 0;
    }
}