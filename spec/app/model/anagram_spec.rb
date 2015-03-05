require 'spec_helper'

RSpec.describe 'AnagramsController', :type => :controller  do
   
   describe "anagramChecker" do
    it "test for special chars" do
      str_1 = "ãẽĩõũÂÊÎÔÛÃẼĨÕŨáéíóúÀÈÌÒÙÇ?!"
      str_2 = "aioeuoieuaeiouaeuiaoeuiaoc"
      @controller = AnagramsController.new
      @controller.instance_eval{ anagramChecker(str_1, str_2)}
      expect(@controller.instance_eval{ anagramChecker(str_1, str_2)}).to eq(true)
    end
    end
   
   
end