module Service
  module Search
    extend ActiveSupport::Concern

    module ClassMethods
      class_eval do
        define_method(:search) do |line|
          where_query_(line)
        end
      end

      def where_query_(line)
        sql_query = ''
        params = ''
        @args.each_with_index do |arg,i|
            if i.eql?(0)
              sql_query << "#{arg.to_s} ILIKE ?"
              params << ", '%#{line}%'"
              next
            end
        sql_query << " OR #{arg.to_s} ILIKE ?"
        params << ", '%#{line}%'"
        end
        sql = "'#{sql_query}'" + params
        self.instance_eval("where(#{sql})")
      end
      private :where_query_

      def searchable_fields(*args)
        @@args= @args = args & self.new.attributes.keys.map(&:to_sym)
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
