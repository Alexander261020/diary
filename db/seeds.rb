Chapter.create(id: 3001, name: 'esbuild')
Chapter.create(id: 3002, name: 'git')
Chapter.create(id: 3003, name: 'rspec')
с = Chapter.create(id: 3004, name: 'generator')
  Block.create(id: 3004, comment: 'для генерации контроллера',
    content: 'rails g controller nameController
              rails g controller nameController action1 action2',
    link: 'https://guides.rubyonrails.org/command_line.html',
  )
Chapter.create(id: 3005, name: 'string record')
Chapter.create(id: 3006, name: 'locales')
Chapter.create(id: 3007, name: 'routes')
Chapter.create(id: 3008, name: 'elements form')
