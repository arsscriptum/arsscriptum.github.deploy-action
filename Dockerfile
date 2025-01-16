# Our Docker image will be based on ruby:2-slim
# it is a very light docker image.
FROM ruby:3.3.4-slim
LABEL author="codegp@icloud.com"
LABEL version="1.1.2"


RUN rm -rf Gemfile.lock && \
    gem install bundler:2.6.2 && \
    bundle _2.6.2_ --version && \
    chmod -R 777 ${PWD} && \
    bundle _2.6.2_ install && \
    bundle update && \
    bundle install

# This is our entrypoint to our custom scripts
# more about that in a sec
COPY entrypoint.sh /entrypoint.sh

# Use the entrypoint.sh file as the container entrypoint
# when Github executes our Docker container
ENTRYPOINT ["sh", "/entrypoint.sh"]