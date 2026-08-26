FROM ubuntu AS base

ARG TEST_VALUE=k7f3q9zx2m
RUN echo "base TEST_VALUE=${TEST_VALUE}"

RUN echo "fooo"

FROM base AS development
# bind-mounting the context forces a FULL context transfer without copying it into a layer
RUN --mount=type=bind,target=/ctx --mount=type=secret,id=mysecret \
    echo "development stage; secret bytes=$(wc -c < /run/secrets/mysecret)" && \
    echo "CTXSTAT allfiles=$(find /ctx -type f | wc -l) allbytes=$(du -sb /ctx | cut -f1)" && \
    echo "CTXSTAT gitfiles=$(find /ctx/.git -type f 2>/dev/null | wc -l) gitbytes=$(du -sb /ctx/.git 2>/dev/null | cut -f1)" && \
    echo "CTXSTAT wtfiles=$(find /ctx -type f -not -path '/ctx/.git/*' | wc -l) wtbytes=$(find /ctx -type f -not -path '/ctx/.git/*' -exec cat {} + | wc -c)" && \
    echo "CTXSTAT packs=$(ls /ctx/.git/objects/pack/ 2>/dev/null | tr '\n' ' ') looseobjs=$(find /ctx/.git/objects -type f -not -path '*/pack/*' 2>/dev/null | wc -l)"

FROM base AS production
RUN echo "PRODUCTION STAGE - MUST NOT BE BUILT when target=development"
