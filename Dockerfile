# Dockerfile
FROM alpine:3.24

RUN apk add --no-cache bash

WORKDIR /workspace

COPY src/ ./src/

CMD ["bash", "src/entrypoint.sh"]
