# OVERVIEW
The primary goal of this project was to create an ETL pipline to extract data from a NY City taxi dataset, parse through it to enforce schema requirements, and then load it into a postgresql database to run queries against. The services were containerized for portability and then a basic terraform data lake storage blob was scripted out but NOT used. It was simple to get more comfortable working with Azure based storage objects.

# Project Source
- Alexy Grigorev
- https://github.com/DataTalksClub/data-engineering-zoomcamp

# Data Source
- https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page

# What I've Learned
- I have previously worked with most of the core components of this pipeline such as Python, Pandas, Terraform, and Docker, but this is the first ETL pipline that I have developed. A lot of the dependencies used such as Click, Sqlalchemy, and tqdm were new to me and great tools to be aware of. I have previously used MySQL but have not worked with Postgresql and especially not a containerized version of a database engine.
- The biggest things that I have taken away from this is the importance of the conatinerized workflow across different development domains, including data engineering. Properly controlling the environment and packaging the end-product was a blast.
- Getting to work with Postgresql was also a blast. Something not actually added anywhere within this repo is the SQL querying that was done against the loaded database. Using the included Jupyter Notebook, I loaded in a second data source and was able to practice table joins to try and find useful or interesting information such as which days generated the most revenue as well as which parts of the city were most profitable.
- One other thing that I have been thinking a lot about through this project is that "tools are tools are tools". By that, I mean that at the end of the day, the job of the data engineer is to find useful and valuable data that a company can leverage to generate profits or create value. There are so many tools and avenues that can be utilized to accomplish this task, it is up to the engineer to pick and choose the best tools for the job. 

# Running the Repo
The only requirement to run this pipline is to have Docker installed so that once you pull the code, you can then build the Docker Compose images which host the postgresql database as well as the Pgadmin container. Then you can build and run the Dockerfile contained in the repo to build the actual ETL pipeline container which will then pull the remote data source, parse it, and then load it into the Postgresql container. After completing those two steps, the database should be loaded with the target dataset.

# Tools Used
- Python https://docs.python.org/3/
- Postgresql (SQL Database) https://www.postgresql.org/docs/
- Pgadmin (SQL Database UI interaction manager) https://www.pgadmin.org/docs/
- Pgcli (SQL Database cli managment interface) https://www.pgcli.com/docs
- Pandas (Python data interaction module) https://pandas.pydata.org/docs/
- Jupyter Notebooks (Code development engine) https://docs.jupyter.org/en/latest/
- tqdm (Python itterable cli loading bar module) https://tqdm.github.io
- sqlalchemy (Database write engine used with Pandas to load data to Postgresql) https://docs.sqlalchemy.org/en/21/
- click (Python interactive CLI module) https://click.palletsprojects.com/en/stable/#documentation
- PyArrow https://arrow.apache.org/docs/python/index.html
- UV (Python virtual environment system written in rust for enhanced performance) https://docs.astral.sh/uv/pip/environments/
- Terraform https://developer.hashicorp.com/terraform/docs
- Docker https://docs.docker.com
- Docker Compose (Mass container orchestration - not suitable for multi node management) https://docs.docker.com/compose/ 
- Git https://git-scm.com/docs

# Struggles
- I encountered issues when trying to containerize my pipeline as I am not used to working with UV. I had to make some corrections to my venv dependencies which corrected the issues with the build.

# Achievements
- One aspect that is not necessairly tied into the pipeline is the cloud infra. As part of this project, I simply tampered with Azure data lake storage blobs and did not actually load the containers into any cloud infra to handle the compute or storage. However, within the followed classwork, it only had guides for GCP or AWS, not Azure. I wanted to try and replicate what the course was developing using Azure not only as a challenge to myself but due to the fact that I want to primarily use Azure Fabric and Databricks and want to master that ecosystem.
