FROM gitpod/workspace-postgres

USER root

ENV DEBIAN_FRONTEND noninteractive

RUN wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
    && dpkg -i erlang-solutions_2.0_all.deb \
    && apt-get update \
    && apt-get install esl-erlang -y \
    && apt-get install elixir -y \
    && mix local.hex --force \
    && mix local.rebar --force \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* \
    && curl -o large_csv.csv https://www.stats.govt.nz/assets/Uploads/Building-consents-issued/Building-consents-issued-October-2019/Download-data/building-consents-issued-october-2019-csv.zip \
    && unzip large_csv.csv -d large_csv_files
