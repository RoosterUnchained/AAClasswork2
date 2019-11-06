class View {
  constructor(game, $el) {
    this.$el = $el;
    this.game = game
    this.bindEvents();

  }

  bindEvents() {
    // console.log("bindEvents running");
    // const li = event.currentTarget;
    

    // $(li).text(this.game.currentPlayer).addClass("selected");
    // this.game.swapTurn();
    
  }

  makeMove($square) {}

  setupBoard() {

    const that = this;
    console.log(that);
    let $row = $("<ul></ul>");
    $row.addClass("Row");
    for (let i = 0; i < 3; i++) {   
      for (let j = 0; j < 3; j++) {
        let $li = $("<li></li>");
        $li.data("pos", [i, j]);
        $li.appendTo($row);
      }     
    }
    $row.appendTo(that.$el);
  }
}

module.exports = View;
