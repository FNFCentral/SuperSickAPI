package;

/**
 * Holds all the game info.
**/
class Info {
    public static var songs:Map<String, Map<Int, Int>> = new Map<String, Map<Int, Int>>();
    public static var topScoresOnServer:Map<Int, Int> = new Map<Int, Int>();

    static public function setData(data: Dynamic) {
        if (data.songs != null) songs = processSongsInfo(data.songs);
        if (data.topScores != null) topScoresOnServer = processTopScoresFromServer(data.topScores);
    }

    static function processTopScoresFromServer(scores: Array<Dynamic>) {
        var topScores = new Map<Int, Int>();

        for (score in scores) {
            topScores.set(score.diffID, score.score);
        }

        return topScores;
    }

    static function processSongsInfo(songs: Array<Dynamic>) {
        var processedSongs = new Map<String, Map<Int, Int>>();

        for (song in songs) {
            var diffs: Array<Dynamic> = song.diffs;

            var processedDiffs = new Map<Int, Int>();

            for (diff in diffs) {
                processedDiffs.set(diff.internalNumber, diff.diffID);
            }

            processedSongs.set(song.internalName, processedDiffs);
        }

        return processedSongs;
    }
}