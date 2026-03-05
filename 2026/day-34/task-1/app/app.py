from flask import Flask, request, jsonify
import redis
import mysql.connector
import time

app = Flask(__name__)

# Connect to Redis
cache = redis.Redis(host="redis", port=6379)

# Wait for MySQL to be ready
while True:
    try:
        db = mysql.connector.connect(
            host="db",
            user="root",
            password="root",
            database="task_db"
        )
        break
    except mysql.connector.Error:
        print("Waiting for MySQL...")
        time.sleep(5)

cursor = db.cursor()

# Create table if it does not exist
cursor.execute("""
CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(255)
)
""")
db.commit()


@app.route("/")
def home():
    visits = cache.incr("counter")
    return f"Hello from Flask DevOps App 🚀 | Visits: {visits}"


@app.route("/add", methods=["POST"])
def add_message():
    data = request.json
    text = data.get("text")

    cursor.execute("INSERT INTO messages (text) VALUES (%s)", (text,))
    db.commit()

    return jsonify({"status": "message stored"})


@app.route("/messages")
def get_messages():
    cursor.execute("SELECT * FROM messages")
    rows = cursor.fetchall()

    result = []
    for row in rows:
        result.append({"id": row[0], "text": row[1]})

    return jsonify(result)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)