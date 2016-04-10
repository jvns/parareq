#!/bin/bash
MIX_ENV=prod mix compile
MIX_ENV=prod nice -n 19 elixir -pa _build/prod/consolidated --no-halt --erl "+A 1024 -smp enable +K true +P 134217727 +S 16:8 -kernel inet_dist_listen_min 2048 -kernel inet_dist_listen_max 65535 +zdbbl 65536 +e 256000" -S mix
