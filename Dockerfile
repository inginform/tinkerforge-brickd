FROM c-dev-env
MAINTAINER Jan Suchotzki <jan@inginform.de>

# Installiere notwendige Pakete zum kompilieren von brickd
RUN apt-get update && apt-get install -y --no-install-recommends \
				pkg-config \
                libusb-1.0-0-dev \
# Angeblich wird libudev auch benötigt. Es läuft aber scheinbar auch ohne!
#                libudev-dev \
	&& rm -rf /var/lib/apt/lists/*
