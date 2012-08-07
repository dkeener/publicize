require File.join(File.dirname(__FILE__), %w[spec_helper])


describe Publicized do

  context 'when publicized' do
    it 'is publicized' do
      subject.should be_publicized
    end
  end

end

