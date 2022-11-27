import mysql_db
import datetime
from prettytable import PrettyTable

strptime = datetime.datetime.strptime

# listening_history table: id, user_id, song_id, date, duration, name

class Stats:
    def __init__(self, db_main, type, id=None):
        """type can be "user" or "general" """
        self.db_main = db_main
        self.type = type
        self.id = id
        self.table_name = "listening_history"
        self.listening_history = None
        if type == "user":
            self.listening_history = self.db_main.query(
                f'SELECT lh.id, lh.user_id, lh.song_id, lh.date, lh.duration, s.name FROM {self.table_name} lh JOIN songs s ON lh.song_id = s.id WHERE lh.user_id = {self.id}')
        elif type == "general":
            self.listening_history = self.db_main.query(
                f'SELECT lh.id, lh.user_id, lh.song_id, lh.date, lh.duration, s.name FROM {self.table_name} lh JOIN songs s ON lh.song_id = s.id')
            
    def average_day(self):
        days_time = []
        day = -1
        for entry in self.listening_history:
            if strptime(str(entry[3]), "%Y-%m-%d %H:%M:%S").day == day:
                days_time[-1] += entry[4]
            else:
                days_time.append(entry[4])
                day = strptime(str(entry[3]), "%Y-%m-%d %H:%M:%S").day
        return sum(days_time) / len(days_time)
    
    def average_hours(self):
        hours_time = [0] * 24
        hour = strptime(str(self.listening_history[0][3]), "%Y-%m-%d %H:%M:%S").hour
        for entry in self.listening_history:
            if strptime(str(entry[3]), "%Y-%m-%d %H:%M:%S").hour == hour:
                hours_time[hour] += entry[4]
            else:
                hour = strptime(str(entry[3]), "%Y-%m-%d %H:%M:%S").hour
        return hours_time
    
    def average_days_of_week(self):
        days_of_week_time = [0] * 7
        day_of_week = strptime(str(self.listening_history[0][3]), "%Y-%m-%d %H:%M:%S").weekday()
        for entry in self.listening_history:
            if strptime(str(entry[3]), "%Y-%m-%d %H:%M:%S").weekday() == day_of_week:
                days_of_week_time[day_of_week] += entry[4]
            else:
                day_of_week = strptime(str(entry[3]), "%Y-%m-%d %H:%M:%S").weekday()
        return days_of_week_time
                
    def listening_time(self):
        return sum([entry[4] for entry in self.listening_history])
    
    def most_listened_songs(self, n=10):
        songs = {}
        for entry in self.listening_history:
            if entry[2] in songs:
                songs[entry[2]][2] += entry[4]
            else:
                songs[entry[2]] = [entry[2], entry[5], entry[4], []]
        songs = list(songs.values())
        songs.sort(key=lambda x: x[2], reverse=True)
        for song in songs:
            song[3] = self.db_main.query(f'SELECT a.full_name FROM authors a WHERE id IN (SELECT author_id FROM songs_authors WHERE song_id = {song[0]})')
            song[3] = ', '.join([author[0] for author in song[3]])
        return songs[:n]
    
if __name__ == "__main__":
    db_main = mysql_db.Main()
    user = Stats(db_main, "user", 5)
    print("Stats for user with id =  5")
    print(f'Average day: {user.average_day()}')
    print(f'Listening time: {user.listening_time()}')
    average_hours = PrettyTable()
    average_hours.field_names = ["Night", "NTime", "Morning", "MTime", "Afternoon", "ATime", "Evening", "ETime"]
    for i in range(6):
        average_hours.add_row([
            f'{i}:00', user.average_hours()[i],  
            f'{i+6}:00', user.average_hours()[i+6], 
            f'{i+12}:00', user.average_hours()[i+12], 
            f'{i+18}:00', user.average_hours()[i+18]])
    print(average_hours)
    average_days_of_week = PrettyTable()
    average_days_of_week.field_names = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    average_days_of_week.add_row(user.average_days_of_week())
    print(average_days_of_week)
    most_listened_songs = PrettyTable()
    most_listened_songs.field_names = ["Song", "Authors", "Time"]
    for song in user.most_listened_songs():
        most_listened_songs.add_row([song[1], song[3], song[2]])
    print(most_listened_songs)
    db_main.close()