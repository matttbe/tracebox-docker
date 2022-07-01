Usage
=====

Help:

    docker run -it --rm -v "${PWD}:${PWD}" -w "${PWD}" matttbe/tracebox:latest -h

Check MPTCP capability:

    docker run -it --rm -v "${PWD}:${PWD}" -w "${PWD}" matttbe/tracebox:latest -p 'IP/tcp{dst=80}/MPCAPABLE' www.multipath-tcp.org
    docker run -it --rm -v "${PWD}:${PWD}" -w "${PWD}" matttbe/tracebox:latest -p 'IP/tcp{dst=443}/MPCAPABLE' www.multipath-tcp.org

Check TFO:

    docker run -it --rm -v "${PWD}:${PWD}" -w "${PWD}" matttbe/tracebox:latest -p 'IP/tcp{dst=80}/raw("12345678901234567890")' www.multipath-tcp.org

Check MPTCP + TFO:

    docker run -it --rm -v "${PWD}:${PWD}" -w "${PWD}" matttbe/tracebox:latest -p 'IP/tcp{dst=80}/MPCAPABLE/raw("12345678901234567890")' www.multipath-tcp.org

Build
=====

Launch this command:

    docker build -t matttbe/tracebox:latest -f Dockerfile .

More info
=========

Some websites:

* http://www.tracebox.org
* http://www.tracebox.org/lua_doc/
* https://github.com/tracebox/tracebox
