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

        trace("Processing Top Scores!");

        for (score in scores) {
            topScores.set(score.diffID, score.score);
            trace("Added " + score.score + " For " + score.diffID);
        }

        return topScores;
    }

    static function processSongsInfo(songs: Array<Dynamic>) {
        var processedSongs = new Map<String, Map<Int, Int>>();

        trace("Processing Songs!  Songs Given: " + songs.length);

        for (song in songs) {
            var diffs: Array<Dynamic> = song.diffs;

            trace("Processing Song " + song + " Diffs Given " + diffs.length);

            var processedDiffs = new Map<Int, Int>();

            for (diff in diffs) {
                processedDiffs.set(diff.internalNumber, diff.diffID);

                trace("Set Diff " + diff.internalNumber + " For Song " + song + " As DiffID " + diff.diffID);
            }

            processedSongs.set(song.internalName, processedDiffs);
        }

        return processedSongs;
    }
}