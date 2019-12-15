RSpec.configure do |config|
  config.before(:each) do |example|
    if example.metadata[:type] == :system
      if example.metadata[:js]
        driven_by :selenium_chrome_headless, screen_size: [1400, 1400]
      else
        driven_by :rack_test
      end
    end
  end
end