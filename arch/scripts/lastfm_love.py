#! /usr/bin/python

import pylast
import pynotify
import mpd

#Go to http://www.last.fm/api/account and get the below mentioned fields to
#authenticate yourself.
API_KEY = 'yyy'
API_SECRET = 'xxx'

# create client object
client = mpd.MPDClient()
# connect to localhost:6600
client.connect("localhost", 6600)

#if client.status()['state'] == 'play':

#Fetch current playing song's title
track_name = client.currentsong()['title']
#Fetch current playing song's artist
artist_name = client.currentsong()['artist']


#print track_name.lower()
#print artist_name.lower()


#Last.fm username and md5 password hash.
username = 'yyy'
password_hash = 'xxx'

#A Last.fm network object
network = pylast.LastFMNetwork(api_key = API_KEY, api_secret = 
                               API_SECRET, username = username, password_hash = password_hash)

#Return a track object.
track_2_love = network.get_track(artist_name, track_name)

#Adds the track to the user's loved tracks
track_2_love.love()

#Return User Object
user_object = network.get_user(username)

#Return the last loved track
loved_track_list = user_object.get_loved_tracks(1)

#Return user's total playcount
playcount = user_object.get_playcount()
#print playcount

#Get artist - track in unicode format
last_loved_track = str(loved_track_list[0][0])

#Get last loved artist,track name
artist_loved,track_loved = last_loved_track.split(' - ')
#print track_loved.lower()

#instantiate pynotify
#pynotify.init("MPD Last.fm Love Track")

#Check if track loved previously or not than
#send notification.

#if track_name.lower() == track_loved.lower():

    #Construct string for notification body
#    string_to_notify = "<b>Artist</b>:  {0}\n<b>Title</b>:  {1}".format(artist_loved, track_loved)
    #Show and send notification
#    notify_love = pynotify.Notification("MPD Last.fm Love Track", string_to_notify, ICON)
#    notify_love.show()

#else:

    #Construct string for notification body
 #   string_to_notify = "<b>Track already loved</b>\nArtist: {0}\nTitle: {1}".format(artist_name, track_name)
    #Show and send notification
  #  notify_love = pynotify.Notification("MPD Last.fm Love Track", string_to_notify, ICON)
#notify_love.show()
