package;

class Song {
    var diffs: Map<Int, Diff>;

    public function new(diffs: Map<Int, Diff>) {
        this.diffs = diffs;
    }

    public function getDiffs() {
        return this.diffs;
    }
}