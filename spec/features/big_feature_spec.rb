RSpec.feature "Big ol Feature", type: :feature do
  scenario "A logged in user can get to new entry page" do
    VCR.use_cassette '<casette> ' do
    end
  end
end
