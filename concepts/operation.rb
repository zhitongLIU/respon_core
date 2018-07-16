# frozen_string_literal: true

module ResponCore
  module PullRequests
    # operation to give reviewers of pull requests
    class Operation
      attr_accessor :params, :errors, :parameters

      def initialize(*args)
        args = args.first
        unless args.empty?
          params.each do |param|
            send "#{param}=", args[param]
          end
        end
        self.parameters = args

        self.errors = []
      end

      def after_init
        setup
        valid_params
        raise errors.to_s unless errors.empty?
      end

      def setup; end

      def valid_params; end

      def self.inherited(klass)
        class << klass
          alias_method :__new, :new
          def new(*args)
            e = __new(*args)
            e.after_init
            e
          end
        end
      end

      def execute
        raise 'Need to be implement'
      end

      def self.accept_params(*args)
        args.each do |arg|
          class_eval("def #{arg};@#{arg};end")
          class_eval("def #{arg}=(val);@#{arg}=val;end")
          class_eval("def self.#{arg}=(val);@#{arg}=val;end")
        end
        class_eval("def params; @params ||= #{args} ;end")
      end
    end
  end
end
