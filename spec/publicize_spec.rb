require File.join(File.dirname(__FILE__), %w[spec_helper])

def json_to_hash(json)
  JSON.parse json
end

describe Publicized do

  context 'when publicized' do
    before { Publicized.send :publicize_model,:as => :entry }

    it 'is publicized' do
      subject.class.should be_publicized
    end

    it 'publicizes json data as the named class' do
      json = subject.to_json
      hash = json_to_hash json
      first_key = hash.keys.first
      first_key.should == 'entry'
    end

    context 'when attributes are not publicized' do
      it 'publicizes an empty hash' do
        json = subject.to_json
        hash = json_to_hash json
        publicized_attributes = hash.values.pop
        publicized_attributes.should be_blank
      end
    end

  end

end

