require_relative "random_shakespeare/version"
require_relative "random_shakespeare/downloader"
require_relative "random_shakespeare/parser"
require_relative "random_shakespeare/lines"

$RANDOM_SHAKESPEARE_TONlJtbwdGTkbIzC ||= RandomShakespeare::Lines.new

def random_shakespeare
  $RANDOM_SHAKESPEARE_TONlJtbwdGTkbIzC.next
end
