FROM lambci/lambda:build-python3.8

WORKDIR /tmp

ENV PYTHONUSERBASE=/var/task

COPY lambda_proxy/ lambda_proxy/
COPY README.md README.md
COPY setup.py setup.py

# Install dependencies
RUN pip install . --user
RUN rm -rf lambda_proxy setup.py
