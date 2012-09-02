namespace :advertisements do
  desc "Publish new advertisements"
  task :publish => :environment do
    advertisements = Advertisement.find_all_by_state('approved')
    advertisements.each do |ads|
      ads.publish!
      ads.publication_date = Date.today
      ads.save
    end
  end

  desc "Archive old advertisements"
  task :archive => :environment do
    advertisements = Advertisement.find_all_by_state('published')
    date = Date.today
    advertisements.each do |ads|
      if ((date - 2) == ads.publication_date)
        ads.archive!
        ads.publication_date = nil
        ads.save
      end
    end
  end

end