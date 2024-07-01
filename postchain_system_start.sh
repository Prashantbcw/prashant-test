docker run \
    --detach \
    --name postchain \
    --restart unless-stopped \
    --mount type=bind,source=/data/chromia/node/node-mounted-files,target=/node-mounted-files,readonly \
    -e JAVA_TOOL_OPTIONS="-Xmx96g" \
    -e POSTCHAIN_DEBUG=true \
    -e POSTCHAIN_CONFIG=/node-mounted-files/node-config.system.properties \
    -e POSTCHAIN_BLOCKCHAIN_CONFIG=/node-mounted-files/bc-config.xml \
    -p 9870:9870/tcp \
    -p 127.0.0.1:7741:7740/tcp \
    -p 127.0.0.1:7751:7750/tcp \
    -p 9190:9190/tcp \
    registry.gitlab.com/chromaway/postchain-chromia/chromaway/chromia-server:3.16.0 \
    run-node