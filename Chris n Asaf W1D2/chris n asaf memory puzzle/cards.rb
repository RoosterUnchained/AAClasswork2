class Cards

    attr_reader :face

    def initialize(letter)
        @face = letter
        @faced_up = false
    end

    def face_value
        return @face if @faced_up == true
        return ' ' if @faced_up == false
    end

    def hide
        @faced_up = false
    end

    def reveal
        @faced_up = true
    end
end