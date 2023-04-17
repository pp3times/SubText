FROM node:18-alpine

WORKDIR /app

COPY package*.json ./
COPY pnpm-lock.yaml ./

RUN npm i -g pnpm
RUN pnpm i --frozen-lockfile

COPY . .

RUN apk add --no-cache python3 \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools wheel

# COPY requirements.txt .
RUN pip3 install --no-cache-dir -r ./requirements.txt


RUN pnpm run build

EXPOSE 3000

CMD ["pnpm", "start"]
