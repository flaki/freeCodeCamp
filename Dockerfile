FROM node:16-alpine
WORKDIR /usr/src/app
COPY . .
RUN cp sample.env .env
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
RUN npm ci


EXPOSE 3000
CMD ["npm", "run", "seed"]
CMD ["npm", "run", "develop"]
