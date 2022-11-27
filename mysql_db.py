import mysql.connector

from time import time, localtime, strftime

# users table: id, spotify_id, nickname, reg_date, access_token, token_type, expires_in, expires_at, refresh_token
# songs table: id, spotify_id, name, duration
# authors table: id, spotify_id, full_name
# songs_authors table: song_id, author_id
# listening_history table: id, user_id, song_id, date, duration
# transactions table: id, user_id, date, type
# subscriptions table: user_id, transaction_id, expiration
# friendship table: id, user_a, user_b, date, status

def get_current_date():
    return strftime('%Y-%m-%d', localtime(time()))

def get_current_datetime():
    return strftime('%Y-%m-%d %H:%M:%S', localtime(time()))

class Main:
    def __init__(self):
        self.config = {
            'user': 'root',
            'password': '15485863',
            'host': 'localhost',
            'database': 'test_db_1',
            'raise_on_warnings': True
        }
        self.connection_time = time()
        self.delayed_insert_timeout = 300
        self.cnx = mysql.connector.connect(**self.config)
        self.cursor = self.cnx.cursor(buffered=True)
    
    def check_connection(self):
        if time() - self.connection_time > self.delayed_insert_timeout:
            self.cnx = mysql.connector.connect(**self.config)
            self.cursor = self.cnx.cursor(buffered=True)
            self.connection_time = time()
        return self.connection_time
        
    def query(self, sql):
        self.check_connection()
        self.cursor.execute(sql)
        result = self.cursor.fetchall()
        return result
    
    def close(self):
        self.cnx.close()
        
class Users:
    def __init__(self, main):
        self.main = main
        self.table_name = 'users'
        self.table_columns = ['id', 'spotify_id', 'nickname', 'reg_date', 'access_token', 'token_type', 'expires_in', 'expires_at', 'refresh_token']
        
    def add_user(self, spotify_id, nickname, reg_date, access_token, token_type, expires_in, expires_at, refresh_token):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)'
        val = (spotify_id, nickname, reg_date, access_token, token_type, expires_in, expires_at, refresh_token)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_user")
        return self.main.cursor.lastrowid
        
    def user_exists(self, spotify_id):
        self.main.check_connection()
        sql = f'SELECT * FROM {self.table_name} WHERE spotify_id = %s'
        val = (spotify_id,)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        if len(result) > 0:
            return True
        else:
            return False
        
    def update_user(self, spotify_id, access_token, token_type, expires_in, expires_at, refresh_token):
        self.main.check_connection()
        sql = f'UPDATE {self.table_name} SET access_token = %s, token_type = %s, expires_in = %s, expires_at = %s, refresh_token = %s WHERE spotify_id = %s'
        val = (access_token, token_type, expires_in, expires_at, refresh_token, spotify_id)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record(s) affected. update_user")
        
    def get_auth_data(self):
        self.main.check_connection()
        sql = f'SELECT id, access_token, token_type, expires_in, expires_at, refresh_token FROM {self.table_name}'
        self.main.cursor.execute(sql)
        result = self.main.cursor.fetchall()
        return result
    
class Songs:
    def __init__(self, main):
        self.main = main
        self.table_name = 'songs'
        self.table_columns = ['id', 'spotify_id', 'name', 'duration']
        
    def add_song(self, spotify_id, name, duration):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s, %s)'
        val = (spotify_id, name, duration)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_song")
        return self.main.cursor.lastrowid
    
    def song_exists(self, spotify_id):
        self.main.check_connection()
        sql = f'SELECT * FROM {self.table_name} WHERE spotify_id = %s'
        val = (spotify_id,)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        if len(result) > 0:
            return True
        else:
            return False
        
    def get_song(self, id = None, spotify_id = None):
        self.main.check_connection()
        if id is not None:
            sql = f'SELECT * FROM {self.table_name} WHERE id = %s'
            val = (id,)
        elif spotify_id is not None:
            sql = f'SELECT * FROM {self.table_name} WHERE spotify_id = %s'
            val = (spotify_id,)
        else:
            return None
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchone()
        return result
    
class Authors:
    def __init__(self, main):
        self.main = main
        self.table_name = 'authors'
        self.table_columns = ['id', 'spotify_id', 'full_name']
        
    def add_author(self, spotify_id, full_name):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s)'
        val = (spotify_id, full_name)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_author")
        return self.main.cursor.lastrowid
        
    def author_exists(self, spotify_id):
        self.main.check_connection()
        sql = f'SELECT * FROM {self.table_name} WHERE spotify_id = %s'
        val = (spotify_id,)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        if len(result) > 0:
            return True
        else:
            return False
        
    def get_author(self, id = None, spotify_id = None):
        self.main.check_connection()
        if id is not None:
            sql = f'SELECT * FROM {self.table_name} WHERE id = %s'
            val = (id,)
        elif spotify_id is not None:
            sql = f'SELECT * FROM {self.table_name} WHERE spotify_id = %s'
            val = (spotify_id,)
        else:
            return None
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchone()
        return result
        
