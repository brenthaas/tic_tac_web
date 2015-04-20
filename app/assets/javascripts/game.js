$('.square-content').click(click_on_square);

function click_on_square(event) {
  square_id = event.target.parentElement.id;
  make_move_url = window.location.pathname + '/make_move.json';

  $.ajax({
    url: make_move_url,
    type: 'PUT',
    data: "location=" + square_id,
    success: function(data) {
      error_message("");
      fill_location(data.location, data.player);
      if (data.won) {
        mark_winning_squares();
      }
    },
    error: function(data) {
      error_message(data.responseJSON.errors);
    }
  });
}

function error_message(msg) {
  $('.error-message')[0].innerHTML=msg;
}

function fill_location(location, player) {
  location_id = "#" + location;
  $(location_id + ' .square-content')[0].innerHTML = player;
}

function color_won_squares(squares) {
  for (square of squares) {
    document.getElementById(square).style.backgroundColor = 'lightgreen';
  }
}

function mark_winning_squares() {
  winning_squares_url = window.location.pathname + '/winning_squares.json';

  $.ajax({
    url: winning_squares_url,
    type: 'GET',
    success: function(data) {
      error_message("");
      color_won_squares(data.winning_squares);
    }
  });
}
