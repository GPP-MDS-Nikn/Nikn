require 'rails_helper'

describe PortalPost do
  before { @portal_post = FactoryGirl.build(:portal_post) }

  subject { @portal_post }

  it { should respond_to(:title) }
  it { should respond_to(:author) }
  it { should respond_to(:body) }

  it { should be_valid }
end
