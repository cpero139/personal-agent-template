FROM node:22-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm install -g pnpm
RUN pnpm install --frozen-lockfile

COPY . .

RUN pnpm build

CMD ["sh","-c","pnpm db:migrate && node .nuxt/dist/server/index.mjs"]

EXPOSE 3000
