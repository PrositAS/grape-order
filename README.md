# Grape::Order [![Gem Version](https://badge.fury.io/rb/grape-order.png)][![Code Climate](https://codeclimate.com/github/PrositAS/grape-order/badges/gpa.svg)](https://codeclimate.com/github/PrositAS/grape-order)[![Build Status](https://semaphoreci.com/api/v1/prositas/grape-order/branches/master/badge.svg)](https://semaphoreci.com/prositas/grape-order)

Collection ordering for [grape](https://github.com/intridea/grape) API framework.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-order'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install grape-order
```

## Usage

```ruby
class MyApi < Grape::API
  # Include Grape::Sort module in your api
  include Grape::Sort

  resource :comments do
    desc 'Return a list of comments.'

    # Annotate action with `order`.
    # This will add an optional param: order
    #
    # You can optionally set the default :order setting to the fields of your choice.
    #
    order '-created_at'

    get do
      comments = Comment.where(...)

      # Use `order` helper to order the collection by passed params.
      order(comments)
    end

  end
end
```

Now you can pass a string `order` param to HTTP request to your endpoint structured as follows:

- prepend field name by `-` to get ascending order, like `-created_at`
- pass multiple fields to order by separating them by comma, like `-created_at, name`
- ordering on nested resources is also supported, eg: 'posts.created_at, -comments.created_at'

```
curl -v http://lvh.me:3000/comments?order=-created_at
```

## Contributing

The gem structure was based on https://github.com/monterail/grape-kaminari 
(which can be used for pagination).

Feel free to submit issue with bug report or pull requests on GitHub at https://github.com/PrositAS/grape-order.
