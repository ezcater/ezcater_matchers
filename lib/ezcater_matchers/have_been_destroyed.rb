RSpec::Matchers.define :have_been_destroyed do
  match do |model|
    !model.class.exists?(model.id)
  end
end
