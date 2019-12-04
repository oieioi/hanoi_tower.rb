module HanoiTower
  class Ring
    def initialize size
      @size = size
    end

    def can_push?(other)
      @size > other.size
    end

    def to_s
      @size.to_s
    end

    def size
      @size
    end
  end
end
