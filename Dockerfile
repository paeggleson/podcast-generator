FROM ubuntu:latest

# Install system dependencies needed for building Python packages.
# For Debian/Ubuntu-based images:
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version to ensure compatibility.
RUN pip3 install --upgrade pip

# Install PyYAML with a version that works with modern Cython.
# Or, if an older version is required, constrain Cython.
RUN pip3 install PyYAML>=6.0.1

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]