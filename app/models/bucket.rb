require 's3'

class Bucket
  @bucket = S3::Service.new(secret_access_key: ENV['SECRET_ACCESS_KEY'], access_key_id: ENV['ACCESS_KEY_ID']).buckets.find('fuckthisshit')

  def self.bucket
    @bucket
  end

  def self.random_image(current_id = nil)

    begin
      @id = Random.rand(images.size)
    end while @id == current_id.to_i - 1

    { object: images[@id], id: @id + 1 }
  end

  def self.images
    bucket.objects
  end

  def self.find_image(id)
    id = id.to_i
    { object: images[id], id: id }
  end

  def self.find_cloudfront_image(id)
    "http://d2dvgyu43ozqxq.cloudfront.net/#{id}.gif"
  end
end
