require "spec_helper"

describe Salon do

  it { should validate_numericality_of(:phone_number) }
  it { should validate_uniqueness_of(:phone_number) }


end
