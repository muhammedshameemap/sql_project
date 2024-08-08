#Trial
use spotifytrial; 
select * from spotify2024;

                    ###CLEANING###
#Dropping Columns with null values
    
     #Detection
select count(*)  from spotify2024 where SiriusXM_Spins is null;
select count(*)  from spotify2024 where Soundcloud_Streams is null;
      #Dropping
alter table spotify2024 drop column Tidal_popularity;
alter table spotify2024 drop column Soundcloud_Streams;
alter table spotify2024 drop column SiriusXM_Spins;
select count(*) from spotify2024;

#Dopping Rows with null values

delete from spotify2024 where Spotify_Streams is null;
delete from spotify2024 where Spotify_Playlist_Count is null;
delete from spotify2024 where Spotify_Playlist_Reach is null;
delete from spotify2024 where Spotify_Popularity is null;
delete from spotify2024 where YouTube_Views is null;
delete from spotify2024 where YouTube_Likes is null;
delete from spotify2024 where TikTok_Posts  is null;
delete from spotify2024 where TikTok_Likes  is null;
delete from spotify2024 where TikTok_Views is null;
delete from spotify2024 where YouTube_Playlist_Reach is null;
delete from spotify2024 where Apple_Music_Playlist_Count is null;
delete from spotify2024 where AirPlay_Spins  is null;
delete from spotify2024 where Deezer_Playlist_Count  is null;
delete from spotify2024 where Deezer_Playlist_Reach  is null;
delete from spotify2024 where Amazon_Playlist_Count  is null;
delete from spotify2024 where Pandora_Streams is null;
delete from spotify2024 where Pandora_Track_Stations  is null;
delete from spotify2024 where Shazam_Counts  is null;
delete from spotify2024 where Explicit_Track  is null;

     #Adding a column

alter table spotify2024 add column(Year int);
#Updating value
update spotify2024 set year=year(Release_Date);

#Positioning the columns
alter table spotify2024 modify year int after Release_date;
alter table spotify2024 modify ISRC varchar(12) first;


#Eliminating commas
set sql_safe_updates=0;
UPDATE spotify2024
SET All_Time_Rank= REPLACE(All_Time_Rank, ',', '');
UPDATE spotify2024
SET Spotify_Streams= REPLACE(Spotify_Streams, ',', '');
UPDATE spotify2024
SET Spotify_Playlist_Count= REPLACE(Spotify_Playlist_Count, ',', '');
UPDATE spotify2024
SET Spotify_Playlist_Reach= REPLACE(Spotify_Playlist_Reach, ',', '');
UPDATE spotify2024
SET YouTube_Views= REPLACE(YouTube_Views, ',', '');
UPDATE spotify2024
SET YouTube_Likes = REPLACE(YouTube_Likes, ',', '');
UPDATE spotify2024
SET TikTok_Posts = REPLACE(TikTok_Posts, ',', '');
UPDATE spotify2024
SET TikTok_Likes= REPLACE(TikTok_Likes, ',', '');
UPDATE spotify2024
SET TikTok_Views= REPLACE(TikTok_Views, ',', '');
UPDATE spotify2024
SET YouTube_Playlist_Reach= REPLACE(YouTube_Playlist_Reach, ',', '');
UPDATE spotify2024
SET AirPlay_Spins = REPLACE(AirPlay_Spins, ',', '');
UPDATE spotify2024
SET Deezer_Playlist_Reach= REPLACE(Deezer_Playlist_Reach, ',', '');
UPDATE spotify2024
SET Pandora_Streams= REPLACE(Pandora_Streams, ',', '');
UPDATE spotify2024
SET Pandora_Track_Stations = REPLACE(Pandora_Track_Stations, ',', '');
UPDATE spotify2024
SET Shazam_Counts= REPLACE(Shazam_Counts, ',', '');

##Changing Datatype
alter table spotify2024 modify All_Time_Rank int;
alter table spotify2024 modify Spotify_Streams BIGINT;
alter table spotify2024 modify Spotify_Playlist_Count int;
alter table spotify2024 modify Spotify_Playlist_Reach int;
alter table spotify2024 modify YouTube_Views bigint;
alter table spotify2024 modify YouTube_Likes int;
alter table spotify2024 modify TikTok_Posts int;
alter table spotify2024 modify TikTok_Likes bigint;
alter table spotify2024 modify TikTok_Views bigint;
alter table spotify2024 modify YouTube_Playlist_Reach bigint;
alter table spotify2024 modify Apple_Music_Playlist_Count bigint;
alter table spotify2024 modify AirPlay_Spins int;
alter table spotify2024 modify Deezer_Playlist_Reach int;
alter table spotify2024 modify Pandora_Streams int;
alter table spotify2024 modify Pandora_Track_Stations int;
alter table spotify2024 modify Shazam_Counts int;