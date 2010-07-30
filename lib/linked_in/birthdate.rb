module LinkedIn
  class Birthdate

    # <date-of-birth>
    #   <year>1972</year>
    #   <month>1</month>
    #   <day>3</day>
    # </date-of-birth>
    
    def self.from_xml(doc)
      new(Nokogiri::XML(doc))
    end
    
    def initialize(doc)
      @doc = doc
    end
    
    def year
      @year ||= @doc.xpath("/person/date-of-birth/year").text.to_i
    end

    def day
      @day ||= @doc.xpath("/person/date-of-birth/day").text.to_i
    end
    
    def month
      @month ||= @doc.xpath("/person/date-of-birth/month").text.to_i
    end
    
    def to_date
      Date.civil(y=year,m=month,d=day)
    end
    
  end
end