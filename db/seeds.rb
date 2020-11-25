User.create_with(email: 'admin@example', password: 'admin@example', password_confirmation: 'admin@example', confirmed_at: Time.now).find_or_create_by!(email: 'admin@example')

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