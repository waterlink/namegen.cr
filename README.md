# namegen.cr

This library provides facilities for generating random names/nicknames.

## Installation

Add this line to your application's `Projectfile`:

```crystal
deps do
  github "waterlink/namegen.cr"
end
```

## Usage

```crystal
require "namegen"
```

### Generating a name

```crystal
Namegen.name(Namegen::Language::DE, Namegen::Gender::FEMALE)
# => Zemda
```

## Contributing

1. Fork it ( https://github.com/waterlink/namegen.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [waterlink](https://github.com/waterlink) Oleksii Fedorov - creator, maintainer
