# Dockerfile
FROM alpine:3.24 AS base

RUN apk add --no-cache bash


FROM base AS test

COPY src/ /app/src/
COPY test/ /app/test/

RUN find /app/src -type f -name '*.sh' -exec chmod +x {} + \
    && bash /app/test/run-tests.sh


FROM base AS runtime

COPY --from=test /app/src/ /app/

WORKDIR /app
ENTRYPOINT ["/app/entrypoint.sh"]
