module Base
  module Value
    def hash
      instance_variables.map do |name|
        instance_variable_get(name).hash
      end.hash
    end

    def eql?(other)
      self.class == other.class &&
        instance_variables.all? do |name|
          instance_variable_get(name) ==
            other.instance_variable_get(name)
        end
    end

    def ==(other)
      eql?(other)
    end
  end
end
