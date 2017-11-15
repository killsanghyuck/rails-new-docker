FROM ubuntu
MAINTAINER kill5038(kill5038@gmail.com)

RUN apt-get update
RUN apt-get -qq -y install git curl build-essential openssl libssl-dev python-software-properties python g++ make
RUN apt-get -qq -y install libsqlite3-dev
RUN apt-get -qq -y install
RUN apt-get -qq -y install nodejs

RUN apt-get -qq -y install ruby-full
RUN gem install bundler --no-ri --no-rdoc
RUN gem install foreman compass
RUN apt-get install -qq -y mysql-client libmysqlclient-dev

WORKDIR /app
RUN git clone https://github.com/killsanghyuck/rails-new-docker.git /app
RUN bundle install

ENV SECRET_KEY_BASE dockerkeybase
ENV RAILS_ENV production
EXPOSE 5959
CMD foreman start -f Procfile
