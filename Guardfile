guard :minitest, test_folders: 'tests', all_on_start: false do
  # with Minitest::Unit
  watch(%r{^tests/(.*)\/?(.*)_test\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$}) { |m| "tests/#{m[1]}#{m[2]}_test.rb" }
end
