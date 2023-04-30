FROM node:lts-alpine AS runtime
USER root
WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

ENV HOST=0.0.0.0
ENV PORT=3000
EXPOSE 3000
USER 1000
CMD node ./dist/server/entry.mjs