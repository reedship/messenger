# build container
docker-compose up -d --build
# install rails
docker-compose exec web bundle
# generate new rails project
docker-compose exec web bundle exec rails new . -f
# start rails server at IP 0.0.0.0 so that it's available on the host macOS
docker-compose exec web bundle exec rails s -b 0.0.0.0
