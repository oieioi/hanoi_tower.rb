require_relative "./ring"

module HanoiTower
  class Tower
    def initialize(ring_size)
      @rings = ring_size.times.reverse_each.map {|v| Ring.new(v + 1) }
    end

    def can_push?(ring)
      if @rings.last.nil?
        true
      else
        @rings.last.can_push?(ring)
      end
    end

    def push ring
      @rings << ring
    end

    def pop
      @rings.pop
    end

    def to_s
      @rings.map(&:to_s).join('-')
    end

    attr_reader :rings
  end
end
