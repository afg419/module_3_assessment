RSpec.feature "User can search BestBuy", type: :feature do
  scenario "A user submit search queries to BestBuy" do
    VCR.use_cassette 'Best-Buy-Search' do
      visit root_path
      fill_in "search", with: "sennheiser"
      click_on "Search"

      expect(page).to have_selector('.product', count: 15)
      expect(page).to have_selector('.sku', count: 15)
      expect(page).to have_selector('.sale-price', count: 15)
      expect(page).to have_selector('.image-url', count: 15)
      expect(page).to have_selector('.customer-review', count: 15)
      expect(page).to have_selector('.descritption', count: 15)

      within(".sku-4763330") do
        expect(page).to have_content "Galaxy Audio - Headset Microphone - Beige"
        expect(page).to have_content "Sale Price: $199.99"
        expect(page).to have_content "Customer Review Average:"
        expect(page).to have_content "Description: GALAXY AUDIO Headset Microphone: Crafted for most wireless transmitters; can be used with a JIB/PB; works with most PC sound cards; flexible fit design"
      end
      expect(current_path).to eq "/search"
    end
  end

  scenario "A user submits multiple search queries to BestBuy" do
    VCR.use_cassette 'Best-Buy-Multi-Search' do
      visit root_path
      fill_in "search", with: "sennheiser headphones white"
      click_on "Search"
      save_and_open_page
      # expect(page).to have_selector('.product', count: 15)
      # expect(page).to have_selector('.sku', count: 15)
      # expect(page).to have_selector('.sale-price', count: 15)
      # expect(page).to have_selector('.image-url', count: 15)
      # expect(page).to have_selector('.customer-review', count: 15)
      # expect(page).to have_selector('.descritption', count: 15)
      #
      # within(".sku-4763330") do
      #   expect(page).to have_content "Galaxy Audio - Headset Microphone - Beige"
      #   expect(page).to have_content "Sale Price: $199.99"
      #   expect(page).to have_content "Customer Review Average:"
      #   expect(page).to have_content "Description: GALAXY AUDIO Headset Microphone: Crafted for most wireless transmitters; can be used with a JIB/PB; works with most PC sound cards; flexible fit design"
      # end
      expect(current_path).to eq "/search"
    end
  end
end
