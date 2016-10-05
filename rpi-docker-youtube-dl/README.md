# Create a Docker with youtube-dl

#Build
docker build -t david07/youtube-dl:\`date +%Y%m%d\` -t david07/youtube-dl:latest .

# Startup
docker run --rm  -v /data/doanload:/download:rw -v /etc/localtime:/etc/localtime:ro david07/youtube-dl
