require 'spec_helper'
require 'json'

class Comment
  include ActiveModel::Model

  attr_accessor :id, :created_at
end

class CommentsCollection
  def self.all
    now = Time.now
    1.upto(10).each do |i|
      Comment.new(
                 id: i,
                 created_at: now + i.minutes
      )
    end
    #TODO is there a way to test it without a db in test?
  end
end

class OrderedAPI < Grape::API
  include Grape::Order

  order
  get '' do
    order(CommentsCollection.all)
  end
end

describe Grape::Order do
  subject { OrderedAPI.new }
  def app; subject; end
  let(:json) { JSON.parse(last_response.body) }

  it 'orders by created_at asc' do
    pending 'add db to tests'
    get '/', order: 'created_at'
    expect(json.pluck(:id)).to eq((1..10).to_a)
  end


end