FROM heroku/heroku:16-build

WORKDIR /app
ENV WORKSPACE_DIR="/app/workspace" \
  S3_BUCKET="odooku" \
  S3_PREFIX="heroku-16/"

RUN apt-get update && apt-get install -y python-pip && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /app/
RUN pip install --disable-pip-version-check --no-cache-dir -r /app/requirements.txt

COPY . /app
