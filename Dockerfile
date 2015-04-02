FROM inginform/c-dev-env:latest
MAINTAINER Jan Suchotzki <jan@inginform.de>

ENV BRICKD_VERSION 2.2.1

# Installiere notwendige Pakete zum kompilieren von brickd
RUN apt-get update && apt-get install -y --no-install-recommends \
				pkg-config \
				libusb-1.0-0-dev \
				libudev-dev \
	&& rm -rf /var/lib/apt/lists/*

# Quellcode für den Brick Daemon holen und kompilieren
# TODO: Überprüfen der Checksumme wäre gut. Es gibt aber scheinbar keine.
RUN curl -SL "https://github.com/Tinkerforge/brickd/archive/v${BRICKD_VERSION}.tar.gz" -o brickd.tar.gz \
	&& curl -SL "https://github.com/Tinkerforge/daemonlib/archive/brickd-${BRICKD_VERSION}.tar.gz" -o daemonlib.tar.gz \
	&& mkdir -p /usr/src/brickdaemon \
	&& tar -xvf brickd.tar.gz -C /usr/src/brickdaemon --strip-components=1 \
	&& mkdir -p /usr/src/brickdaemon/src/daemonlib \
	&& tar -xvf daemonlib.tar.gz -C /usr/src/brickdaemon/src/daemonlib --strip-components=1 \
	&& rm brickd.tar.gz \
	&& rm daemonlib.tar.gz \
	&& cd /usr/src/brickdaemon/src/brickd \
	&& make \
	&& make install

# Port vom Brick Daemon für andere Container bekannt machen
EXPOSE 4223

# Brick Daemon starten
CMD ["/usr/src/brickdaemon/src/brickd/brickd"]
