FROM continuumio/miniconda:latest

WORKDIR /

COPY environment_linux.yml ./
COPY app.py .

RUN conda env create -f environment_linux.yml
RUN echo "source activate management_zone" > ~/.bashrc
ENV PATH /opt/conda/envs/management_zone/bin:$PATH

EXPOSE 5000

ENTRYPOINT ["python", "app.py"]

