FROM ruby:2.6.0

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get update && apt-get install -y nodejs\
  imagemagick

# 作業ディレクトリの作成、設定
RUN mkdir /my_favarite
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /my_favarite
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install

COPY . $APP_ROOT

RUN mkdir -p tmp/sockets