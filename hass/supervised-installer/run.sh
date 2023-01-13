docker run --rm -v $(pwd):/tmp debian:bullseye-slim bash -c \
          "cd /tmp \
          && chmod 555 homeassistant-supervised/DEBIAN/p* \
          && dpkg-deb --build --root-owner-group homeassistant-supervised"
