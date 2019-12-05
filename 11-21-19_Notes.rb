Active Storage
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails_ActiveStorage/README.md
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails_ActiveStorage/01-aws-bucket-s3.md
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails_ActiveStorage/02-aws-iam.md
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails_ActiveStorage/03-rails.md
https://github.com/learn-academy-2019-echo/Syllabus/blob/master/Rails_ActiveStorage/04-react.md

uploading photos into cat tinder:

- upload photos to existing records in database

photos would get stored into AWS S3

react
internet
rails
s3
local files


1. react local files -> local files to internet -> local files to rails server 
2. -> file to store to internet -> file to store to s3 
3. -> file url to internet -> file url to rails 
4a. -> json object to internet -> json object to react
4b. -> img from s3 to internet -> img to react

setting up aws s3
scope of s3 recommended to be per project, each computer would need to update the keys to be able to access
alternatively, everyone can have their own buckets to work with, but obviously not on production level
- copy from notes
    - instead of 'learn-example', rename with own bucket link name

- when setting up the storage.yml file, remember to update region to correct one (compare yml info and aws bucket info and make sure they ==)

jbuilder
- when setting up, need a show.json.jbuilder file to copy notes in