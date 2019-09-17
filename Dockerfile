FROM debian:stable

ENV LANG ru_RU.UTF-8

RUN set -xe \
    && apt-get clean \
	&& apt-get update \
    && apt-get -y install gnupg2 \
	&& apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
	&& echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee /etc/apt/sources.list.d/mono-xamarin.list \
    && apt-get update \
	&& apt-get -y install locales tzdata \
	&& apt-get -y install mono-runtime \
     binutils \
     curl \
     mono-devel \
     ca-certificates-mono \
     mono-vbnc \
     referenceassemblies-pcl \
     mono-fastcgi-server4 \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* \
    && echo "ru_RU.UTF-8 UTF-8" | tee /etc/locale.gen \
    && locale-gen