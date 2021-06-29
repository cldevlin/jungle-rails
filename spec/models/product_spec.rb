require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do 
    it 'should save when all four fields are set' do
      @category = Category.new({ "name"=>"Other"})
      @product = Product.new( {"name"=>"table", "price"=>"1555", "quantity"=>"3", "category"=>@category })
      expect(@product.save).to be_truthy
    end

    it 'should validate that a name is present' do
      @category = Category.new({ "name"=>"Other"})
      @product = Product.new( {"name"=>nil, "price"=>"1555", "quantity"=>"3", "category"=>@category })
      expect(@product.save).to be_falsy
    end

    it 'should validate that a price is present' do
      @category = Category.new({ "name"=>"Other"})
      @product = Product.new( {"name"=>"table", "quantity"=>"3", "category"=>@category })
      puts "~~~~~~~~~~~~~~~~~~~~~~~~OJOJOJOJODFJBOSZDJFOZBMDBGMSDG"
      puts @product.inspect
      expect(@product.save).to be_falsy
    end

    it 'should validate that a quantity is present' do
      @category = Category.new({ "name"=>"Other"})
      @product = Product.new( {"name"=>"table", "price"=>"1555", "quantity"=>nil, "category"=>@category })
      expect(@product.save).to be_falsy
    end

    it 'should validate that a category is present' do
      @product = Product.new( {"name"=>"table", "price"=>"1555", "quantity"=>"3", "category"=>nil })
      expect(@product.save).to be_falsy
    end

    # @category = Category.new
  end

end
