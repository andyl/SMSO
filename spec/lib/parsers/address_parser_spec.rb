require 'spec_helper'
require [Rails.root.to_s, "/lib/parsers/address_parser"].join

describe Parsers::AddressParser do
  let(:parser) { described_class.new }

  describe :comma do
    subject { parser.comma }
    it { should parse ","     }
    it { should parse ", "    }
    it { should parse ",  "   }
    it { should_not parse "x" }
  end

  describe :digit do
    subject { parser.digit }
    it { should parse "5"     }
    it { should_not parse "x" }
  end

  describe :zip do
    subject { parser.zip }
    it { should parse "94022" }
    it { should parse "94022 " }
    it { should parse "94022-1234" }
    it { should parse "94022-1234 " }
  end

  describe :state do
    subject { parser.state }
    it { should parse "CA"}
    it { should parse "Ca"}
    it { should parse "fl"}
    it { should parse "FL"}
    it { should_not parse "xx"}
  end

end