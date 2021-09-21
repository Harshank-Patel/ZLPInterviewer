#location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do

    it 'is valid title with valid attributes' do
        title = Book.new(title: 'Harry Potter', author: 'JK Rowling', price: 20, date: '2000-05-22')
        expect(title).to be_valid
    end

    it 'is valid author with valid attributes' do
        author = Book.new(title: 'Harry Potter', author: 'JK Rowling', price: 20, date: '2000-05-22')
        expect(author).to be_valid
    end

    it 'is valid price with valid attributes' do
        price = Book.new(title: 'Harry Potter', author: 'JK Rowling', price: 20, date: '2000-05-22')
        expect(price).to be_valid
    end

    it 'is valid date with valid attributes' do
        date = Book.new(title: 'Harry Potter', author: 'JK Rowling', price: 20, date: '2000-05-22')
        expect(date).to be_valid
    end

end
