require "database_cleaner/strategy"

module DatabaseCleaner
  module Ldap
    class Deletion < Strategy
      attr_reader :filter

      def initialize(filter: nil)
        raise ArgumentError,
          "Option :filter must be a Net::LDAP::Filter" unless filter.nil? || filter.is_a?(Net::LDAP::Filter)

        @filter = filter
      end

      def clean
        entries.each { |ldap_entry| delete! ldap_entry.dn }
      end

      def db
        @db ||= Net::LDAP.new
      end

      private

      def entries
        Array db.search(filter: filter)
      end

      def delete!(dn)
        db.delete(dn: dn) or
          raise "Could no delete #{dn}. Reason: #{db.get_operation_result}"
      end
    end
  end
end
