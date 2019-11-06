const View = require("./ttt-view.js");
const Game = require("../../solution/game.js");

  $(() => {
    // Your code here
    const $container = $(".ttt");
   
    const newGame = new Game();
    
    const newView = new View(newGame, $container);
    newView.setupBoard();
    
    
    $("ul").on("click", "li", event => {
      const li = event.currentTarget;

      $(li).text(newGame.currentPlayer).addClass("selected");
      pos = $(li).data("pos");
      newGame.playMove(pos);
      if (newGame.isOver() && newGame.winner()) {
        console.log(`${newGame.winner()} has won!`);
      } else if (newGame.isOver() && !newGame.winner()) {
        console.log(`Congrats! You're both losers!`);
      }

    });
  });


  