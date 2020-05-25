FROM node:9-slim
RUN npm install
RUN apt-get update || : && apt-get install python -y
RUN apt-get install python-pip -y
RUN pip install flask
COPY /client /client
COPY run.py /.
RUN cd /client && npm install
EXPOSE 5000
RUN cd /client && npm run build
RUN rm -rf /var/lib/apt/lists/*
CMD ["python","./run.py"]

