module CLGeocoder
  class Query

    attr_accessor :text

    def initialize(text)
      @text = text
    end

    private

    def zip_code_query?
      @text =~ /\d{4,5}/
    end
  end
end
