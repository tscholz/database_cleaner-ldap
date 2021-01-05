require "net/ldap"

RSpec.describe DatabaseCleaner::Ldap::Deletion do
  let(:ldap) { subject.db }
  let(:entries) { [Net::LDAP::Entry.new("uid=fred,dc=com")] }

  describe "::new" do
    let(:filter) { Net::LDAP::Filter.eq "objectClass", "posixAccount" }

    it "accepts the :filter option" do
      strategy = nil

      expect { strategy = described_class.new filter: filter }.not_to raise_error

      expect(strategy.filter).to eq filter
    end

    it "does no fail if no filter option provided" do
      strategy = nil

      expect { strategy = described_class.new filter: nil }.not_to raise_error

      expect(strategy.filter).to be_nil
    end

    it "checks filter type" do
      expect { described_class.new filter: "not a LDAP filter" }.to raise_error ArgumentError
    end
  end

  context "by default" do
    it "deletes all entries" do
      expect(ldap).to receive(:search).with(filter: nil).and_return entries
      expect(ldap).to receive(:delete).with(dn: "uid=fred,dc=com").and_return true

      subject.clean
    end
  end

  context "with the :filter option" do
    subject { described_class.new filter: filter }

    let(:filter) { Net::LDAP::Filter.eq "objectClass", "posixAccount" }

    # Net::LDAP knows how to filter. So just check if it gets called with the filter provided to the deletion strategy.
    it "only deletes entries matching the filter" do
      expect(ldap).to receive(:search).with(filter: filter).and_return entries
      expect(ldap).to receive(:delete).with(dn: "uid=fred,dc=com").and_return true

      subject.clean
    end
  end
end
