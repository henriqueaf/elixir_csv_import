# ---- Elixir Base ----
FROM elixir:1.9-alpine

ENV APP_HOME="/elixir_csv_import"
# ENV MIX_ENV="dev"

# Use virtual build-dependencies tag so we can remove these packages after bundle install
RUN apk add --no-cache --virtual build-dependency \
  curl \
  && curl -o large_csv.csv https://www.stats.govt.nz/assets/Uploads/Building-consents-issued/Building-consents-issued-October-2019/Download-data/building-consents-issued-october-2019-csv.zip \
  && mkdir large_csv_files \
  && unzip -j large_csv.csv "Building consents by region (Monthly).csv" -d large_csv_files \
  && rm large_csv.csv

# Remove build dependencies and install runtime dependencies
RUN apk del build-dependency \
  && rm -rf /var/cache/apk/*

WORKDIR $APP_HOME

COPY mix.exs mix.lock ./

RUN mix local.hex --force \
  && mix deps.get \
  && mix local.rebar --force

COPY . .
