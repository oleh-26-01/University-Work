import os
import json
import mysql_db
import authorization

from time import time
from authorization import client_id, client_secret, scope

os.chdir(os.path.dirname(os.path.abspath(__file__)))

class User:
    def __init__(self, id, auth_data, cache_path):
        self.id = id
        self.auth_data = auth_data
        self.cache_path = cache_path
        
        self.sp = None
        self.log_in()
        
        self.status = 'offline'
        self.last_status_update = -1
        self.update_status()
        
        self.listening = None
    
    def log_in(self):
        self.create_cache()
        self.sp = authorization.user_authorization(client_id, client_secret, scope, self.cache_path)
        self.read_cache()
        print(f'Logged in as {self.sp.me()["display_name"]}, db id: {self.id}')
        return self.sp
    
    def create_cache(self):
        with open(self.cache_path, 'w') as f:
            json.dump(self.auth_data, f)
    
    def read_cache(self):
        with open(self.cache_path, 'r') as f:
            self.auth_data = json.load(f)
        
    def update_status(self):
        if self.sp.currently_playing() is not None:
            self.status = 'online'
        else:
            self.status = 'offline'
        self.last_status_update = time()
        
class Song:
    def __init__(self, playing_data, songs, authors, songs_authors):
        self.id = None
        self.playing_data = playing_data
        self.songs = songs
        self.spotify_id = playing_data['item']['id']
        self.name = playing_data['item']['name']
        self.duration = playing_data['item']['duration_ms'] // 1000
        self.playing_progress = playing_data['progress_ms'] // 1000
        self.last_update = time()
        self.set_id()
        
    def set_id(self):
        if self.songs.song_exists(self.spotify_id) is False:
            self.songs.add_song(self.spotify_id, self.name, self.duration)
            self.id = self.songs.get_song(spotify_id=self.spotify_id)[0]
            for author in self.playing_data['item']['artists']:
                if authors.author_exists(author['id']) is False:
                    authors.add_author(author['id'], author['name'])
                author_id = authors.get_author(spotify_id=author['id'])[0]
                songs_authors.add_connection(self.id, author_id)
        else:
            self.id = self.songs.get_song(spotify_id=self.spotify_id)[0]
    
if __name__ == "__main__":
    update_users_dt = lambda x = time(): time() - x > 60
    db_main = mysql_db.Main()
    users = mysql_db.Users(db_main)
    songs = mysql_db.Songs(db_main)
    authors = mysql_db.Authors(db_main)
    songs_authors = mysql_db.Songs_Authors(db_main)
    listening_history = mysql_db.Listening_History(db_main)
    
    users_auth_data = users.get_auth_data()
    all_users = []
    for user_data in users_auth_data:
        auth_data = dict(zip(['access_token', 'token_type', 'expires_in', 'expires_at', 'refresh_token'], user_data[1:]))
        auth_data['scope'] = authorization.scope
        all_users.append(User(user_data[0], auth_data, f"cache/{user_data[0]}.json"))
            
    while True:
        if update_users_dt():
            users_auth_data = users.get_auth_data()
            for user_data in users_auth_data:
                if user_data[0] not in [user.id for user in all_users]:
                    auth_data = dict(zip(['access_token', 'token_type', 'expires_in', 'expires_at', 'refresh_token'], user_data[1:]))
                    auth_data['scope'] = authorization.scope
                    all_users.append(User(user_data[0], auth_data, f"cache/{user_data[0]}.json"))
            update_users_dt = lambda x = time(): time() - x > 60
        
        for user in all_users:
            if user.last_status_update < 60:
                user.update_status()
                
            if user.status == 'offline':
                continue
            elif user.status == 'online':
                playing_data = user.sp.currently_playing()
                if playing_data is not None and playing_data['is_playing'] is True:
                    song = Song(playing_data, songs, authors, songs_authors)
                    listening = user.listening
                    if listening is None:
                        user.listening = song
                    elif listening.id != song.id or (listening.playing_progress / listening.duration > 0.9 and song.playing_progress / song.duration < 0.1):
                        if time() - listening.last_update > listening.duration - listening.playing_progress:
                            listening.playing_progress = listening.duration
                        listening_history.add_listening(user.id, listening.id, mysql_db.get_current_datetime(), listening.playing_progress)
                        user.listening = song
                    else:
                        user.listening = song