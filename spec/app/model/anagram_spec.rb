require 'spec_helper'

RSpec.describe 'AnagramsController', :type => :controller  do
   
   describe "anagramChecker" do
    it "test for inverse string" do
      str_1 = "aioeuoieuaeiouaeuiaoeuiaoc"
      str_2 =  str_1.reverse
      @controller = AnagramsController.new
      # @controller.instance_eval{ anagramChecker(str_1, str_2)}
      # expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(true)
    end
    end
   
   
end