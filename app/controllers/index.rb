get '/' do
  # let user create new short URL, display a list of shortened URLs
  @decks = Deck.all
  @display = "_front_page"
  erb :index
end

get '/profile/:user_id' do
  @user = User.find(session[:user_id])
  @display = "_profile"
  @decks = @user.get_undone_decks
  @top_rounds = @user.get_top_rounds
  @recent_rounds = @user.get_recent_rounds
  erb :index
end

get '/deck/:deck_id/card/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  @display = "_deck"
  erb :index
end

post '/deck/:deck_id/card/:card_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  if session[:round_id]
    @round = Round.find(session[:round_id])
  else
    @round = Round.create(deck: @deck, user: User.find(session[:user_id]))
    session[:round_id] = @round.id
  end
  # have round
  @round.guesses.create(response: params[:response], card: @card)
  @round.calculate_score
  # figure out which redirect to do
  next_card = @round.next_card_after(@card)
  unless next_card == nil
    redirect "/deck/#{@deck.id}/card/#{next_card.id}"
  else
    session[:round_id] = nil
    redirect "/results/#{@round.id}"
  end
end

get '/results/:round_id' do
  @round = Round.find(params[:round_id])
  @display = "_results"

  erb :index
end

