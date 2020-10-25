<p align="center">
 <img src="https://raw.githubusercontent.com/opentitles/client/master/images/header.png")/>
 <i>See https://opentitles.info/ for download links and more information.</i>
</p>

# OpenTitles Dumper
This Docker container is very basic - it simply calls `mongoexport` every 24 hours to generate a database dump for the OpenTitles article database. This dump can be used by other developers or researchers to inspect, research or visualize title changes.

The dump can be downloaded from https://dump.opentitles.info/