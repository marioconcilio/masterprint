require 'rails_helper'

RSpec.shared_examples 'index' do
  it { expect(subject).to respond_with(:ok) }
  it { expect(subject).to render_template(:index) }
end

RSpec.shared_examples 'new' do
  it { expect(subject).to respond_with(:ok) }
  it { expect(subject).to render_template(:new) }
end

RSpec.shared_examples 'edit' do
  it { expect(subject).to respond_with(:ok) }
  it { expect(subject).to render_template(:edit) }
end

RSpec.shared_examples 'redirect_to 404' do
  it { expect(subject).to respond_with(:redirect) }
  it { expect(subject).to redirect_to(not_found_path) }
end
