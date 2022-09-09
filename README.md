# display_wrapper
A Ruby wrapper around AppleScipt's display command

## How To Use

The wrapper accepts 4 parameters:

- text
- title
- subtitle
- sound name

Send these parameters using an HTTP GET request with URL parmaters. The default port is 1337.

Here's an example using cURL

```bash
curl --get --data-urlencode "text=This is my text&title=Here is my title&subtitle=subtitles are cool&sound=frog" localhost:1337/
```

```bash
git clone https://github.com/thyrusg/display_wrapper.git
# The & will move the process to the background
ruby display_wrapper/wrapper.rb &
```