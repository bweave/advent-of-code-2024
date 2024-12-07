# Advent of Code 2024

Solutions to the Advent of Code 2024 puzzles in Ruby.

A `Rakefile` is provided to run the solutions and tests. Use `bundle exec rake -T` to list available tasks.

Before running any commands that interact with the AoC website, you must set up your `AOC_SESSION_COOKIE` environment variable:

```sh
cp .env.sample .env
```

You'll need to log in to the Advent of Code website and then grab a copy of your session key from your cookies. In Chrome, you can do this by opening the Developer Tools window (⌥ ⌘ I on Mac) when browsing the Advent of Code website. Within the Application tab, expand Cookies under Storage in the side menu and select https://adventofcode.com. This will then show you all of the cookies set by the website. You need to select the session cookie and copy the value.

Now edit your `.env` file, so that it looks like the following, replacing `abc123` with the session key you just copied:

```
AOC_SESSION_COOKIE=abc123
```
