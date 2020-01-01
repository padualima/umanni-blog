User.create!(
  name: "Pádua Lima",
  username: "padualima",
  email: "padua@admin.com",
  password: 112233,
  password_confirmation: 112233
)
categories = ["Startup", "Novidades", "Geral", "Mídia Social", "Atrções", "Política", "Religião"]
categories.each do |catg|
  Category.create!(
    description: catg
  )
end
