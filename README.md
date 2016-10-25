# Grape::Sort [![Gem Version](https://badge.fury.io/rb/grape-sort.png)]

Collection sorting for [grape](https://github.com/intridea/grape) API framework.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'grape-sort'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install grape-sort
```

## Usage

```ruby
class MyApi < Grape::API
  # Include Grape::Sort module in your api
  include Grape::Sort

  resource :comments do
    desc 'Return a list of comments.'

    # Annotate action with `paginate`.
    # This will add an optional param: sort
    #
    # You can optionally set the default :sort setting to the fields of your choice.
    #
    sort '-created_at'

    get do
      comments = Comment.where(...)

      # Use `sort` helper to sort the collection by passed params.
      sort(comments)
    end

  end
end
```

Now you can pass a string `sort` param to HTTP request to your endpoint structured as follows:

- prepend field name by `-` to get ascending order, like `-created_at`
- pass multiple fields to sort by separating them by comma, like `-created_at, name`

```
curl -v http://lvh.me:3000/comments?sort=-created_at
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PrositAS/grape-sort.