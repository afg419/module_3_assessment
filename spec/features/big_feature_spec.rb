RSpec.feature "User can search BestBuy", type: :feature do
  scenario "A user submit search queries to BestBuy" do
    VCR.use_cassette 'Best-Buy-Search' do
      
    end
  end
end
