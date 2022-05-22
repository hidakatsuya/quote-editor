require 'application_system_test_case'

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  test 'Showing a quote' do
    visit quotes_path
    click_link @quote.name

    assert_selector 'h1', text: @quote.name
  end

  test 'Creating a new quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'New quote'
    fill_in 'Name', with: 'Capybara quote'

    assert_selector 'h1', text: 'Quotes'
    click_on 'Create quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Capybara quote'

    assert_text 'Quote was successfully created.'
  end

  test 'Updating a quote' do
    visit quotes_path
    assert_selector 'h1', text: 'Quotes'

    click_on 'Edit', match: :first
    fill_in 'Name', with: 'Updated quote'

    assert_selector 'h1', text: 'Quotes'
    click_on 'Update quote'

    assert_selector 'h1', text: 'Quotes'
    assert_text 'Updated quote'

    assert_text 'Quote was successfully updated.'
  end

  test 'Destroying a quote' do
    visit quotes_path
    assert_text @quote.name

    accept_confirm do
      click_on 'Delete', match: :first
    end
    assert_no_text @quote.name

    assert_text 'Quote was successfully destroyed.'
  end

  test "Showing the empty state" do
    Quote.destroy_all
    visit quotes_path

    assert_text "You don't have any quotes yet!"

    # Create a new quote
    click_on 'Add quote'
    fill_in 'Name', with: 'New quote!'
    click_on 'Create quote'
    assert_text 'New quote!'

    assert_no_text "You don't have any quotes yet!"
  end
end
