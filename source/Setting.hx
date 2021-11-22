package;

class Setting {
    var global: Bool;
    var value: String;
    var settingID: Int;

    public function new(global: Bool, value: String, settingID: Int) {
        this.global = global;
        this.value = value;
        this.settingID = settingID;
    }

    public function save(value: String) {
        if (value == this.value) return;

        this.value = value;

        Util.sendMessage({purpose: "save_setting", settingID: settingID, global: global, value: value});
        trace("Sent save request for Setting " + settingID + " of value " + value + " Global: " + global);
    }

    public function get() {
        return this.value;
    }
}