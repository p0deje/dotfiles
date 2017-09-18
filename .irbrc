require 'irb/ext/save-history'
require 'irbtools'

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true

IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"
