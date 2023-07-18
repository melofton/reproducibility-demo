# Challenges with reproducing analyses

1.  Data is not available
2.  Data is in a format that is not readable (Lotus123 spreadsheet?)
3.  Code is not available to run analysis (only the method section is available)
4.  Correct software is not available to read data or run analysis (i.e, \|\> requires R version 4.1 or higher)
5.  R packages used in analysis have changed and are not backward compatible (how long will dplyr support spread and gather?)
6.  Computer architecture doesn't exist anymore
7.  The world as we know it doesn't exist anymore

# The reproducibility highway

The following are steps on the reproducibility highway. You do not need to drive the full length of the highway for all projects (in fact #7 above suggests that the highway never ends - how do we prepare for the end of the world?). It is important to figure out which highway exit is suitable for your project.

## Exit 1: Reproductiblity from GitHub

Add your code to GitHub and have others clone and run your code. Since you don't know the computational environment that other are using you have to be careful about R versioning and package dependencies. For straightforward analyses that use common R packages that maintain backward compatibility, then putting your code on GitHub is a solid foundation for reproducibility.

You would then archive your GitHub repo on Zenodo (<https://zenodo.org>) so that it persists. Here is information about linking your GitHub repo to Zenodo and then creating a release of your code that gets automatically upload to Zenodo. You then got into Zenodo to update the metadata. See more here: <https://coderefinery.github.io/github-without-command-line/doi/>

## Exit 2: Reproducibility from GitHub + renv

Renv is a package manager for R (<https://rstudio.github.io/renv/articles/renv.html>) that controls for the version of R packages. I have yet to have a project that didn't involve me throwing a can, bottle, or other nearby object at my computer screen because an `renv.lock` file gets cross wired. Renv is awesome in principle but not in practice.

# Exit 3: Reproducibility using Rocker + GitHub

Starting from a Docker container is the closest thing you can do to starting from a fresh computer that isn't filled with all the packages and data sets that you already have on your computer. A fresh computer forces you to be explicit about package installs, etc. and will make it easier for others to successfully reproduce your analysis.

A Rocker is a Docker container with R (potentially also with Rstudio and other R packages). The one with Rstudio makes it easy to use a Docker container in a familiar interface.

1.  Download and install Docker Desktop on your computer. The instructions are at <https://www.docker.com/>.

2.  Launch Docker by starting the Docker application.

3.  Find the command line for your computer (terminal in Mac or command prompt in Windows)

4.  In the command line, try to run `docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 rocker/rstudio` that is documented here: <https://rocker-project.org/>

5.  Point your browser to `localhost:8787`. Log in with user = rstudio, passwoard = yourpassword.

6.  In prep for your code review, set up your GitHub profile on the container following: <https://github.com/frec-3044/git-rmd-intro-template/blob/main/assignment/instructions.md>

## Exit 4: Reproductiblity using Docker + GitHub

In the above example, you start from the rstudio rocker and then install packages on top of it. To be more explicit about the users environment, you can provide your own docker container. You would do this if you have a particular Rocker version that you want to start with or you are worried about packages changing.

1.  Update the Dockerfile in this repo to match your repo

2.  Create user account on hub.docker.com

3.  At the terminal navigate to your github repo on your computer. Then run the following code to create, tag, and push your Docker container

```         
docker build https://github.com/rqthomas/reproducibility-demo.git#main -t thomas_demo#main -t thomas_demo
docker image tag thomas_demo rqthomas/thomas_demo:latest
docker image push rqthomas/thomas_demo:latest 
```

Someone performing a code review or reproducing your analysis will follow the steps in Exit 3, except for changing the docker "image" that is used from "rocker/rstudio" to the custom image ("rqthomas/thomas_demo" in the example) 

```         
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 thomas_demo:latest
```

5.  Point your browser to `localhost:8787`. Log in with user = rstudio, passwoard = yourpassword.

6.  In prep for your code review, set up your GitHub profile on the container following: <https://github.com/frec-3044/git-rmd-intro-template/blob/main/assignment/instructions.md>

# Performing a code review

1.  On GitHub.com, create a fork of the following GitHub repo into your GitHub organization: <https://github.com/rqthomas/reproducibility-demo>

2.  Start a new project in the on your computer (Exit 1) or rocker container (Exits 3 & 4) from your forked GitHub repo. (new project -\> Version Control -\> Git)

3.  The following checklist is a list of things to review in the code:

-   Does the GitHub repo have a Readme?
-   Does the Readme tell you how to run the analysis?
-   Can you run the analysis successfully?
-   ...

5.  If you find any issues that you can fix, fix them in the code

6.  Commit and Push the updates to your fork

7.  Go to your fork on GitHub.com and select "Contribute". Open a PR. In the discussion of the PR, describe the key fixes that you to addressed.
