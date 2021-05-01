FROM ruby:2.7.2-slim
RUN apt-get update -qq && apt-get install -y build-essential
 RUN apt-get install -y libpq-dev
 RUN apt-get install -y libsqlite3-dev
RUN apt-get install -y imagemagick
RUN apt-get install -y nodejs
 RUN apt-get install -y vim 
ENV RAILS_ROOT /var/www/blog
# Create application home. App server will need the pids dir so just create everything in one shot
RUN mkdir -p $RAILS_ROOT/tmp/pids
# Set our working directory inside the image
WORKDIR $RAILS_ROOT
 COPY Gemfile Gemfile
 COPY Gemfile.lock Gemfile.lock 
RUN gem install bundler
RUN bundle install
COPY . .
CMD [ "config/containers/app_cmd.sh" ]




