RSpec::Matchers.define :have_toastr do |key|
  match do |page|
    script = page.find('#toastr-script', visible: false).text(:all)
    script.include?('toastr') && script.include?(key)
  end

  failure_message do |page|
    "expected that #{page} would have a #{key} toastr"
  end

  failure_message_when_negated do |page|
    "expected that #{page} would not have a #{key} toastr"
  end
end
