FROM ubuntu AS base

ARG TEST_VALUE=k7f3q9zx2m
RUN echo "base TEST_VALUE=${TEST_VALUE}"

FROM base AS development
RUN --mount=type=secret,id=mysecret \
    echo "development stage; secret bytes=$(wc -c < /run/secrets/mysecret)"

FROM base AS production
RUN echo "PRODUCTION STAGE - MUST NOT BE BUILT when target=development"
