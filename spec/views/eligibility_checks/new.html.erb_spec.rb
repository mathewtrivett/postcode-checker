require 'rails_helper'

RSpec.describe "eligibility_checks/new.html.erb", type: :view do
  subject { rendered }
  before do 
    assign :eligibility_check, build(:eligibility_check, postcode: nil)
    render
  end
end
