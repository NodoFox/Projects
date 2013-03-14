create database VideoSharing;
use VideoSharing;

create table Users(
username varchar(50),  
password varchar(50) NOT NULL, 
name varchar(50) NOT NULL, 
email varchar(50) NOT NULL UNIQUE, 
date_registered date NOT NULL,
PRIMARY KEY (username)
); 

create table Videos(
video_id varchar(50),
title varchar(150) NOT NULL,
uploaded_by varchar(50) NOT NULL,
uploaded_at datetime NOT NULL,
category varchar(50) NOT NULL,
PRIMARY KEY (video_id),
FOREIGN KEY (uploaded_by) REFERENCES Users(username)
);

create table Advertisements(
ad_id varchar(50) ,
advertiser varchar(50) NOT NULL,
price float(10,2) NOT NULL,
views_wanted int NOT NULL,
PRIMARY KEY (ad_id),
FOREIGN KEY (advertiser) REFERENCES Users(username)
);

create table Ad_Target_Categories(
ad_id varchar(50) NOT NULL,
category varchar(50) NOT NULL,
CONSTRAINT id_category PRIMARY KEY(ad_id,category),
FOREIGN KEY(ad_id) REFERENCES Advertisements(ad_id)
);

create table Views(
user varchar(50) NOT NULL,
video varchar(50) NOT NULL,
viewed_at datetime NOT NULL,
rating int,
ad_shown varchar(50),
ad_clicked boolean,
FOREIGN KEY (user) REFERENCES Users(username),
FOREIGN KEY (video) REFERENCES Videos(video_id),
FOREIGN KEY (ad_shown) REFERENCES Advertisements(ad_id),


CONSTRAINT pk_user1 PRIMARY KEY(user,video,viewed_at)
);

create table Partners(
username varchar(50) NOT NULL,
revenue_share double NOT NULL,
PRIMARY KEY (username),
FOREIGN KEY (username) REFERENCES Users(username)
);