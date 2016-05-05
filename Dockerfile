FROM rails:4.2.5
RUN apt-get update
RUN apt-get install -y build-essential
RUN apt-get install -y imagemagick

ENV RAILS_ENV production

COPY webapp/Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install
WORKDIR /myapp
# cache friendly
COPY webapp /myapp
ENV SECRET_KEY_BASE 45277c66386de6565db73cd31e814ffa245ac005e3f08626d548da4f18674904d93ea14b7fd9e9a56029296e875e84a231c298b72ac9ef70f5809ad71c702684
RUN bundle exec rake assets:precompile
EXPOSE 3000
CMD ["./run.sh"]
