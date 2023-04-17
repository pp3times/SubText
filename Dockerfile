FROM node:18-alpine AS deps
RUN apk add --no-cache libc6-compat
WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm
RUN pnpm install

FROM node:18-alpine AS builder
WORKDIR /app
RUN npm install -g pnpm
COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NEXT_TELEMETRY_DISABLED 1

RUN pnpm build

FROM node:18-alpine AS runner
WORKDIR /app

# FROM python:3.9.7-slim-buster AS python
# RUN apt-get update && apt-get install -y \
# 		build-essential \
# 		libpq-dev \
# 		python3-dev \
# 		python3-pip \
# 		python3-setuptools \
# 		python3-wheel \
# 		&& rm -rf /var/lib/apt/lists/*
# RUN pip3 install --upgrade pip
# RUN pip3 install -r requirements.txt

ENV NODE_ENV production
ENV NEXT_TELEMETRY_DISABLED 1

RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

COPY --from=builder --chown=nextjs:nodejs /app/.next ./.next
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json

USER nextjs

EXPOSE 3000

ENV PORT 3000

CMD ["pnpm", "start"]
