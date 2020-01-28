class Seed

  def self.begin
    seed = Seed.new
    seed.generate_messages
  end

  def generate_messages
    20.times do |i|
      message = Message.create!(
        content: Faker::Movie.quote
      )
      puts "Message #{i}: Content is '#{message.content}'."
    end
  end
end

Seed.begin
