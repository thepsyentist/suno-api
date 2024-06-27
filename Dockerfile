# syntax=docker/dockerfile:1

FROM node:lts-alpine AS builder
RUN npm i -g pnpm

WORKDIR /src
COPY package*.json ./
RUN pnpm install
COPY . .
RUN pnpm run build

FROM node:lts-alpine
RUN npm i -g pnpm

WORKDIR /app
COPY package*.json ./

ARG SUNO_COOKIE
RUN if [ -z "$SUNO_COOKIE" ]; then echo "SUNO_COOKIE is not set" && exit 1; fi
ENV SUNO_COOKIE=${SUNO_COOKIE}

RUN pnpm install --only=production
COPY --from=builder /src/.next ./.next
EXPOSE 3000
CMD ["pnpm", "run", "start"]
