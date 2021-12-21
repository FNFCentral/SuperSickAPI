package;

/**
 * Holds all the game info.
**/
class Info {
    public static var songs: Map<String, Song> = new Map<String, Song>();

    public static var extraInfos: Map<String, ExtraInfo> = new Map<String, ExtraInfo>();

    public static var userSettings: Map<String, Setting> = new Map<String, Setting>();

    public static function setModData(data: Dynamic) {
        if (data.songs != null) songs = processSongsInfo(data.songs);
        if (data.extraInfos != null) extraInfos = processExtraInfos(data.extraInfos);
        if (data.settings != null) userSettings = processSettings(data.settings, true);
    }

    public static function setScoreData(data: Dynamic) {
        if (data.topScores != null) processTopScoresFromServer(data.topScores);
    }

    public static function setExtraInfo(data: Dynamic) {
        if (data.userExtraInfos != null) processUserExtraInfosFromServer(data.userExtraInfos);
    }

    public static function setSettingData(data: Dynamic) {
        if (data != null) userSettings = processSettings(data.userSettings, false);
    }

    static function processTopScoresFromServer(scores: Array<Dynamic>) {
        trace("Processing Top Scores!");

        var diffs = new Map<Int, Diff>();

        for (song in songs) {
            for (diff in song.getDiffs()) {
                diff.reset();
                diffs.set(diff.getDiffID(), diff);
            }
        }
        
        for (score in scores) {
            var diff = diffs.get(score.diffID);
            if (diff != null) {
                diff.set(score.score);
                trace("Added " + score.score + " For " + score.diffID);
            } else {
                trace("Could Not Add " + score.score + " For " + score.diffID + " As That DiffID Does Not Exist");
            }
        }
    }

    static function processSongsInfo(songs: Array<Dynamic>) {
        var processedSongs = new Map<String, Song>();

        trace("Processing Songs!  Songs Given: " + songs.length);

        for (song in songs) {
            var diffs: Array<Dynamic> = song.diffs;

            trace("Processing Song " + song + " Diffs Given " + diffs.length);

            var processedDiffs = new Map<Int, Diff>();

            for (diff in diffs) {
                processedDiffs.set(diff.internalNumber, new Diff(diff.diffID, 0));

                trace("Set Diff " + diff.internalNumber + " For Song " + song + " As DiffID " + diff.diffID);
            }

            processedSongs.set(song.internalName, new Song(processedDiffs));
        }

        return processedSongs;
    }

    static function processExtraInfos(extraInfos: Array<Dynamic>) {
        var processedExtraInfos = new Map<String, ExtraInfo>();

        trace("Processing Extra Infos!");

        for (extraInfo in extraInfos) {
            processedExtraInfos.set(extraInfo.internalName, new ExtraInfo(extraInfo.extraInfoID, extraInfo.valueType, null));
            trace("Set Internal Name " + extraInfo.internalName + " to " + extraInfo.extraInfoID + " with value " + extraInfo.value + " of type " + extraInfo.valueType);
        }

        return processedExtraInfos;
    }

    static function processUserExtraInfosFromServer(userExtraInfos: Array<Dynamic>) {
        trace("Processing User Extra Infos From: " + userExtraInfos);

        for (extraInfo in extraInfos) {
            extraInfo.reset();
        }

        for (userExtraInfo in userExtraInfos) {
            var extraInfo = extraInfos.get(userExtraInfo.extraInfo.internalName);
            if (extraInfo != null) {
                extraInfo.set(userExtraInfo.value);
                trace("Added Value " + userExtraInfo.value + " for " + userExtraInfo.extraInfo.internalName);
            } else {
                trace("Could Not Add Value " + userExtraInfo.value + " for " + userExtraInfo.extraInfo.internalName + " As It Does Not Exist");
            }
        }
    }

    static function processSettings(newSettings: Array<Dynamic>, reset: Bool) {
        var processedSettings = userSettings.copy();

        if (reset) {
            processedSettings = new Map<String, Setting>();
            trace("Reset User Settings");
        }

        trace("Processing User Settings!");

        for (setting in newSettings) {
            processedSettings.set(setting.internalName, new Setting(setting.global, setting.value, setting.settingID));
            trace("Added Settings Value " + setting.value + " for " + setting.internalName);
        }

        return processedSettings;
    }
}