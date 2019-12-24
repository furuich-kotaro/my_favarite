FROM ruby:2.6.0
ENV LANG C.UTF-8

RUN apt-get update -qq && rm -rf /var/lib/apt/lists/* && apt-get install --no-install-recommends -y build-essential node.js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get update && rm -rf /var/lib/apt/lists/* && apt-get install  --no-install-recommends -y nodejs\
  imagemagick

# chromeの追加
RUN apt-get update  && rm -rf /var/lib/apt/lists/* && apt-get install --no-install-recommends -y unzip && \
  CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE` && \
  wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/ && \
  unzip ~/chromedriver_linux64.zip -d ~/ && \
  rm ~/chromedriver_linux64.zip && \
  chown root:root ~/chromedriver && \
  chmod 755 ~/chromedriver && \
  mv ~/chromedriver /usr/bin/chromedriver && \
  sh -c 'wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -' && \
  sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
  apt-get update && rm -rf /var/lib/apt/lists/* && apt-get install --no-install-recommends -y google-chrome-stable \
  && rm -r /var/lib/apt/lists/*

# 作業ディレクトリの作成、設定
RUN mkdir /my_favarite
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /my_favarite
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
COPY ./Gemfile $APP_ROOT/Gemfile
COPY ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install -j4

COPY . $APP_ROOT

RUN mkdir -p tmp/sockets