require 'spec_helper'

describe Vote do
  it { should belong_to :api }
  it { should belong_to :user }
end