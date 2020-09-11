crumb :root do
  link "Home", root_path
end

crumb :shops do
  link "検索結果", search_shops_path
  parent :root
end

crumb :users do 
  link "マイページ", user_path(users)
  parent :root
end

crumb :menus do
  link "メニュー", shop_menus_path(@shop)
  parent :shops
end

crumb :reviews do
  link "口コミ", shop_reviews_path(@shop)
  parent :shops
end

crumb :maps do
  link "地図", shop_maps_path(@shop)
  parent :shops
end






# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).