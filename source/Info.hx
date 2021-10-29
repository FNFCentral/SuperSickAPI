package;

import js.lib.Map;

/**
 * Holds all the game info.
**/
class Info {
    public static var songIDs:Map<String, Int> = new Map<String, Int>();
    public static var difficultyIDs:Map<Int, Int> = new Map<Int, Int>();
    public static var topScoresOnServer:Map<String, Int> = new Map<String, Int>();

    static public function setTopScoresFromServer(scores: Array<Dynamic>) {
        var topScores = new Map<String, Int>();

        for (score in scores) {
            topScores.set(score.songID+"~"+score.diffID, score.score);
        }

        return topScores;
    }
}