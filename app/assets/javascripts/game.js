$('.ttt-board').on('click', 'a', click_on_square);

function click_on_square(event) {
  event.preventDefault();
  event.stopPropagation();
  var square_id = event.target.parentElement.id;
  var make_move_url = window.location.pathname + '/make_move.json';

  $.ajax({
    url: make_move_url,
    type: 'PUT',
    data: "location=" + square_id,
    success: function success(data) {
      error_message("");
      fill_location(data.location, data.player);
      if (data.won) {
        mark_winning_squares();
      }
    },
    error: function error(data) {
      error_message(data.responseJSON.errors);
    }
  });
}

function error_message(msg) {
  $('.error-message').html(msg);
}

function fill_location(location, player) {
  $('#' + location + ' a').html(player);
}

function color_won_squares(squares) {
  $.each(squares, function(index, square) {
    $("#" + square).css("backgroundColor", "lightgreen");
  });
}

function mark_winning_squares() {
  var winning_squares_url = window.location.pathname + '/winning_squares.json';

  $.ajax({
    url: winning_squares_url,
    type: 'GET',
    success: function(data) {
      error_message("");
      color_won_squares(data.winning_squares);
    }
  });
}