class Songs_Authors:
    def __init__(self, main):
        self.main = main
        self.table_name = 'songs_authors'
        self.table_columns = ['id', 'song_id', 'author_id']
    
    def add_connection(self, song_id, author_id):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s)'
        val = (song_id, author_id)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_connection")
        
    def connection_exists(self, song_id, author_id):
        self.main.check_connection()
        sql = f'SELECT * FROM {self.table_name} WHERE song_id = %s AND author_id = %s'
        val = (song_id, author_id)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        if len(result) > 0:
            return True
        else:
            return False
        
    def get_connections(self, song_id = None, author_id = None):
        self.main.check_connection()
        if song_id is not None:
            sql = f'SELECT * FROM {self.table_name} WHERE song_id = %s'
            val = (song_id,)
        elif author_id is not None:
            sql = f'SELECT * FROM {self.table_name} WHERE author_id = %s'
            val = (author_id,)
        else:
            return None
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        return result
        
class Listening_History:
    def __init__(self, main):
        self.main = main
        self.table_name = 'listening_history'
        self.table_columns = ['id', 'user_id', 'song_id', 'date', 'duration']
        
    def add_listening(self, user_id, song_id, date, duration = None):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s, %s, %s)'
        val = (user_id, song_id, date, duration)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_listening")
        
    def get_user_history(self, user_id):
        self.main.check_connection()
        sql = f'SELECT song_id, date, duration FROM {self.table_name} WHERE user_id = %s'
        val = (user_id,)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        return result
    
    def get_all_history(self):
        self.main.check_connection()
        sql = f'SELECT * FROM {self.table_name}'
        self.main.cursor.execute(sql)
        result = self.main.cursor.fetchall()
        return result
        
class Transactions:
    def __init__(self):
        self.main = main
        self.table_name = 'transactions'
        self.table_columns = ['id', 'user_id', 'song_id', 'date']
    
    def add_transaction(self, user_id, date, type):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s, %s)'
        val = (user_id, date, type)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_transaction")
        
    def get_list_of_user_data(self, user_id):
        self.main.check_connection()
        sql = f'SELECT id, date, type FROM {self.table_name} WHERE user_id = %s'
        val = (user_id,)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        return result
    
class Subscriptions:
    def __init__(self):
        self.main = main
        self.table_name = 'subscriptions'
        self.table_columns = ['user_id', 'transaction_id', 'expiration']
        
    def add_subscription(self, user_id, transaction_id, expiration):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s, %s)'
        val = (user_id, transaction_id, expiration)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_subscription")
        
    def subscription_exists(self, user_id):
        self.main.check_connection()
        sql = f'SELECT * FROM {self.table_name} WHERE user_id = %s'
        val = (user_id,)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        if len(result) > 0:
            return True
        else:
            return False
        
    def update_table(self):
        self.main.check_connection()
        sql = f'DELETE FROM {self.table_name} WHERE expiration < %s'
        val = (datetime.datetime.now(),)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record(s) deleted. update_table")
        
class Friendship:
    def __init__(self):
        self.main = main
        self.table_name = 'friendship'
        self.table_columns = ['id', 'user_a', 'user_b', 'date', 'status']
        
    def add_friend(self, user_a, user_b, date, status):
        self.main.check_connection()
        sql = f'INSERT INTO {self.table_name} ({", ".join(self.table_columns[1:])}) VALUES (%s, %s, %s, %s)'
        val = (user_a, user_b, date, status)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record inserted. add_friend")
        
    def get_friends(self, user_id):
        self.main.check_connection()
        sql = f'SELECT user_b FROM {self.table_name} WHERE (user_a = %s OR user_b = %s) AND status = "accepted"'
        val = (user_id, user_id)
        self.main.cursor.execute(sql, val)
        result = self.main.cursor.fetchall()
        return result
    
    def accept_request(self, user_a, user_b):
        self.main.check_connection()
        sql = f'UPDATE {self.table_name} SET status = "accepted" WHERE (user_a = %s AND user_b = %s) OR (user_b = %s AND user_a = %s)'
        val = (user_a, user_b, user_a, user_b)
        self.main.cursor.execute(sql, val)
        self.main.cnx.commit()
        print(self.main.cursor.rowcount, "record(s) affected. accept_request")

if __name__ == '__main__':
    main = Main()
    main.check_connection()
    main.cursor.execute("SELECT id, nickname, reg_date, expires_at FROM users")
    print("Users:")
    for row in main.cursor:
        print(row)