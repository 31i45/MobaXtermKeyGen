FROM python:3.9.16-alpine3.18 as base

FROM base as builder
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install --target=/install -r /requirements.txt

FROM base
# 注意pip的默认安装路径
COPY --from=builder /install /usr/local/lib/python3.9/site-packages/
COPY src/ /app
WORKDIR /app
CMD [ "python", "./MobaXtermKeyGen.py"]
