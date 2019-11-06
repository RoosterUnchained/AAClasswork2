class HanoiView {
    constructor(hanoiGame, $el) {
      this.game = hanoiGame;
      this.$el = $el;            
      this.setUpTowers();
    }

    setUpTowers () {
        const that = this;
        console.log(that);
        for (let i = 0; i < 3; i++) {
          let $row = $("<ul></ul>");
          $row.addClass("Row");
            for (let j = 0; j < 3; j++) {
                let $li = $("<li></li>");
                $li.data("pos", [i, j]);
                $li.appendTo($row);
            }
          $row.appendTo(that.$el); 
        }
    }
}

module.exports = HanoiView;