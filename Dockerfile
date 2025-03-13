FROM node:18-alpine AS builder

RUN apk add --no-cache python3 make g++

WORKDIR /app

CMD ["npm", "run", "view"]
