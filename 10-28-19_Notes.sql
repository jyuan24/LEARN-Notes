-- intro to ruby on rails...learning some sql today
notes to look at 
https://github.com/LEARNAcademy/Syllabus/blob/master/Rails-C%26V/00rails_http_intro.md


below the idea of diagram of how internet works

computer makes request to webpage ->
internet DNS relays info to web server/database ->
"middleware" kinda like a birthday cake... top of the stack gets converted to "rack" (ie related to json, hash, this is how ruby on rails works) ->
    then another stack is a "cookie" layer ->
    multiple stacks of random stuff ->
    then  controller towards bottom of the stack which will decide which resources of the app will be pulled out to fulfill user request ->
    then "model" layer (more business logic vs controller, ie vehicle has 4 wheels etc) and "view" layer processes the info from controller and passes info back up to controller layer ->
    info then goes back up to each layer to give them another opportunity to act on that request. stuff can be done to it on the way down, or up (ie compression), or both ->
info sent back to the internet DNS ->
then back to computer for user

controller vs model is kinda confusing...controller is like the traffic light, model is like the traffic cop directing traffic? did i hear that right...?

we will be focusing on MODEL



notes to look at
https://github.com/LEARNAcademy/Syllabus/blob/master/sql/07rails_intro_postgres.md

we use structored query language rails to communicate to sql database, which then returns info to us as 

postgress - is relational..relates databases
    'foreign_key' kinda a key word for something used to relate databases between diff structures
    in example in class, there is a 'cities' table and a 'countries' table which can be called
instance - a row of the database
schema - shape of the database...the table
    in class example, we have city, class, and languages, 3 tables for example
attributes - within countries table, there is a row or instance that has USA with many attributes such as name, population, etc
relation or table - collection of instances that contain the same attributes
primary key - unique ID automatically generated by rails



MODELS
model of a person example
given name:
family name:
dob:
address:
email:
^ gets translated into rows/columns aka attributes as seen in notes

shape of the table formed as seen...our schema

each row in the table has a unique identifier or primary key
for example, each example of given name attribute gets assigned a number, like 1, 2, 3, etc.



rails comparisons
"Where" clause used in in class example country.where or something
can also do:
    = != > < >= <= BETWEEN LIKE IN NOT AND OR
    
SELECT * FROM persons WHERE age  BETWEEN 13 AND 17; -> select everything from a persons table where the age attribute is between 13 and 17
SELECT * FROM persons WHERE name LIKE 'We%'; -> uses % wildcard


ability to order the query by adding an ORDER BY clause after the WHERE clause (default by assending order, can change with either ASC or DESC)
ability to limit # of rows returned by adding LIMIT clause after WHERE clause

null means "no value", nil in ruby, undefined in js
can use is null, is not null, or coalesce which returns first non-null value


country database already exists on class computers, will be working with those

use of PGAdmin will get us familiar with running databases etc

SELECT
    code,
    name,
    population
FROM
    country;
    
copy the above into PGAdmin and as practice

in the countries.sql file, the schema is the CREATE block

to bring back countries from before list that start with 'a', we need a where clause, google help
select, from, where, etc not case sensitive, but good practice for readability
SELECT
    code,
    name,
    population
FROM
    country;
WHERE
    name LIKE 'A%'; -- is case sensitive
    
now order the results by name
SELECT
    code,
    name,
    population
FROM
    country;
WHERE
    name LIKE 'A%';
ORDER BY
    name; -- or name DESC to go backwards
-- LIMIT 2; -- if i want just first 2 requests back
^ order of select, from, etc is important, otherwise may return error

SELECT
FROM
WHERE
GROUP BY
B
ORDER BY
LIMIT

logics - negation, union (replaces or clause), intersection (replaces and clause), difference,

SELECT code, name, population, gnp FROM country WHERE population > 1e+8
INTERSECT
SELECT code, name, population, gnp FROM country WHERE gnp > 1e+6
same as below 
SELECT
  code,
  name,
  population,
  gnp
FROM
  country
WHERE
  population > 1e+8
  AND
  gnp > 1e+6;

example below
SELECT
    continent,
    SUM(population) AS total_population -- AS added to rename column, otherwise it'll just show population for each continent...MUST USE AN AGGREGATE FUNCTION
FROM
    country
GROUP BY
    continent; -- this groups countries by continent, does not show countries

above example renamed 'total_population' can be used outside the scope of the block

pgAdmin steps
object -> create server -> name 'local' or something like that -> connection Host: localhost -> Username: learn -> password: SDlearn123
'country' database -> tools: query tool -> type in SELECT code FROM country



-- JOINING IN SQL
https://github.com/LEARNAcademy/Syllabus/blob/master/sql/08rails_sql_joins.md

example in lecture...
usa has 6 languages..using join allows the table to return multiple instances of usa for each language it has
table aliases part is what links country code to countrylanguage.countrycode  c.code=cl.countrycode
if we alias anywhere we have to also alias in the select
the table. not necessary IF the category is specific to only that table