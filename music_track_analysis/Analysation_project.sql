                ##TRIAL##
#Analyzation

#Top 10 Artist with most number of tracks
select artist,count(*) as count from spotify2024 group by artist order by count desc limit 10;
#Top 10 artists with all time rank
select artist,Track,All_Time_Rank from spotify2024 order by All_Time_Rank  limit 10;

#Most favored songs and artist
create temporary table tiktoklikes as select Track,Artist,tikTok_likes from spotify2024 order by tiktok_likes desc limit 30;
select * from tiktoklikes;
alter  table tiktoklikes rename column Track to Track2;
alter  table tiktoklikes rename column Artist to Artist2;
create temporary table Youtubelikes as select Track,Artist,Youtube_likes from spotify2024 order by Youtube_likes desc limit 30;
select * from Youtubelikes;
create temporary table likes select * from  Youtubelikes inner join tiktoklikes on Youtubelikes.Track=tiktoklikes.Track2;
select * from likes;
select Artist,Track,Youtube_likes + tiktok_likes as likes_sum from likes order by likes_sum desc ;

#Top 10 Artist with most explicit track
select artist,sum(explicit_track) from spotify2024 group by artist order by sum(explicit_track) desc limit 10;

#Popularity on spotify 
select artist,track,spotify_streams from spotify2024 order by spotify_streams desc limit 10;
select artist,track,Spotify_Playlist_Count from spotify2024 order by Spotify_Playlist_Count desc limit 10;

#Artists and tracks with their views and corresponding remark-Youtube
select Artist,Track,YouTube_Views,case when YouTube_Views<5000000 then 'Less viewed' when YouTube_Views>=5000000 and  YouTube_Views<500000000 then 'Average'
  when  YouTube_Views>=500000000 and YouTube_Views<5000000000 then 'Highly viewed'  else 'Most viewed' end as Remarks  from spotify2024 order by YouTube_Views desc;

#Tiktok popularity
create temporary table TiktokViews as select artist,track, TikTok_Views from spotify2024 order by TikTok_Views desc limit 10;
alter  table tiktokviews rename column Track to Track2;
alter  table tiktokviews rename column Artist to Artist2;
select * from Tiktokviews;
create temporary table Tiktokposts as select artist,track,Tiktok_posts  from spotify2024 order by Tiktok_posts desc limit 10;
select * from Tiktokposts;
create temporary table tiktok select * from TiktokViews  inner join Tiktokposts on TiktokViews.Track2=Tiktokposts.Track;
select Artist,Track,Tiktok_Views+Tiktok_posts as Sum from tiktok order by sum desc;

#Most popular music platform
select avg(Spotify_Streams),avg(YouTube_Views),avg(Tiktok_posts),avg(Apple_Music_Playlist_Count),
   avg(AirPlay_Spins),avg(Deezer_Playlist_Reach),avg(Amazon_Playlist_Count),avg(Pandora_Streams),avg(Shazam_Counts)from spotify2024;
select value from (select avg(Spotify_Streams)as value from spotify2024 union all select avg(YouTube_Views)as value from spotify2024 
 union all select avg(Tiktok_posts)as value from spotify2024 union all select avg(Apple_Music_Playlist_Count)as value from spotify2024 union all
  select avg(AirPlay_Spins)as value from spotify2024 union all select avg(Deezer_Playlist_Reach)as value from spotify2024 union all select avg(Amazon_Playlist_Count)as 
  value from spotify2024 union all select avg(Pandora_Streams)as value from spotify2024 union all select avg(Shazam_Counts)as value from spotify2024)
  as all_values order by value desc; 
  
  #Year wise release
  select year,count(*) as count  from spotify2024 group by year order by count(*) desc;
  
  #Top 10 most popular artist in Deezer.
select Artist, Track,Deezer_Playlist_Count from spotify2024 order by Deezer_Playlist_Count desc limit 10;

 #Top 10 most popular artist in Pandora.
select Artist, Track,Pandora_Streams from spotify2024 order by Pandora_Streams desc limit 10;
#Top 10 most popular artist in Shazam.
select Artist, Track,Shazam_counts from spotify2024 order by Shazam_counts desc limit 10;

#Common tracks that are popular on video platforms. 
create temporary table TiktokViews1 as select artist,track, TikTok_Views from spotify2024 order by TikTok_Views desc limit 30;
alter  table tiktokviews1 rename column Track to Track2;
alter  table tiktokviews1 rename column Artist to Artist2;
select * from Tiktokviews1;
create temporary table Youtubeviewes as select Track,Artist,Youtube_views from spotify2024 order by Youtube_views desc limit 30;
select * from Youtubeviewes;
create temporary table views select * from  Youtubeviewes inner join tiktokviews1 on Youtubeviewes.Track=Tiktokviews1.Track2;
select * from views;
-- drop table views;