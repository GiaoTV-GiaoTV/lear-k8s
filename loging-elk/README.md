Collect log in k8s to elk 


Setup elk and logstash in VM centos : 
    - echo 0 > /sys/fs/selinux/enforce
    - hostnamectl set-hostname elk
    - yum install -y epel-release 
    - yum install -y wget htop net-tools nginx nginx-mod-stream
    - wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.14.1-x86_64.rpm
    - wget https://artifacts.elastic.co/downloads/kibana/kibana-7.14.1-x86_64.rpm
    - wget https://artifacts.elastic.co/downloads/logstash/logstash-7.14.1-x86_64.rpm
    - rpm -ivh elasticsearch-7.14.1-x86_64.rpm && rpm -ivh kibana-7.14.1-x86_64.rpm && rpm -ivh logstash-7.14.1-x86_64.rpm
    - echo "xpack.security.enabled: true" >> /etc/elasticsearch/elasticsearch.yml
    - systemctl start elasticsearch && systemctl enable elasticsearch
    - /usr/share/elasticsearch/bin/elasticsearch-setup-passwords interactive
    - echo 'elasticsearch.username: "kibana_system"' >> /etc/kibana/kibana.yml
    - echo 'elasticsearch.password: "abcdef123"' >> /etc/kibana/kibana.yml
    - systemctl start kibana && systemctl enable kibana
    - cp logstash/conf.d/k8s.conf /etc/logstash/conf.d/
    - systemctl start logstash && systemctl enable logstash
    - echo Y|cp nginx/nginx.conf /etc/nginx/ && cp nginx/conf.d/kibana.conf /etc/nginx/conf.d/
    - systemctl start nginx && systemctl enable nginx

Apply filebeat in k8s : kubectl apply -f filebeat-kubernetes.yaml