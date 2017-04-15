# Santander Cycles

This project maps a simple city bike-sharing scheme, such as Santander Cycles in London or Bixi Bikes in Montreal. It was my first real experience with TDD, and the main challenge was getting to grips with RSPEC. It was also my first real collaborative project—I learnt a lot about pair programming whilst working on it.

## Dependencies

You'll need Ruby to explore this project, as well as the RSpec gem. For OS X, Linux, or other UNIX-like operating systems, I recommend using RVM:

```
curl -L https://get.rvm.io | bash -s stable
rvm use ruby --install --default
gem install rspec
```

For Windows, download and run Ruby Installer, available [here](https://rubyinstaller.org), and then install RSpec as above.
More detailed, OS-specific instructions are available on ruby-lang's [installation page](https://www.ruby-lang.org/en/documentation/installation/).

## Usage

The only way to run this project at present is in a REPL such as IRB (installed with Ruby), or Pry (`gem install pry`). Run `irb` or `pry` from the project root, followed by `require './lib/docking_station.rb'`. 

## Running tests

To run tests, simply navigate to the project root and use `rspec`.

## Other notes

Created as my main project during week one of the [Makers Academy](http://www.makersacademy.com) Bootcamp.
