# CSV Sorting

This is a simple Ruby applet that sorts CSV files alphabetically,
ignoring nil values.


### Programming - Running the sorter

Step 1 Install Docker

https://docs.docker.com/install/

Step 2 Ensure docker-compose is installed. Docker desktop should have installed this.
```
docker-compose -v
```

Step 3 Pull docker image
```
docker-compose pull
```

Step 4 Run the sorter
```
docker-compose run csv
```

Step 5 Open outputs
```
vi output.csv
```


### Gherkin
1. See specs/integration/csv_sorting.feature for tests.
2. I added the explanations above the tests in the above file.

### Tools
1. Version control systems are an essential tool for modern software
development. They help us in so many ways its hard to come up with a short answer.
I'll list a few things that come to mind.

* git branches help teams simultaneous developm multiple features without
interfering/disrupting each others work
* tags & git SHAs help us keep track of what code is where. This is helpful for
debugging, rolling back code, releasing new versions.
* A full history of the development of a project is incredibly useful. You can
always track down who wrote the code, why it was written, what other code
was implemented with it, how code changed over time, who made those changes,
etc.


I can't think of too many things that are annoying about VCS. There are some
minor workflow issues that can cause some grievance, but are easily solved. Like:

* Merge conflicts. These can be a PITA to figure out on occassion, but they
usually are resolved quickly
* 2 developers working on the same branch can cause a lot of headaches as
the branches can become out of sync from each other. This can be solved
by having devs work on their own branches and merging them into topic branches.

2. I have been developing exclusively on Docker for the past 8 months. The flat out
best thing about it is never having to set up a development environment. I can
seamlessly go from writing Elixir to Ruby with just a few commands. I can also
create a repository that doesn't need 100 setup steps in a readme, but instead
can be run with a `bin/setup` command or something similar.

Testing on docker can be annoying without setup. If you have to run a container
bash session and then run an arbitrary test suite command. This can be alleviated
by setting up a shell script that executes a test runner on the docker container.

I haven't been too involved with deploying Docker containers, so I don't have
a strong opinion here. I can imagine it can be tricky to get all of the docker
containers talking to each other correctly, but `docker-compose` works wonders
here.


3. Most programming languages can get things done, especially simple tasks like
this exercise. As far as deciding which language to use, I'd first need
to evaluate the problem.

If I am interfacing with a data scientist who needs to use tensor flow, then I will
probably write Python because he may need to read/write some of the code I
am writing for him.

If I need to do some rapid prototyping I will choose Ruby or JavaScript because
I am more comfortable in those languages, and they also are extremely flexible
and have a ton of open source tools to support them.

I chose Ruby for this because I am extremely comfortable writing Ruby and its
also a great choice for writing scripts.


### Testing Methodology

1. QA, in my mind, has two major roles. First, they must 100% understand the
business, business needs, and business requirements. They try should know this
better than the systems and business analysts they work with.

Second, they need to ensure that the developers understand these needs &
requirements well enough that they can do their job. They also need to support
development in a way that helps them improve their development quality and
speed.

2. Outline desired behavior with the team generating requirements. I love
when business requirements are written in a way that they can be translated
directly to test suites. IE, write your requirements in Gherkin.  Then the
requirements can be directly translated to test steps that can be executed
by the developers who are writing the code.


3. Automated testing should be used to guarantee functionality in a way that
it gives business assurance that the new features work, and the old features
don't have any regressions. This should be a mix of unit, integration and feature
tests. They should be run in their entirety before any code is merged into
master, and deployed to production.

Manual testing is important during acceptance testing to ensure the UI was
implemented in a way that makes sense for the users. This is also a good
time to involve the UX team to make sure it meets their criteria as well.

4. The word "claim" was written in a way where I feel like I don't have
full faith in my development team's ability to write unit tests. I can read
their unit tests to ensure they are doing appropriate boundary testing at the  
unit test level. If not I would probably reject their pull requests before
the code was merged to master.

At the higher level, I would ensure first that all functionality guaranteed to
business had at the bare minimum happy path testing. I'd also try to
test any edge cases I could think of.  If the testing at the unit level was good
enough I'd try to avoid writing excessive validation testing at the integration
level.

I also try to avoid tests that include a lot of messaging, like testing the
verbiage of flash notifications or toaster messages. I think manual testing
by SAs or QAEs should surface any bad verbiage.
