RSpec.feature "User can search BestBuy", type: :feature do
  scenario "A user submit search queries to BestBuy" do
    VCR.use_cassette 'Best-Buy-Search' do
      visit root_path
      fill_in "search", with: "sennheiser"
      click_on "Search"
      expect(current_path).to eq "/search"
    end
  end
end
