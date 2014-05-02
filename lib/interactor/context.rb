require "ostruct"

module Interactor
  class Context < OpenStruct
    def self.build(context = {})
      self === context ? context : new(context.dup)
    end

    def success?
      !failure?
    end

    def failure?
      @failure || false
    end

    def fail!(context = {})
      context.each { |k, v| send("#{k}=", v) }
      @failure = true
    end
  end
end
