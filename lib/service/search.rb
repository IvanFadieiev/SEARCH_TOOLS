module Service
  module Search
    extend ActiveSupport::Concern

    module ClassMethods
      class_eval do
        define_method(:search) do |line|
          result = []
          @args.each do |arg|
            res = where("#{arg.to_s} ILIKE ?", "%#{line}%")
            result << res.to_a
          end
          return result.flatten
        end
      end
      
      def searchable_fields(*args)
        @@args = @args = args & self.new.attributes.keys.map(&:to_sym)
        define_methods_for_fields
      end

      def define_methods_for_fields
        class << self
          @@args.each do |field|
            define_method(:"search_by_#{field}") do |line|
              where("#{field.to_s} ILIKE ?", "%#{line}%")
            end
          end
        end
      end
    end
  end
end
