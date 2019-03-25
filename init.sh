#!/usr/bin/env bash
mkdir -p target
if [ ! -f target/choerodon-tool-liquibase-0.9.0.RELEASE.jar ]
then
    wget http://nexus.choerodon.com.cn/repository/choerodon-release/io/choerodon/choerodon-tool-liquibase/0.9.0.RELEASE/choerodon-tool-liquibase-0.9.0.RELEASE.jar -P target
fi
java -Dspring.datasource.url="jdbc:mysql://localhost:3306/issue_service?useUnicode=true&characterEncoding=utf-8&useSSL=false" \
 -Dspring.datasource.username=root \
 -Dspring.datasource.password=root \
 -Ddata.drop=false -Ddata.init=true \
 -Ddata.dir=src/main/resources \
 -jar target/choerodon-tool-liquibase-0.9.0.RELEASE.jar