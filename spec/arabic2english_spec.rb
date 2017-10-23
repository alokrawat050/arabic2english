require_relative '../lib/arabic2english'

describe Arabic2english do
    
    it 'should except only integer numbers' do
        message = 'Must be a numeric Number!'
        expect { Arabic2english::arabic2english 4 }.to_not raise_exception
        expect { Arabic2english::arabic2english '4' }.to_not raise_exception message
        expect { Arabic2english::arabic2english '4.4' }.to raise_exception message
        expect { Arabic2english::arabic2english 'xyz' }.to raise_exception message
        expect { Arabic2english::arabic2english '9op43c1' }.to raise_exception message
        expect { Arabic2english::arabic2english '567aap' }.to raise_exception message
      end
end