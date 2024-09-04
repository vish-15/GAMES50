from flask import Flask, render_template, request, redirect, url_for, session, flash
import sqlite3
import bcrypt

app = Flask(__name__)
app.secret_key = 'supersecretkey'

def get_db_connection():
    conn = sqlite3.connect('games.db', timeout=10)  # Waits up to 10 seconds for the lock
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/')
def index():
    conn = get_db_connection()
    games = conn.execute('SELECT * FROM games').fetchall()
    conn.close()
    return render_template('index.html', games=games)

@app.route('/download/<int:game_id>')
def download(game_id):
    if 'user_id' not in session:
        flash('You need to log in to download games.', 'warning')
        return redirect(url_for('login'))

    user_id = session['user_id']
    conn = get_db_connection()
    if 'library' not in session:
        session['library'] = []
    if game_id not in session['library']:
        session['library'].append(game_id)
        conn.execute('INSERT INTO user_games (user_id, game_id) VALUES (?, ?)', (user_id, game_id))
        conn.commit()
    conn.close()
    return redirect(url_for('index'))

@app.route('/library')
def library():
    if 'user_id' not in session:
        flash('You need to log in to view your library.', 'warning')
        return redirect(url_for('login'))

    if 'library' not in session:
        session['library'] = []
    conn = get_db_connection()
    games = conn.execute('SELECT * FROM games WHERE id IN ({seq})'.format(
        seq=','.join(['?']*len(session['library']))), session['library']).fetchall()
    conn.close()
    return render_template('library.html', games=games)

@app.route('/profile')
def profile():
    if 'user_id' not in session:
        flash('You need to log in to view your profile.', 'warning')
        return redirect(url_for('login'))

    conn = get_db_connection()
    user = conn.execute('SELECT * FROM users WHERE id = ?', (session['user_id'],)).fetchone()
    conn.close()
    return render_template('profile.html', user=user)

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        conn = get_db_connection()
        existing_user = conn.execute(
            'SELECT * FROM users WHERE username = ?', (username,)).fetchone()
        if existing_user:
            flash('Username already exists.', 'danger')
            conn.close()
            return redirect(url_for('register'))

        hashed_password = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
        conn.execute('INSERT INTO users (username, password) VALUES (?, ?)',
                     (username, hashed_password))
        conn.commit()
        conn.close()
        flash('Registration successful. You can now log in.', 'success')
        return redirect(url_for('login'))
    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        conn = get_db_connection()
        user = conn.execute('SELECT * FROM users WHERE username = ?', (username,)).fetchone()
        conn.close()
        if user and bcrypt.checkpw(password.encode('utf-8'), user['password']):
            session['user_id'] = user['id']
            return redirect(url_for('index'))
        else:
            flash('Invalid username or password.', 'danger')
            return redirect(url_for('login'))
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    return redirect(url_for('index'))

if __name__ == '__main__':
    app.run(debug=True)
