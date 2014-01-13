# Minitest::Documentation

A documentation format for [minitest](https://github.com/seattlerb/minitest)

## Installation

Add this line to your application's Gemfile:

    gem 'minitest-documentation'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install minitest-documentation

## Requirements

Minitest >= 5.0.0

## Usage

Just pass `--documentation` as an argument while running your tests

## What's the difference?

```bash
Run options: --documentation --seed 17962

# Running:

ExampleTest
  flunk
  pass
  skip


Finished in 0.001199s, 2502.0851 runs/s, 1668.0567 assertions/s.

  1) Failure:
ExampleTest#test_flunk [example_test.rb:9]:
Epic Fail!

3 runs, 2 assertions, 1 failures, 0 errors, 1 skips

You have skipped tests. Run with --verbose for details.
```

vs

```bash
Run options: --seed 51722

# Running:

SF.

Finished in 0.001132s, 2650.1767 runs/s, 1766.7845 assertions/s.

  1) Failure:
ExampleTest#test_flunk [example_test.rb:9]:
Epic Fail!

3 runs, 2 assertions, 1 failures, 0 errors, 1 skips

You have skipped tests. Run with --verbose for details.
```

### Color
If you add `--color` as an argument the output will be colorized
- `pass` => Green
- `skip` => Yellow
- `fail` => Red

## Contributing

1. Fork it ( http://github.com/teoljungberg/minitest-documentation/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
