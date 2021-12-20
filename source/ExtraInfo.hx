package;

class ExtraInfo {
    var extraInfoID: Int;
    var TYPE: String;
    var string: Null<String>;
    var number: Null<Float>;
    var boolean: Null<Bool>;

    public function new(extraInfoID: Int, TYPE: String, value: Null<Dynamic>) {
        this.extraInfoID = extraInfoID;
        this.TYPE = TYPE;
        switch (TYPE) {
            case "STRING": 
                this.string = value;
                this.number = null;
                this.boolean = null;
            case "NUMBER": 
                this.string = null;
                this.number = value;
                this.boolean = null;
            case "BOOLEAN": 
                this.string = null;
                this.number = null;
                this.boolean = value;
        }
    }

    public function getExtraInfoID() {
        return this.extraInfoID;
    }

    public function getString() {
        return this.string;
    }

    public function getNumber() {
        return this.number;
    }

    public function getBoolean() {
        return this.boolean;
    }

    public function set(value: Dynamic) {
        switch (this.TYPE) {
            case "STRING": 
                this.string = value;
            case "NUMBER": 
                this.number = value;
            case "BOOLEAN": 
                this.boolean = value;
        }
    }

    public function reset() {
        this.string = null;
        this.number = null;
        this.boolean = null;
    }

    public function save(value: Dynamic) {
        if (value == this.string || value == this.number || value == this.boolean) return;

        switch (this.TYPE) {
            case "STRING": 
                this.string = value;
            case "NUMBER": 
                this.number = value;
            case "BOOLEAN": 
                this.boolean = value;
        }

        Util.sendMessage({purpose: "save_extra_info", extraInfoID: this.extraInfoID, value: value});
        trace("Sent save request for Extra Info " + extraInfoID + " of value " + value);
    }
}