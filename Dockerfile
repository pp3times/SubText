FROM node:18-alpine

WORKDIR /app
COPY . .

RUN apk add --no-cache python3 \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools wheel

# COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

RUN npm install
# RUN npm cache clean
# RUN npm install -g npm
# RUN npm install

CMD ["npm", "run", "dev"]
