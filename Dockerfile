FROM node:18-alpine

WORKDIR /app
COPY . .

RUN apk add python3 \
    && python3 -m ensurepip \
    && pip3 install --upgrade pip setuptools wheel

# COPY requirements.txt .
RUN pip3 install -r requirements.txt

RUN npm install
# RUN npm cache clean
# RUN npm install -g npm
# RUN npm install

# chmod +x /app/scripts/download-audio.sh
RUN chmod +x /app/scripts/download-audio.sh

CMD ["npm", "run", "dev"]

# FROM node:18-alpine AS development
# WORKDIR /app
# ENV HOST=0.0.0.0
# ENV PORT=3000
# ENV NODE_ENV=development
# EXPOSE 3000
# CMD [ "yarn", "dev" ]

# FROM node:18-alpine AS dependencies
# ENV NODE_ENV=production
# WORKDIR /app
# COPY package.json yarn.lock ./
# RUN yarn install --frozen-lockfile

# FROM node:18-alpine AS builder
# ENV NODE_ENV=development
# WORKDIR /app
# COPY . .
# RUN yarn install --frozen-lockfile && NODE_ENV=production yarn build

# FROM node:18-alpine AS production
# WORKDIR /app
# ENV HOST=0.0.0.0
# ENV PORT=3000
# ENV NODE_ENV=production
# COPY --chown=node --from=builder /app/next.config.js ./
# COPY --chown=node --from=builder /app/public ./public
# COPY --chown=node --from=builder /app/.next ./.next
# COPY --chown=node --from=builder /app/yarn.lock /app/package.json ./
# COPY --chown=node --from=dependencies /app/node_modules ./node_modules
# USER node
# EXPOSE 3000
# CMD [ "yarn", "start" ]