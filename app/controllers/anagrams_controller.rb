class AnagramsController < ApplicationController
  before_action :set_anagram, only: [:show]
  # GET /anagrams
  # GET /anagrams.json
  def index
    @anagrams = Anagram.all
  end

  # GET /anagrams/1
  # GET /anagrams/1.json
  def show
  end

  # GET /anagrams/new
  def new
    @anagram = Anagram.new
  end

  # POST /anagrams
  # POST /anagrams.json
  def create
    @anagram = Anagram.new(anagram_params)
    @anagram.result = anagramChecker(@anagram.w1,@anagram.w2)
    respond_to do |format|
      if @anagram.save
        format.html { redirect_to @anagram, notice: 'Anagram check request was successfully stored.' }
        format.json { render :show, status: :created, location: @anagram }
      else
        format.html { render :new }
        format.json { render json: @anagram.errors, status: :unprocessable_entity }
      end
    end
  end

  def anagramChecker(w1,w2)
    w1 = w1.downcase
    w2 = w2.downcase
    w_a1 = w1.split(//);
    w_a2 = w2.split(//);
    
    if w_a1.sort == w_a2.sort
      return true
    end
    
    return false
  end
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_anagram
    @anagram = Anagram.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def anagram_params
    params.require(:anagram).permit(:w1, :w2, :result)
  end
end
