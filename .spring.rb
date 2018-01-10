Spring.quiet = true

begin
  rb_inotify = Gem::Specification.find_all_by_name('rb-inotify').find { |gem| gem.version <= Gem::Version.new('0.10') }
  rb_fsevent = Gem::Specification.find_all_by_name('rb-fsevent').find { |gem| gem.version <= Gem::Version.new('0.10') }
  $LOAD_PATH << rb_inotify.full_require_paths.first
  $LOAD_PATH << rb_fsevent.full_require_paths.first
  require 'spring/watcher/listen'
rescue
  puts 'Failed to load spring-watcher-listen.'
end
