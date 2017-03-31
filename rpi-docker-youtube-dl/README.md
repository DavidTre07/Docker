# Create a Docker with youtube-dl

# Build
docker build -t david07/youtube-dl:\`date +%Y%m%d\` -t david07/youtube-dl:latest .

# Startup
docker run --rm  -v /data/download:/download:rw -v /etc/localtime:/etc/localtime:ro davidtre07/youtube-dl

Video:
docker run --rm  -v /data/download:/download:rw -v /etc/localtime:/etc/localtime:ro davidtre07/youtube-dl -o '/download/%(title)s.%(ext)s' URL

Audio mp3
docker run --rm  -v /data/download:/download:rw -v /etc/localtime:/etc/localtime:ro davidtre07/youtube-dl -o '/download/%(title)s.%(ext)s' --extract-audio --audio-format mp3 --audio-quality 0 URL
