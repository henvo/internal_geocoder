desc 'Bundle the gem'
task :bundle do
  sh 'gem build *.gemspec'
  sh 'gem install *.gem'
  sh 'rm *.gem'
end
