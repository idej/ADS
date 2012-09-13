namespace :advertisements do
  desc "Publication new advertisements"
  task :publication do
    advertisements = Advertisement.where(:state => 'approved').all
    advertisements.each do |ads|
      ads.publish!
    end
  end

  desc "Archived old advertisements"
  task :archived do

  end

end