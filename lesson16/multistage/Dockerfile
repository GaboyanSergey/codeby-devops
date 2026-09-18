FROM node:22-alpine AS builder

WORKDIR /app

COPY app/package*.json ./

RUN npm install --production

COPY app/ .

FROM node:22-alpine

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/index.js ./
COPY --from=builder /app/package.json ./
COPY --from=builder /app/views ./views
COPY --from=builder /app/public ./public

EXPOSE 5000

ENV PORT=5000

CMD ["node", "index.js"]
