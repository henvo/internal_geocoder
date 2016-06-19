module CLGeocoder
  class Query

    def initialize(text)
      @text = text
    end

    def to_s
      @text
    end

    def zip_code_query?
      !(@text =~ /^\d{4,5}$/).nil?
    end

    def city_query?
      !(@text =~ /^[A-za-z\-\(\)\s]{2,}$/).nil?
    end
  end
end
