user = User.new(
  email: 'admin@example',
  password: 'admin@example',
  password_confirmation: 'admin@example'
)
user.skip_confirmation!
user.save!

User.create_with(email: 'teacher@example', password: 'teacher@example',
                 password_confirmation: 'teacher@example', confirmed_at: Time.now).find_or_create_by!(email: 'teacher@example')


PublicActivity.enabled = false

30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user_id: User.first.id,
    short_description: Faker::Quote.famous_last_words,
    language: Faker::ProgrammingLanguage.name,
    level: 'Beginner',
    price: Faker::Number.between(from: 1000, to: 2000)
  }])
end

PublicActivity.enabled = true