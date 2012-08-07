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

    it 'publicizes data as the named class' do
      json = subject.to_json
      hash = json_to_hash json
      first_key = hash.keys.first
      first_key.should == 'entry'
    end

  end

end

