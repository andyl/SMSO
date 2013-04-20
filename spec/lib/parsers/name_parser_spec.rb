require 'spec_helper'
require [Rails.root.to_s, "/lib/parsers/name_parser"].join

describe Parsers::NameParser do
  let(:parser) { described_class.new }

  describe :comma do
    subject { parser.comma }

    it "works now" do
      x = 1
      x.should == 1
    end

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

  describe :title_test do
    subject { parser.title_test }
    it { should parse "dr" }
    it { should parse "Dr" }
    it { should parse "Dr." }
    it { should parse "sgt." }
    it { should parse "Ofc." }
    it { should parse "Doctor" }
    it { should_not parse "Doctor." }
    it { should_not parse "Dr. " }
  end

  describe :title do
    subject { parser.title }
    it { should parse "dr   " }
    it { should parse "dr.   " }
    it { should parse "Dr   " }
    it { should parse "Dr.   " }
    it { should parse "Sgt. " }
    it { should parse "Doctor " }
    it { should_not parse "Doctor" }
    it { should_not parse "Doctor. " }
    it "returns a valid hash" do
      result = subject.parse("Dr ")
      result.should be_a Hash
      result.should == {title:"Dr"}
    end
  end

  describe :anchor do
    subject { parser.anchor  }
    it { should parse "de "  }
    it { should parse "van " }
    it { should parse "von " }
    it { should_not parse "von" }
  end

  describe :article do
    subject { parser.article }
    it { should parse "de "  }
    it { should parse "Den " }
    it { should parse "der " }
    it { should parse "la "  }
    it { should_not parse "la"  }
  end

  describe :word do
    subject { parser.word }
    it { should parse "word" }
    it { should_not parse "word " }
  end

  describe :middle_name do
    subject { parser.middle_name }
    it { should parse "word " }
  end

  describe :last_name do
    subject { parser.last_name }
    it { should parse "Smith" }
    it { should parse "Smith-Jones" }
    it { should parse "Van Smith-Jones" }
    it { should parse "Van Den Bos" }
    it { should_not parse "xx Smith-Jones" }
    context "valid results" do
      it "handles a basic name" do
        name = "bos"
        subject.parse(name).should == {last_name: name}
      end
      it "handles a name with anchor" do
        name = "van bos-x"
        subject.parse(name).should == {last_name: name}
      end
      it "handles a name with anchor and article" do
        name = "van de bos-x"
        subject.parse(name).should == {last_name: name}
      end
    end
  end

  describe :all do
    subject { parser.all }
    it { should_not parse "Smith" }
    it { should parse "Joe Smith"}
    it { should parse "Joe Middle Smith"}
    it { should parse "Joe Middle Van Gogh"}
    it { should parse "Dr J.R.R. Middle Van Gogh"}
    it { should parse "Dr J.R.R. Middle Von Der Gogh"}
    it { should parse "Dr. J.X.R. Middle Von Der Gogh"}

  end

end
