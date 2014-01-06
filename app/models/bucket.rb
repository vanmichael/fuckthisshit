require 'open-uri'

class Bucket
  @url = 'http://fuckthisshit.s3.amazonaws.com/'

  def self.get_xml
    Nokogiri::XML(open(@url)).search('Contents')
  end

  def self.bucket
    get_xml
  end

  def self.random_image(current_id = nil)
    begin
      @id = Random.rand(images.size)
    end while @id == current_id.to_i - 1

    { object: images[@id], id: @id + 1 }
  end

  def self.images
    _bucket = bucket
    _bucket.map { |node| { url: "#{@url}#{node.search('Key').text}", id: _bucket.index(node) + 1 } }
  end

  def self.next_image(current_id)
    index = current_id.to_i - 1

    if current_id.to_i == images.size
      id = 0
    else
      id = index + 1
    end

    { id: id + 1 }
  end

  def self.previous_image(current_id)
    index = current_id.to_i - 1

    if index == 0
      id = images.size - 1
    else
      id = index - 1
    end

    { id: id + 1 }
  end

  def self.find_cloudfront_image(id)
    "http://d2dvgyu43ozqxq.cloudfront.net/#{id}.gif"
  end
end
