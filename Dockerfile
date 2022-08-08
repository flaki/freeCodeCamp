FROM node:16-alpine
WORKDIR /usr/src/app
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

COPY package* ./
COPY .npmrc ./
COPY tsconfig* ./
COPY babel* ./
COPY api-server api-server
COPY client client
COPY curriculum curriculum
COPY curriculum-server curriculum-server
COPY tools tools
COPY web web
RUN npm ci --no-audit

COPY . .
RUN cp sample.env .env

EXPOSE 3000
CMD ["npm", "run", "seed"]
CMD ["npm", "run", "develop"]
