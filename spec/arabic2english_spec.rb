require_relative '../lib/arabic2english'

describe Arabic2english do
    
    it 'should except only integer numbers' do
        message = 'Must be a numeric value!'
        expect { Arabic2english::arabic2english '' }.to raise_exception message
        expect { Arabic2english::arabic2english 4 }.to_not raise_exception
        expect { Arabic2english::arabic2english '4' }.to_not raise_exception message
        expect { Arabic2english::arabic2english '42' }.to_not raise_exception message
        expect { Arabic2english::arabic2english '4.4' }.to raise_exception message
        expect { Arabic2english::arabic2english 'xyz' }.to raise_exception message
        expect { Arabic2english::arabic2english '9op43c1' }.to raise_exception message
        expect { Arabic2english::arabic2english '567aap' }.to raise_exception message
    end
    
    it "Should except only 3 digits" do
        message = 'Must be only 3 digits.'
        expect { Arabic2english::arabic2english '123' }.to_not raise_exception message
        expect { Arabic2english::arabic2english 123 }.to_not raise_exception message
        expect { Arabic2english::arabic2english 4448 }.to raise_exception message
    end
      
    it "Should support for 1 digit" do
      expect(Arabic2english::arabic2english(1)).to eq('one')
    end
    
    it "Should support for 2 digits" do
        expect(Arabic2english::arabic2english(11)).to eq('eleven')
    end
    
    it "should support for 3 digits" do
        expect(Arabic2english::arabic2english(100)).to eq('one hundred')
    end
end