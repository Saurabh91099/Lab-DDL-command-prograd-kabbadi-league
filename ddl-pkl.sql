-- PROGRESSION - 1


-- 1. **Create table city**
create table city(
id number(11) Primary Key,
name varchar(50) not null);

-- 2. **Create table referee**
create table referee(
id number(11) Primary key,
name varchar(50) not null);

-- 3. **Create table innings**
create table innings(
id number(11) primary key,
name varchar(50) not null);

-- 4. **Create table extra_type**
create table extra_type(
id number(11) primary key,
name varchar(50) not null);

-- 5. **Create table skill**
create table skill(
id number(11) primary key,
name varchar(50) not null);

-- 6. **Create table team**
create table team(
id number(11) primary key,
name varchar(50) not null,
coach varchar(50) not null,
CONSTRAINT home_city  FOREIGN KEY (id)
    REFERENCES city(id),
    captain number(11) not null);

-- 7. **Create table player**
create table player(
id number(11) primary key,
name varchar(50) not null,
country varchar(50) not null,
CONSTRAINT skill_id FOREIGN KEY (id)
    REFERENCES skill(id),
CONSTRAINT team_id FOREIGN KEY (id)
    REFERENCES team(id));  

-- 8. **Create table venue**
create table venue(
id number(11) primary key,
stadium_name varchar(50) not null,
CONSTRAINT city_id FOREIGN KEY (id)
    REFERENCES city(id));                    

-- 9. **Create table event**
create table event(
id number(11) primary key,
CONSTRAINT innings_id FOREIGN KEY (id)
    REFERENCES innings(id),
event_no number(11) not null,
CONSTRAINT raider_id FOREIGN KEY (id)
    REFERENCES player(id),
raid_points number(11) not null,
defending_points number(11) not null,
clock_in_seconds number(11) not null,
team_one_score number(11) not null,
team_two_score number(11) not null);
                    
-- 10. **Create table extra_event**
create table extra_event(
id number(11) primary key,
CONSTRAINT event_id FOREIGN KEY (id)
    REFERENCES event(id),
CONSTRAINT extra_type_id FOREIGN KEY (id)
    REFERENCES extra_type(id),
points number(11) not null,    
CONSTRAINT scoring_team_id FOREIGN KEY (id)
    REFERENCES team(id));                    

-- 11. **Create table outcome**
create table outcome(
id number(11) primary key,
status varchar(50) not null,
CONSTRAINT winner_team_id FOREIGN KEY (id)
    REFERENCES team(id),
score number(11) not null,
CONSTRAINT player_of_match FOREIGN KEY (id)
    REFERENCES player(id));                     

-- 12. **Create table game**
create table game(
id number(11) primary key,
game_date Date,
CONSTRAINT team_id_1 FOREIGN KEY (id)
    REFERENCES team(id),
CONSTRAINT team_id_2 FOREIGN KEY (id)
    REFERENCES team(id),
CONSTRAINT venue_id FOREIGN KEY (id)
    REFERENCES venue(id),
CONSTRAINT outcome_id FOREIGN KEY (id)
    REFERENCES outcome(id),
CONSTRAINT referee_id_1 FOREIGN KEY (id)
    REFERENCES referee(id),
CONSTRAINT referee_id_2 FOREIGN KEY (id)
    REFERENCES referee(id),
CONSTRAINT first_innings_id FOREIGN KEY (id)
    REFERENCES innings(id),
CONSTRAINT second_innings_id FOREIGN KEY (id)
    REFERENCES innings(id));    
                      
-- 13. **Drop table city**
                       

-- 14. **Drop table innings**

-- 15. **Drop table skill**

-- 16. **Drop table extra_type**
