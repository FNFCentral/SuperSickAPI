package;

/**
 * The status manager.  
**/
class Status {
    static public function State(currentScore: Int, currentTime: Float, health: Float, combo: Int, accuracy: Float, song: String, diff: Int) {
        Util.sendMessage({purpose: "state", currentScore: currentScore, currentTime: currentTime, health: health, combo: combo, accuracy: accuracy, diffID: Util.calcDiffID(song, diff)});
    }

    static public function NoteHit(noteTime: Float, delay: Float, currentScore: Int, combo: Int, accuracy: Float, song: String, diff: Int, noteType: Note = Basic) {
        Util.sendMessage({purpose: "hit", noteTime: noteTime, noteType: noteType, delay: delay, currentScore: currentScore, combo: combo, accuracy: accuracy, diffID: Util.calcDiffID(song, diff)});
    }

    static public function NoteMiss(noteTime: Float, currentScore: Int, combo: Int, accuracy: Float, song: String, diff: Int, noteType: Note = Basic) {
        Util.sendMessage({purpose: "miss", noteTime: noteTime, noteType: noteType, currentScore: currentScore, combo: combo, accuracy: accuracy, diffID: Util.calcDiffID(song, diff)});
    }

    static public function Start(song: String, diff: Int) {
        Util.sendMessage({purpose: "song_start", diffID: Util.calcDiffID(song, diff)});
    }

    static public function Pass(score: Int, accuracy: Float, song: String, diff: Int) {
        Util.sendMessage({purpose: "song_pass", score: score, accuracy: accuracy, diffID: Util.calcDiffID(song, diff)});
    }

    static public function Fail(score: Int, accuracy: Float, song: String, diff: Int) {
        Util.sendMessage({purpose: "song_fail", score: score, accuracy: accuracy, diffID: Util.calcDiffID(song, diff)});
    }
}