require_relative "./tower"

module TowersOfHanoi
  class Game
    def initialize(size)
      @generation = 0
      @size = size
      @stick_size = @size * 2
      @towers = [
        Tower.new(@size),
        Tower.new(0),
        Tower.new(0)
      ]
      @smallest_ring_direction = @size.odd? ? 1 : -1
      @last_smallest_ring_stick = @smallest_ring_direction
    end

    def others(me)
      @towers.reject {|t| t === me}
    end

    def tower_having_smallest
      @towers.find { |tower| tower.rings.last&.size == 1 }
    end

    def next_tower_for_smallest_ring
      # 一番小さいリングが次に動くべきタワーを返す
      # リングのサイズが奇数の時と偶数の時で動く方向が違う
      @towers[@last_smallest_ring_stick % @towers.size]
    end

    def next
      @generation += 1

      if @generation.odd?
        # 一番小さいリングを動かす
        # 一番小さいリングは必ず動かせる
        next_tower_for_smallest_ring.push(tower_having_smallest.pop)
        @last_smallest_ring_stick = @last_smallest_ring_stick + @smallest_ring_direction
      else
        # 一番小さいリング以外を動かす
        @towers.each { |tower, index|
          next if tower_having_smallest == tower

          moved = search_and_move(tower, others(tower))

          if moved
            return
          end
        }
      end
    end

    def search_and_move(target_tower, other_towers)
      moving_ring = target_tower.rings.pop
      return nil if moving_ring.nil?

      other_towers.each {|tower|
        if tower.can_push?(moving_ring)
          tower.push(moving_ring)
          return true
        end
      }

      # 入れ替えなし。元に戻す
      target_tower.push(moving_ring)

      nil
    end

    def print
      puts self
    end

    def to_s
      string = "#{@generation} times\n"
      @towers.each { |tower|
        if tower.rings.empty?
          string << '-' * (@stick_size)
          string << "\n"
        else
          string << tower.rings.map(&:to_s).join('-').ljust(@stick_size, '-')
          string << "\n"
        end
      }
      string
    end

    # リングがどっか別のタワーに動かし終わった？
    def done?
      @towers.drop(1).any? { |tower| tower.rings.size == @size }
    end
  end
end
