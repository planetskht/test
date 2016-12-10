#!/usr/bin/env bash
rm -rf public/uploads/attachment
echo "db:drop.."
rake db:drop
echo "db:create.."
rake db:create
echo "db:migrate..."
rake db:migrate
echo "db:seed..."
rake db:seed