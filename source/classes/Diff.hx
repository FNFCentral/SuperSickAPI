package classes;

class Diff {
    var diffID: Int;
    var topScore: Int;

    public function new(diffID: Int, topScore: Int) {
        this.diffID = diffID;
        this.topScore = topScore;
    }

    public function getDiffID() {
        return this.diffID;
    }

    public function getTopScore() {
        return this.topScore;
    }

    public function reset() {
        this.topScore = 0;
    }

    public function set(topScore: Int) {
        this.topScore = topScore;
    }
}