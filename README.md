### Purpose
This repository grew out of a desire to learn and mess around with Apache Spark without installing a bunch of stuff directly on my machine. I figured someone must have done this before and had a docker container already set up. I could not find what I wanted so I made it.

This container starts with Python 3.8 on slim-buster, installs OpenJDK 11 and Spark 3.1.2.

I also added the zsh shell and oh-my-zsh to the container because I use those customizations on all my machines.

### Additional libraries

The build also adds support for PyTest and Jupyter notebooks. Pandas is there to support PySpark UDF and also the data display in the Jupyter notebooks. Additionally I added loguru, black, and flake8. Black is becuase I hate formatting my code and flake8 is my Python linter of choice. Silmiarly I like loguru for logging.

Many of these can be removed without losing Spark functionality.

### Comments
The container build takes about 10 minutes the first time on my 2010 Mac Pro with 48GB .
