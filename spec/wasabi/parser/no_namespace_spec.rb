require "spec_helper"

describe Wasabi::Parser do
  context "with: no_namespace.wsdl" do

    subject do
      parser = Wasabi::Parser.new Nokogiri::XML(xml)
      parser.parse
      parser
    end

    let(:xml) { fixture(:no_namespace).read }

    it "lists the elements" do
      subject.elements.keys.sort.should == []
    end

    it "lists the complexTypes" do
      subject.complex_types.keys.sort.should == ["McContact", "McContactArray", "MpUser", "MpUserArray"]
    end

    # TODO: this seems to document a lacking feature.
    it "ignores xsd:all types" do
      subject.types["MpUser"].children.should be_empty
    end

  end
end
