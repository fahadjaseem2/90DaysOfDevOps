#base of python slim
FROM python:3.11-slim

#set a working directory
WORKDIR /app

#default-libmysqlclient-dev is a system development package for the MySQL client library.
#That library allows Python to talk to a MySQL database.
# gcc = When pip installs Flask-MySQLdb or mysqlclient, it needs to compile a small C extension so Python can connect to that MySQL client library.

RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*


# copy dependency file
COPY requirements.txt .

# install python dependencies (-r = read from file)
# --no-cache-dir = “Install the packages, but don’t store the download cache.”

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt


#copy the rest application code
COPY . .

RUN useradd -m fahad

USER fahad

EXPOSE 5000

CMD ["python", "app.py"]