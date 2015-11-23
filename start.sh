docker run \
 -d \
 --name mxpostfix \
 --hostname mxpostfix \
 --dns 172.17.42.1 \
 --dns-search docker \
 --volumes-from mpide_spool_1 \
 mxpostfix \
 ./startpostfix.sh


# debug with
#docker run \
# --rm \
# -it \
# --name mxpostfix \
# --hostname mxpostfix \
# --dns 172.17.42.1 \
# --dns-search docker \
# --volumes-from mpide_spool_1 \
# mxpostfix \
# bash
