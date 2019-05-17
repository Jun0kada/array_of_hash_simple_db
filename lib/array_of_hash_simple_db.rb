require 'array_of_hash_simple_db/version'

module ArrayOfHashSimpleDb
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_writer :records

    def records
      @_initialized_records ||= (@records || []).map { |r| new(r) }
    end

    alias_method :all, :records

    def find_by(condition)
      records.detect do |record|
        condition.all? do |k, v|
          [v].flatten.include?(record.public_send(k))
        end
      end
    end

    def respond_to_missing?(name, include_private = false)
      records.respond_to?(name) || super
    end

    def method_missing(method, *args, &block)
      if records.respond_to?(method)
        records.public_send(method, *args, &block)
      else
        super
      end
    end
  end

  attr_reader :attributes

  def initialize(attributes)
    @attributes = attributes

    @attributes.each do |name, value|
      self.class.send(:define_method, name) do
        if @attributes.has_key?(name.to_s)
          @attributes[name.to_s]
        elsif @attributes.has_key?(name.to_sym)
          @attributes[name.to_sym]
        end
      end
    end
  end
end
