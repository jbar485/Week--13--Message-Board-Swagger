# class Seed

  # def self.begin
  #   seed = Seed.new
  #
  #   seed.generate_groups
  # end

#   def generate_messages
#     20.times do |i|
#       message = Message.create!(
#         content: Faker::Movie.quote
#         author:
#         group_id:
#       )
#       puts "Message #{i}: Content is '#{message.content}'."
#     end
#   end
#
#   def generate_groups
#     20.times do |i|
#       message = Message.create!(
#         content: Faker::Movie.quote
#       )
#       puts "Message #{i}: Content is '#{message.content}'."
#     end
#   end
# end
#
# Seed.begin

Group.destroy_all
Message.destroy_all



15.times do |index|
  groups = []
  groups.push(Group.create!(name: Faker::TvShows::BreakingBad.episode,
    genre: Faker::Lorem.words(number: 1, supplemental: true)))
    groups
    rand(3..15).times do |message|
      groups.each do |group|
        Message.create! :author => Faker::Superhero.name, :content =>  Faker::Movie.quote,
        :group_id => group.id
      end
    end
  end
  p "Created #{Group.count} groups"
