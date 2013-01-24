require 'spec_helper'

describe Zpages::Part do
  it { should allow_mass_assignment_of(:file) }
  it { should allow_mass_assignment_of(:value) }
  it { should allow_mass_assignment_of(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:page_id) }
  it { should validate_presence_of(:page) }
end


describe Zpages::Part, "#options" do
  let(:hash) { {:option_1 => 'value 1', 'option_2' => 'value 2'} }
  let(:part_id) { FactoryGirl.create(:zpages_part, options: hash).id }

  it "is a serialized param" do
    # force reload
    part = Zpages::Part.where('id > 0').where(id: part_id).first
    part.options.should be_a HashWithIndifferentAccess
    part.options.should have_key('option_1')
    part.options.should have_key(:option_2)
    part.options[:option_1].should eq('value 1')
    part.options[:option_2].should eq('value 2')
  end
end


describe Zpages::Part, "#type" do
  context 'when :image' do
    subject { FactoryGirl.build(:zpages_part, options: {type: :image}) }
    its(:type) { should be(:image) }
  end

  context 'when "string"' do
    subject { FactoryGirl.build(:zpages_part, options: {type: "string"}) }
    its(:type) { should be(:string) }
  end
end


describe Zpages::Part, "#file" do
  let(:file_hash) { { type: :file } }
  let(:image_hash) do
    { type: :image, styles: {
      thumb: '30x40>',
    }}
  end
  let(:image) { FactoryGirl.build(:zpages_part, options: image_hash) }
  let(:file) { FactoryGirl.build(:zpages_part, options: file_hash) }

  context 'when is not file' do
    subject { FactoryGirl.build(:zpages_part) }

    it { should_not validate_attachment_presence(:file) }
    its(:is_file?) { should be_false }
  end

  context 'when is file' do
    subject { file }

    it { should validate_attachment_presence(:file) }
    it { should validate_attachment_size(:file).less_than(5.megabytes) }
    its(:is_file?) { should be_true }

    context 'when not image' do
      its(:is_file?) { should be_true }
      its(:is_image?) { should be_false }
    end

    context 'when is image' do
      subject { image }

      its(:is_file?) { should be_true }
      its(:is_image?) { should be_true }
      #it { should validate_attachment_content_type(:file)
      #  .allowing('image/png', 'image/jpeg','image/gif').rejecting('application/text') }
      it "should validate content type allowing 'image/png', 'image/jpeg','image/gif'"
    end
  end
end