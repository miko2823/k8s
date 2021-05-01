FROM tiangolo/uvicorn-gunicorn-fastapi:python3.6

# /app is a PYTHONPATH
COPY ./app /app

COPY app/requirements.txt /app
RUN pip install -r requirements.txt

# Set Timezone
ENV TZ Asia/Tokyo
RUN echo "--- Set timezone" && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata
