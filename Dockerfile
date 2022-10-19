FROM node:slim
ADD scaffolds /app/scaffolds/
ADD source /app/source/
ADD themes /app/themes/
COPY /_config.yml /app/_config.yml
COPY /package.json /app/package.json
ENV HEXO_SERVER_PORT=4000

RUN npm install -g hexo-cli

WORKDIR /app
EXPOSE ${HEXO_SERVER_PORT}

CMD \
  npm install && \
  hexo generate && \
  hexo deploy && \
  hexo server -s -d -p ${HEXO_SERVER_PORT}