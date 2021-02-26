FROM ruby:2.6.3

RUN apt-get update -qq && \
  apt-get install -y build-essential \
              libpq-dev \
              nodejs

RUN mkdir /app_name

##作業ディレクトリ名を環境変数APP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /app_name
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT