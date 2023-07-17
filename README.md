# Reproductiblity from GitHub

Add your code to GitHub and have others clone and run your code.  Since you don't know the computational environment that other are using you have to be careful about R versioning and package dependencies.  For straightforward analyses that use common R packages that maintain backward compatibility, then putting your code on GitHub is a solid foundation for reproducibility.  

You would then archive your GitHub repo on Zenodo (https://zenodo.org) so that it persists.  Here is information about linking your GitHub repo to Zenodo and then creating a release of your code that gets automatically upload to Zenodo.  You then got into Zenodo to update the metadata.  See more here: https://coderefinery.github.io/github-without-command-line/doi/

# Reproductiblity from GitHub + renv

Renv is a package manager for R (https://rstudio.github.io/renv/articles/renv.html) that controls for the version of R code.  I have yet to have a project that didn't involve me throwing a can, bottle, or otherwise at my computer screen because an renv.lock file gets cross wired.  Renv is awesome in principle but not in practice.

# Reproductiblity using Rocker + GitHub

Why start from Docker? Starting from a Docker container is the closest thing you can do to starting from a fresh computer that isn't filled with all the packages and data sets that you already have on your computer.  A fresh computer forces you to be explicit about package installs, etc. and will make it easier for others to successfully reproduce your analysis.

1. Download and install Docker Desktop on your computer. The instructions are at https://www.docker.com/.  Launch Docker by starting the Docker application.

2. Find the command line for your computer (terminal in Mac or command prompt in Windows)

3. In the command line, try to run  `docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 rocker/rstudio` that is documented here: https://rocker-project.org/

4. Point your browser to `localhost:87871`. Log in with user = rstudio, passwoard = yourpassword.

4. On GitHub.com, create a fork of the following GitHub repo into your GitHub organization: https://github.com/rqthomas/reproducibility-demo

5. Start a new project in the rocker container in #4.

6. Try to reproduce the analysis in `manuscript-analysis.Rmd`

7. If you find any issues that you can fix, fix them in the code.

8. Set up your GitHub profile on the Rocker container following: https://github.com/frec-3044/git-rmd-intro-template/blob/main/assignment/instructions.md

9. Commit and Push the updates to your fork

10. Go to your fork on GitHub.com and select "Contribute".  Open a PR.  In the discussion of the PR, describe the key fixes that you to addressed.

# Reproductiblity using Docker + GitHub

In the above example, you start from the rstudio rocker and then install packages on top of it. To be more explicit about the users environment, you can provide your own docker container.  You would do this if you have a particular Rocker version that you want to start with or you are worried about packages changing.

1. Update the Dockerfile in this repo to match your repo

2. Create user account on hub.docker.com

3. At the terminal navigate to your github repo on your computer.  Then run the following code to create, tag, and push your Docker container

```
docker build https://github.com/rqthomas/reproducibility-demo.git#main -t thomas_demo#main -t thomas_demo
docker image tag thomas_demo rqthomas/thomas_demo:latest
docker image push rqthomas/thomas_demo:latest 
```

Then you can run the following like in the Rocker example, except that you will be able to use your container with the extra packages in install.R

```
docker run --rm -ti -e PASSWORD=yourpassword -p 8787:8787 thomas_demo:latest
 ```











