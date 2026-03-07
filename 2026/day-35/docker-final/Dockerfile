# Stage 1: Builder
FROM node:18.20-alpine AS builder

# Sets /app as the working directory inside the container.
# All commands now run inside that folder.
WORKDIR /app  

# Copies package.json from your machine to the container.
# This file defines your Node project dependencies.
COPY package.json .

# Installs only production dependencies.
# Development tools like testing frameworks are skipped.
# This reduces container size.
RUN npm install --omit=dev

# Copies your application source code into the container.
COPY app.js .

# Stage 2: Production

# Now Docker starts a fresh image.
# None of the builder stage files exist here yet.
FROM node:18.20-alpine

WORKDIR /app

# Create non-root user
RUN adduser -D appuser

# Docker copies the /app folder from the builder stage into this stage.
COPY --from=builder /app /app

# Changes ownership of the /app folder to appuser.
# Otherwise the files would belong to root.
RUN chown -R appuser:appuser /app

# Switches the container to run as the appuser user instead of root.
USER appuser

# verify
RUN whoami

EXPOSE 8080

CMD ["node", "app.js"]