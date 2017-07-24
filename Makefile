build:
	docker build -t scotgrid/cntwn .
run:
	docker run --rm -it -v /cvmfs:/cvmfs scotgrid/cntwn
