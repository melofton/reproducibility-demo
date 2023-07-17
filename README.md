# reproducibility-demo

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

