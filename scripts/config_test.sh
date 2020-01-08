#!/usr/bin/env bash

export MIX_ENV=test

echo "Creating database"
mix ecto.create

echo "Migrating Database"
mix ecto.migrate
