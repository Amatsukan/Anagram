require 'rails_helper'

RSpec.describe 'AnagramsController', :type => :controller  do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get 'index'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the 'index' template" do
      get 'index'
      expect(response).to render_template("anagrams")
    end
  end

  describe "GET anagrams/new" do
    it "responds successfully with an HTTP 200 status code" do
      get 'new'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    it "renders the 'new' template" do
      get 'new'
      expect(response).to render_template("anagrams/new")
    end
  end

  describe "anagramChecker" do

    it "test for inverse string" do
      str_1 = "aioeuoieuaeiouaeuiaoeuiaoc"
      str_2 =  str_1.reverse
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(true)
    end

    it "test for equals string" do
      str_1 = "aioeuoieuaeiouaeuiaoeuiaoc"
      str_2 =  str_1
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(true)
    end

    it "test for not anagram string with equals size" do
      str_1 = "aioeuoieuaeiouaeuiaoeuiaoc"
      str_2 = "aioeuoieuaeiouaeuiaoeuiaoz"
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(false)
    end

    it "test for not anagram string with diferent size" do
      str_1 = "aioeuoieuaeiouaeuiaoeuiaoc"
      str_2 = "aioeuoieuaeiouaeuiaoeuiao"
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(false)
    end

    it "test for anagram string with numbers" do
      str_1 = "aioeuoieuaeiouaeuiaoeuiaoc123"
      str_2 = "aioeuoieuaeiouaeuiaoeuiaoc312"
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(true)
    end

    it "test for anagram string with only numbers" do
      str_1 = "123"
      str_2 = "312"
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(true)
    end

    it "test for not anagram string with only numbers" do
      str_1 = "1523"
      str_2 = "3124"
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(false)
    end
    
    it "test for not anagram string with numbersand chars" do
      str_1 = "1523a"
      str_2 = "3124h"
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(false)
    end
    
    # it "test for anagram string with special chars" do
      # str_1 = "ᄼ ᄽ ᄾ ᄿ ᆍ ᆕ ᆜ"
      # str_2 = "ᄼ ᄽ ᄾ ᄿ ᆍ ᆕ ᆜ"
      # @controller = AnagramsController.new
      # @controller.instance_eval{ anagramChecker(str_1, str_2)}
      # expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(true)
    # end

  end

end