gem install bundler# This repo generates my website: https://facastagnini.github.io

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/f8f5a1ccb54c4f62a72875f2b36d524a)](https://www.codacy.com/app/facastagnini_2/facastagnini-github-io?utm_source=github.com&utm_medium=referral&utm_content=facastagnini/facastagnini.github.io&utm_campaign=badger)
[![Build Status](https://travis-ci.org/facastagnini/facastagnini.github.io.svg)](https://travis-ci.org/facastagnini/facastagnini.github.io)

```
# install the version of ruby we need
curl -s https://pages.github.com/versions.json | jq -r .ruby | tee .ruby-version
brew install rbenv
rbenv install

# install bundler
gem install --user bundler
bundle install

# run tests
bundle exec rake

# test locally
bundle exec jekyll serve --livereload --unpublished
go to http://localhost:4000
```

Based on the template [dbyll](https://github.com/dbtek/dbyll/) by [dbtek](https://github.com/dbtek/).
