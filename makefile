SASS=sass --no-cache --style=compressed
HAML=haml --style ugly

CSS=$(filter-out www/static/_%.css, $(patsubst %.sass,%.css,$(wildcard www/static/*.sass)))
HTML=$(patsubst %.haml,%.html,$(wildcard www/*.haml))
JSMIN=www/static/up++.min.js
JS=www/static/up++.js

.PHONY=build clean publish graphics js

build: clean graphics $(CSS) $(HTML) $(JSMIN)

%.css: %.sass
	$(SASS) $<:$@

$(JSMIN): $(JS)
	uglifyjs -c -m --screw-ie8 $(JS) -o $(JSMIN)

%.html: %.haml
	$(HAML) $< $@

clean:
	-$(RM) $(HTML)
	-$(RM) $(JSMIN)
	-$(RM) www/static/*.css
	-$(RM) www/static/*.css.map

www/img/polargrid-nq8.png: www/img/polargrid.png
	-cd www/img; pngnq -v -f -Q f -s 1 -n 10 polargrid.png

www/img/up++logo-nq8.png: www/img/up++logo.png
	-cd www/img; pngnq -v -f -Q f -s 1 -n 30 up++logo.png

graphics: www/img/polargrid-nq8.png www/img/up++logo-nq8.png

publish: build
	cp CNAME output
	cp $(HTML) output
	mkdir -p output/static
	cp $(CSS) www/static/*.min.js output/static
	mkdir -p output/img
	cp $(wildcard www/img/*) output/img
	cd output; git add -A; git commit -m "published `date --iso=minutes`"; git push origin master
