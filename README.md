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
g = Namegen.generator(Namegen::Language::DE, Namegen::Gender::FEMALE)
g.name
# => Zemda
```

### Example: Checking how unique names it is generating:

```crystal
require "namegen"

n = 1000000
g = Namegen.generator(Namegen::Language::DE, Namegen::Gender::FEMALE)
names = {} of String => Int32
(0..n).each do |i|
  name = g.name()
  names[name] ||= 0
  names[name] += 1
  puts "#{i} - #{name}"
end

puts "unique names: #{names.size} out of #{n}"
```

## Contributing

1. Fork it ( https://github.com/waterlink/namegen.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [waterlink](https://github.com/waterlink) Oleksii Fedorov - creator, maintainer
