#Tinkerforge Brick Daemon im Container

Eine Entwicklungs- und Laufzeitumgebung für den [Brick Daemon von Tinkerforge](http://www.tinkerforge.com/de/doc/Software/Brickd.html#brickd). 

##Über

Im Image ist alles was zum übersetzen und ausführen des Quellcodes benötigt wird. Aktuell wird der Quellcode der Version **2.2.1** des Brick Daemon im Image gespeichert.

Neben dem Quellcode und dem bereits kompilierten Brick Daemon sind auch die wichtigsten Entwicklungswerkzeuge wie `gcc`, `git` und der Texteditor `nano` im Image vorhanden. So kann im Image eine neuere Version kompiliert werden oder auch Änderungen am Brick Daemon gemacht werden.

##Anwendung

Wird ein Container ganz normal mit folgendem Befehl gestartet, läuft in ihm der Brick Daemon und kann über Port 4223 von anderen Tinkerforge-Anwendungen (z.B. Bricker Viewer oder Languagebindings) angesprochen werden:
`docker run -d --name brickd inginform/tinkerforge-brickd`

Über den Parameter `--name brickd` wird der im Hintergrund laufende Container mit dem namen `brickd` versehen. Somit kann er einfacher von anderen Containern verlinkt werden.

Wenn Du am Brick Daemon entwickeln möchtest, kannst Du den Container so starten:
`docker run -it inginform/tinkerforge-brickd /bin/bash`

Bedenke bitte, dass so Änderungen die Du im Container machst verloren gehen, wenn der Container gestoppt und gelöscht wird. Du könntest direkt aus dem Container Änderungen die Du machst in ein Git-Repository schicken.

Wenn Du bereits eine andere Version des Quellcodes auf Deinem Rechner hast, dann kannst Du auch diese in den Container mounten. Dazu startest Du den Container mit folgendem Befehl aus dem Verzeichnis in dem sich der Quellcode befindet:
`docker run -it -v $(pwd):/usr/src/brickdaemon -w /usr/src/brickdaemon inginform/tinkerforge-brickd /bin/bash`

Beachte bitte, dass Du nicht nur den Quellcode vom brickd brauchst, sondern auch die daemonlib. Eine genaue Beschreibung wie Du den Quellcode bekommst, kannst Du bei [Tinkerforge finden](https://github.com/Tinkerforge/brickd/).

##Wartung

Dieses Image verwendet [Automated Builds](http://docs.docker.com/docker-hub/builds/). Damit wird die aktuellste Version des `Dockerfiles` immer automatisch vom Docker Hub gebaut und bereit gestellt. Über einen [Repository link](http://docs.docker.com/docker-hub/builds/#repository-links) wird sicher gestellt, dass auch Änderungen am verwendeten Basisimage automatisch in dieses Image einfliessen. Somit gibt es aktuell keine manuellen Schritte dies Image zu warten.

##Copyright free

Wie alle Inhalte auf [ing.inform](www.inginform.de) ist auch dieser Quellcode frei von Copyright [nach CC0](LICENSE.md). Das heißt, der Urheber verzichtet auf jegliche Nutzungsbedingungen. Entsprechend kann der erstellte Quellcode in jeglicher Art und Weise verwendet werden. Du brauchst keinerlei Bestätigung von mir um die Inhalte zu verarbeiten. Du kannst sie einfach teilen, drucken, verändern, ... und das alles mit oder ohne meinen Namen zu nennen. Viel Spaß!