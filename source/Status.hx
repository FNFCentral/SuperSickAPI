package;

import js.Browser;

/**
 * The status manager.  
**/
class Status {
    @:deprecated 
    static public function Note(hit: Bool, currentScore: Int, combo: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "note", hit: hit, currentScore: currentScore, combo: combo, accuracy: accuracy, songID: Util.calcSongID(song), diffID: Util.calcDiffID(diff)}, Util.getTargetURL());
    }
    
    static public function NoteHit(noteTime: Int, delay: Float, currentScore: Int, combo: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "hit", noteTime: noteTime, delay: delay, currentScore: currentScore, combo: combo, accuracy: accuracy, songID: Util.calcSongID(song), diffID: Util.calcDiffID(diff)}, Util.getTargetURL());
    }

    static public function NoteMiss(noteTime: Int, currentScore: Int, combo: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "miss", noteTime: noteTime, currentScore: currentScore, combo: combo, accuracy: accuracy, songID: Util.calcSongID(song), diffID: Util.calcDiffID(diff)}, Util.getTargetURL());
    }

    static public function Start(song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "song_start", songID: Util.calcSongID(song), diffID: Util.calcDiffID(diff)}, Util.getTargetURL());
    }

    static public function Pass(score: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "song_pass", songID: Util.calcSongID(song), diffID: Util.calcDiffID(diff)}, Util.getTargetURL());
    }

    static public function Fail(score: Int, accuracy: Float, song: String, diff: Int) {
        Util.getParent().postMessage({purpose: "song_fail", score: score, accuracy: accuracy, songID: Util.calcSongID(song), diffID: Util.calcDiffID(diff)}, Util.getTargetURL());
    }
}