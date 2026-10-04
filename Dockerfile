FROM node:22-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN corepack enable && pnpm install --frozen-lockfile --prod

COPY index.ts ./

ENV PORT=4000
EXPOSE 4000
CMD ["node", "--experimental-strip-types", "index.ts"]
