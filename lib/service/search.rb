module Service
  module Search
    extend ActiveSupport::Concern

    module ClassMethods
      class_eval do
        define_method(:search) do |line|
          @args = @args & self.new.attributes.keys.map(&:to_sym)
          result = []
          @args.each do |arg|
            res = where("#{arg.to_s} ILIKE ?", "%#{line}%")
            result << res.to_a
          end
          return result.flatten
        end
      end

      def searchable_fields(*args)
        @args = args
      end
    end
  end
end
