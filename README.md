# Guard::Notifier::Blink1

[blink(1)](http://blink1.thingm.com/) notifier for Guard.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'guard-notifier-blink1', require: false
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install guard-notifier-blink1

And the notifier requires `blink1-tool`.
See oficial site: http://blink1.thingm.com/blink1-tool/

## Usage

Add the following to your Guardfile.

```ruby
require "guard/notifier/blink1"

notification :blink1
```

## Options

### :methods

This option is used as flash method of `blink(1)`.
You can set color of result types individually.

| NAME | DESCRIPTION |
| :--  | :-- |
| `:emission` | LED emits until is sent `--off` option |
| `:blink`    | use `--blink` option                   |
| `:glimmer`  | use `--glimer` option                  |
| `:off`      | use `--off` option                     |

Default:
```ruby
{
  success: "blink",
  pending: "blink",
  failed:  "blink",
  notify:  "blink",
}
```

### :method

Set method for all result type.

### :colors

This options is used as LED color.
You can set color of result types individually.

Default:
```ruby
{
  success: "#00ff00",
  pending: "#ffff00",
  failed:  "#ff0000",
  notify:  "#0000ff",
}
```

### :color

Set color for all result type.

### :counts

This option is used as the number of flashes when the `:method` is set to `blink` or `glimmer`.
You can set color of result types individually.

Default:
```ruby
{
  success: 3,
  pending: 3,
  failed:  3,
  notify:  3,
}
```

### :count

Set count for all result type.

## Sample

```ruby
notification :blink1,
  method: :glimmer,
  count: 5,
  colors: {
    success: "#003200",
    pending: "#323200",
    failed:  "#320000",
    notify:  "#000032",
  }
```

## Contributing

1. Fork it ( https://github.com/Sixeight/guard-notifier-blink1/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

