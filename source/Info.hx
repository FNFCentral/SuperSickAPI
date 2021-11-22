package;

/**
 * Holds all the game info.
**/
class Info {
    public static var songs: Map<String, Map<Int, Int>> = new Map<String, Map<Int, Int>>();
    public static var extraInfos: Map<String, Int> = new Map<String, Int>();

    public static var topScoresOnServer: Map<Int, Int> = new Map<Int, Int>();

    public static var userExtraInfosStringsOnServer: Map<String, String> = new Map<String, String>();
    public static var userExtraInfosNumbersOnServer: Map<String, Int> = new Map<String, Int>();
    public static var userExtraInfosBooleansOnServer: Map<String, Bool> = new Map<String, Bool>();

    public static var userSettings: Map<String, Setting> = new Map<String, Setting>();

    public static function setModData(data: Dynamic) {
        if (data.songs != null) songs = processSongsInfo(data.songs);
        if (data.extraInfos != null) extraInfos = processExtraInfos(data.extraInfos);
        if (data.settings != null) userSettings = processUserSettings(data.settings);
    }

    public static function setScoreData(data: Dynamic) {
        if (data.topScores != null) topScoresOnServer = processTopScoresFromServer(data.topScores);
    }

    public static function setExtraInfo(data: Dynamic) {
        if (data.userExtraInfos != null) processUserExtraInfosFromServer(data.userExtraInfos);
    }

    public static function setSettingData(data: Dynamic) {
        if (data != null) userSettings = processUserSettings(data);
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

    static function processExtraInfos(extraInfos: Array<Dynamic>) {
        var processedExtraInfos = new Map<String, Int>();

        trace("Processing Extra Infos!");

        for (extraInfo in extraInfos) {
            processedExtraInfos.set(extraInfo.internalName, extraInfo.extraInfoID);
            trace("Set Internal Name " + extraInfo.internalName + " to " + extraInfo.extraInfoID);
        }

        return processedExtraInfos;
    }

    static function processUserExtraInfosFromServer(userExtraInfos: Array<Dynamic>) {
        var processedUserExtraInfosStrings = new Map<String, String>();
        var processedUserExtraInfosNumbers = new Map<String, Int>();
        var processedUserExtraInfosBooleans = new Map<String, Bool>();

        trace("Processing User Extra Infos From: " + userExtraInfos);

        for (userExtraInfo in userExtraInfos) {
            switch (userExtraInfo.extraInfo.valueType) {
                case "STRING": 
                    processedUserExtraInfosStrings.set(userExtraInfo.extraInfo.internalName,  userExtraInfo.value);
                    trace("Added Value " + userExtraInfo.value + " for " + userExtraInfo.extraInfo.internalName);
                case "NUMBER": 
                    processedUserExtraInfosNumbers.set(userExtraInfo.extraInfo.internalName,  userExtraInfo.value);
                    trace("Added Value " + userExtraInfo.value + " for " + userExtraInfo.extraInfo.internalName);
                case "BOOLEAN": 
                    processedUserExtraInfosBooleans.set(userExtraInfo.extraInfo.internalName,  userExtraInfo.value);
                    trace("Added Value " + userExtraInfo.value + " for " + userExtraInfo.extraInfo.internalName);
                default:
                    trace("Bad Value Type " + userExtraInfo.extraInfo.valueType + " for " + userExtraInfo.extraInfo.internalName);
            }
        }

        userExtraInfosStringsOnServer = processedUserExtraInfosStrings;
        userExtraInfosNumbersOnServer = processedUserExtraInfosNumbers;
        userExtraInfosBooleansOnServer = processedUserExtraInfosBooleans;
    }

    static function processUserSettings(newUserSettings: Array<Dynamic>) {
        var processedUserSettings = userSettings.copy();

        trace("Processing User Settings!");

        for (userSetting in newUserSettings) {
            processedUserSettings.set(userSetting.internalName, new Setting(userSetting.global, userSetting.value, userSetting.settingID));
            trace("Added Value " + userSetting.value + " for " + userSetting.internalName);
        }

        return processedUserSettings;
    }
}