CREATE DATABASE record_company;  		#helps to create a database
DROP DATABASE record_company; 			#helps to delete a database
USE record_company;     				#Use command helps to use that database. 

#==================================================================
#Practice to create a table with columns and then delete it. 
CREATE TABLE test (						#Helps to create a table
test_column INT							#First column created. 
);
ALTER TABLE test						#Helps to change things in table. 
ADD another_column VARCHAR(255);		#Created another table of Strings with 255 letters max. 
DROP TABLE test; 
#===================================================================

CREATE TABLE bands(
	id INT NOT NULL AUTO_INCREMENT,			#It will create it's own id and increment. 
	name VARCHAR(255) NOT NULL,				# NOT NULL means that it could not be empty.
	PRIMARY KEY (id)						#Primary key helps to get data quiker and idetify the data.
);

CREATE TABLE albums(
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    release_year INT,
    PRIMARY KEY (id),
    band_id INT NOT NULL,						#Create a band id 
    foreign key (band_id) references bands(id)	# Foreign key to connect the other table, and attach with particular ID
);


#========================================================================
#NOW lets see how to add a data and access a data.
#Don't be surprised we can use lower, upper, mix cases for commands. 
#SELECT USAGES. 

INSERT INTO bands (name)						#This is how we add one value 
VALUES ('Iron Maiden');

INSERT INTO bands (name)						#This is how we add multiple value 
VALUES ('Deuce'), ('Avenged Sevenfold'), ('Ankor');

# Query to get data. 
SELECT * FROM bands; 							# "*" means all column.  

Select * from bands limit 2;					# Will get first 2 command. 

select name from bands;							# we will only get name colume. 

select id AS 'ID', name as 'Band Name' from bands; #AS command helps to rename. 

select * from bands order by name; 				# You can order by ascending name. 
select * from bands order by name desc; 		# You can order by desecending name. 

# Adding to albums now
INSERT INTO albums (name, release_year, band_id)
VALUES ('The number of the beasts', 1985, 1),
	('Power slave', 1984, 1),
	('Nightmare',2018, 2),
    ('Nightmare',2010, 3),
    ('Text Album',NULL, 3);

select * from albums;			
select distinct name from albums;              #Only give unrepeated database. 

update albums
set release_year = 1982
where id = 1;									#where helps to constrain 

select * from albums			
where release_year < 2000 or name like '%er%' ;  # you can use AND and OR 

select * from albums
where name like '%er%';					#We can search for string in a name, with % being any amount of number ahead. 

delete from albums where id between  6 and 10; #This is how you delete a particular part of album. 
select * from albums;

#============================================================================================

#Now lets join band and album tables together. 
#INNER--> normal , LEFT--> left to right, AND RIGHT --> right to left JOIN

select * from bands
inner join albums on bands.id = albums.band_id;

#==============================================================================================
#Aggregrate function & group by

select avg(release_year) from albums;  #return an average function
select sum(release_year) from albums;
select count(release_year) from albums;

select band_id, count(band_id) from albums
group by band_id;

#Special code to understand deeper

select b.name as band_name, count(a.id) as num_albums
from bands as b
left join albums as a on b.id = a.band_id
group by b.id
having num_albums =1;  				#Having works like where but different 







