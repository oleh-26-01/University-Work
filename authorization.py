import spotipy
import os
import mysql_db
import json
import mysql

from spotipy.oauth2 import SpotifyClientCredentials, SpotifyOAuth


os.chdir(os.path.dirname(os.path.abspath(__file__)))
client_id = "1c6a484aa4634cf297f9c69cab7e4128"
client_secret = "b536925dc3fc4163874efe07e8a1bf81"
redirect_uri = "http://localhost:8888/callback"
scopes = [
    "ugc-image-upload",
    "user-read-playback-state",
    "user-modify-playback-state",
    "user-read-currently-playing",
    "app-remote-control",
    "streaming",
    "playlist-read-private",
    "playlist-read-collaborative",
    "playlist-modify-private",
    "playlist-modify-public",
    "user-follow-modify",
    "user-follow-read",
    "user-read-playback-position",
    "user-top-read",
    "user-read-recently-played",
    "user-library-modify",
    "user-library-read",
    "user-read-email",
    "user-read-private"
]
scope = " ".join(scopes)

db_main = mysql_db.Main()
users = mysql_db.Users(db_main)


def general_authorization(client_id, client_secret):
    client_credentials_manager = SpotifyOAuth(client_id, client_secret, redirect_uri=redirect_uri)
    sp = spotipy.Spotify(client_credentials_manager=client_credentials_manager)
    return sp

def user_authorization(client_id, client_secret, scope, cache_path="cache/5.json"):
    sp_user = spotipy.Spotify(auth_manager=SpotifyOAuth(client_id, client_secret, redirect_uri=redirect_uri, scope=scope, cache_path=cache_path))
    if sp_user is not None:
        with open(cache_path, 'r') as f:
            cache = json.load(f)
        if users.user_exists(sp_user.me()['id']) is False:
            users.add_user(
                spotify_id = sp_user.me()['id'],
                nickname = sp_user.me()['display_name'],
                reg_date = mysql_db.get_current_date(),
                access_token = cache['access_token'],
                token_type = cache['token_type'],
                expires_in = cache['expires_in'],
                expires_at = cache['expires_at'],
                refresh_token = cache['refresh_token']
            )
        else:
            users.update_user(
                spotify_id = sp_user.me()['id'],
                access_token = cache['access_token'],
                token_type = cache['token_type'],
                expires_in = cache['expires_in'],
                expires_at = cache['expires_at'],
                refresh_token = cache['refresh_token']
            )
        return sp_user

if __name__ == "__main__":
    sp_user = user_authorization(client_id, client_secret, scope)
    print(f"Authorization successful for {sp_user.me()['display_name']}")
