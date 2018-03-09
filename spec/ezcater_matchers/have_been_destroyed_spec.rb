RSpec.describe "have_been_destroyed matcher" do # rubocop:disable RSpec/DescribeClass
  let(:model_class) do
    Class.new do
      def self.exists?(_id); end

      attr_accessor :id

      def initialize(id)
        @id = id
      end
    end
  end
  let(:id) { rand(1...999) }
  let(:model) { model_class.new(id) }

  context "when a model does not exist" do
    before do
      allow(model_class).to receive(:exists?).with(id).and_return(false)
    end

    it "asserts that the model has been destroyed" do
      expect(model).to have_been_destroyed
    end
  end

  context "when a model exists" do
    before do
      allow(model_class).to receive(:exists?).with(id).and_return(true)
    end

    it "asserts that the model has not been destroyed" do
      expect(model).not_to have_been_destroyed
    end
  end
end
