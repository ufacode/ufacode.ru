
User.destroy_all
user = User.create(name: 'ufadiz', password: 'test123', email: 'ufadiz@gmail.com', role: 'admin')

Blog.destroy_all
Blog.create([
                 {name: 'События и встречи', description: 'мероприятия, встречи, конференции', uri: 'meetups', author: user},
                 {name: 'Работа', description: 'предложения о работе и поиск', uri: 'job', author: user},
                 {name: 'Web программирование', description: 'вопросы, статьи, туториалы и описание проектов', uri: 'web', author: user}
             ])
blogs = Blog.all.to_a
srand
Post.destroy_all

100.times do
  Post.create(
          name:    Faker::Lorem.sentence( rand(5..10) ),
          content: Faker::Lorem.sentence( rand(100..1000) ),
          blog:    blogs.sample,
          author:  user
  )
end