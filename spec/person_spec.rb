require './lib/person.rb'
require './lib/atm.rb'

describe Person do


  subject { described_class.new(name: 'Ebba') }


  it 'is expected to have a :name on initialize' do
    expect(subject.name).not_to be nil
  end

  it 'is expected to raise error if no name is set' do
    expect { described_class.new }.to raise_error 'A name is required'
  end

end