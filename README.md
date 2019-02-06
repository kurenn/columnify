# Columnify

The `columnify` gem helps you easily render Excel files through your controller actions with ease.


## Table of contents
- [Columnify](#columnify)
  - [Table of contents](#table-of-contents)
  - [Installing Columnify](#installing-columnify)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [License](#license)
  - [Code of Conduct](#code-of-conduct)

## Installing Columnify

You need to include the `columnify` gem inside your `Gemfile`:

```ruby
gem 'columnify', '~> 0.0.1'
```

or you can install the latest build:

```ruby
gem 'columnify', git: 'https://github.com/kurenn/columnify.git'
```

Install the gem by running the bundle command:

```
$ bundle install
```

After running the `bundle` command, you can now run the installer.

```console
$ rails g columnify:install
```

This will just register the `xls` mime type inside the `config/initializers/mime_types.rb` file.

## Usage

The gem will add a renderer and a template handler for you to easily handle the creation of the Excel file:

```ruby
# app/views/posts/index.xls.columnify
spreadsheet.workbook @posts, :id, :title, :content
```

So the usage for the views is just to call the `workbook` method, send the array or active record collection, followed by the set of attributes or methods you want to appear on the `xls` file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kurenn/columnify. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Columnify project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kurenn/columnify/blob/master/CODE_OF_CONDUCT.md).
