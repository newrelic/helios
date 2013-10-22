module Helios
  class DangerEffect < Effect
    def initialize(args)
      @iterations = args('iterations', 100]
    end

    def change!
      @iterations.times do
        Lights[rand(24) + 1] = [rand(255), rand(255), rand(255)]
      end
    end
  end
end
