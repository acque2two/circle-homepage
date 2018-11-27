FROM nginx
RUN apt update
RUN apt-get install -y gnupg git
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn
RUN git clone https://github.com/NozomiSugiyama/circle-homepage
RUN yarn circle-homepage
RUN yarn lint
RUN yarn build
COPY build/* /usr/share/nginx/html/
