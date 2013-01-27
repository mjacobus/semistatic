require 'spec_helper'

describe Semistatic::Part do
  it { should allow_mass_assignment_of(:file) }
  it { should allow_mass_assignment_of(:value) }
  it { should allow_mass_assignment_of(:name) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive.scoped_to(:page_id) }
  it { should validate_presence_of(:page) }
end


describe Semistatic::Part, "#options" do
  let(:hash) do
    {
      :option_1 => 'value 1',
      'option_2' => 'value 2',
      'one' => {'two' => 'two_value'}
    }
  end
  let(:part_id) { FactoryGirl.create(:part, options: hash).id }

  it "is a serialized param" do
    # force reload
    part = Semistatic::Part.where('id > 0').where(id: part_id).first
    part.options.should be_a Hash
    part.options.should have_key(:option_1)
    part.options.should have_key(:option_2)
    part.options[:one].should have_key(:two)
    part.options[:option_1].should eq('value 1')
    part.options[:option_2].should eq('value 2')
  end
end


describe Semistatic::Part, "#type" do
  context 'when :image' do
    subject { FactoryGirl.build(:part, options: {type: :image}) }
    its(:type) { should be(:image) }
  end

  context 'when "string"' do
    subject { FactoryGirl.build(:part, options: {type: "string"}) }
    its(:type) { should be(:string) }
  end
end


describe Semistatic::Part, "#file" do
  let(:file_hash) { { type: :file } }
  let(:image_hash) do
    { type: :image,
      styles: {
        thumb: '30x40>',
      }
    }
  end
  let(:image) { FactoryGirl.build(:part, options: image_hash) }
  let(:file) { FactoryGirl.build(:part, options: file_hash) }

  context 'when is not file' do
    subject { FactoryGirl.build(:part) }

    it { should_not validate_attachment_presence(:file) }
    its(:is_file?) { should be_false }
  end

  context 'when is file' do
    subject { file }

    its(:is_file?) { should be_true }
    it { should validate_attachment_presence(:file) }
    it 'should validate size of image'
    # it { should validate_attachment_size(:file).less_than(5.megabytes) }

    context 'when not image' do
      its(:is_file?) { should be_true }
      its(:is_image?) { should be_false }
    end

    context 'when is image' do
      subject { image }

      its(:is_file?) { should be_true }
      its(:is_image?) { should be_true }
      it "should validate content type allowing 'image/png', 'image/jpeg','image/gif'"

      #it { should validate_attachment_content_type(:file)
      #  .allowing('image/png', 'image/jpeg','image/gif').rejecting('application/text') }
    end

    context "resizing with paperclip" do
      before { image.file = File.open(TEST_IMAGE); image.save! }
      after { image.destroy }

      context "with styles defined" do
        it "resizes according to the paperclip options" do
          path = "#{Rails.root}/public/system/semistatic/parts/files/000/000/00#{image.id}/original/300x400.jpg"
          File.exists?(path).should be_true

          path = "#{Rails.root}/public/system/semistatic/parts/files/000/000/00#{image.id}/thumb/300x400.jpg"
          File.exists?(path).should be_true
        end
      end

      # Cannot do at the moment
      # paperclip wont accept lambda as path and url params
      #

      # context "with path defined" do
      #   before do
      #     image.options[:path] = "/tmp/specs/:id/:style.:extension"
      #   end

      #   it "saves file on the given path" do
      #     File.exists?("/tmp/specs/#{image.id}/thumb.jpg").should be_true
      #   end
      # end

      # context "with url defined" do
      #   before do
      #     image.options[:url] = "/tmp/specs/:id/:style.:extension"
      #   end

      #   it "gets the correct file url" do
      #     image.file.url.should == "/tmp/specs/#{image.id}/normal.jpg"
      #   end
      # end

    end # resizing with paperclip
  end # #file
end