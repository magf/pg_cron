#!/usr/bin/env bash
docker run --rm -it -v .:/pg_cron \
  ghcr.io/greengagedb/greengage/ggdb7_ubuntu:latest \
  bash -c "/pg_cron/ci/install.bash && /pg_cron/ci/test.bash"
