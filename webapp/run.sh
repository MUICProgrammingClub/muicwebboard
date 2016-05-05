#!/bin/bash
RAILS_ENV=production rake db:migrate
RAILS_ENV=production rails runner "Course.reindex"

RAILS_ENV=production rake add_all_course:seed
RAILS_ENV=production rake add_all_instructor:seed
RAILS_ENV=production rake add_major:seed
RAILS_ENV=production rake add_term:seed
RAILS_ENV=production rake create_role:seed

RAILS_ENV=production rails server -p 3000 -b '0.0.0.0'
