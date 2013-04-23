require 'spec_helper'

describe Review do
  it { should belong_to :api }
  it { should belong_to :user }
  
  it { should validate_presence_of :rating }
  it { should validate_presence_of :thoughts }
end