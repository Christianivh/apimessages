FROM centos:centos7
LABEL maintainer="christianivh@hotmail.com"

LABEL stage.description="Install miniconda software"
LABEL stage.version="1"
RUN yum -y update \
    && yum -y install curl bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda.sh \
    && bash /tmp/miniconda.sh -bfp /usr/local/ \
    && rm -rf /tmp/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && conda clean --all --yes \
    && rpm -e --nodeps curl bzip2 \
    && yum clean all

ENV PATH /opt/conda/bin:$PATH

WORKDIR /usr/src/app

COPY . .

RUN mkdir -p /tmp/virtualcoach/

LABEL stage.description="Install python dependencies through environment.yml"
LABEL stage.version="2"
RUN conda env create -qf environment.yml

LABEL stage.description="Expose port 8000"
LABEL stage.version="3"
EXPOSE 8000

ENTRYPOINT  source activate api-messages \
        && gunicorn -b 0.0.0.0:8000 apimessage:app