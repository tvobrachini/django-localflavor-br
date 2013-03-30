clean:
	git clean -Xfd

install:
	pip install --quiet --requirement=requirements/tests.txt --use-mirrors
	pip install --quiet --use-mirrors django==${DJANGO}
	pip install --quiet --editable=.

test:
	flake8 --ignore=W801,E128,E501,W402 django_localflavor_br
	coverage run --branch --source=django_localflavor_br `which django-admin.py` test --settings=django_localflavor_br.tests.settings django_localflavor_br
	coverage report --omit=django_localflavor_br/__init__.py,django_localflavor_br/models.py,django_localflavor_br/tests/*

travis: test
