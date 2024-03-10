gt:
	git add .
	git commit -m "commit"
	git push origin

gtc:
	git pull --no-ff
	make gt

gm:
	git switch main
	git pull

gmc:
	make gm
	git checkout -