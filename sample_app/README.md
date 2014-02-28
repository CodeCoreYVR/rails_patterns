# Background

A barter application exists that allows a user to post a barter
offer.  It will also allow a user to respond and propose a response

# Setup

```
rake db:migrate
rake spec # should all pass at the start
```

It's recommended that you do your work in a separate branch and cherry-pick the
exercises into your working branch. The following will create your working branch

```
git checkout -b my_exercises origin/master
```

# Exercise 1

Setup the exercise.

```
' bring in the exercise_1 work
git cherry-pick origin/exercise_1

' verify that the tests pass at the start
rake spec
```

Introduce a service object for a the new barter posted.  Ensure the tests pass.

```
' commit your work
git commit
```

# Exercise 2

A new use case has been added to support accepting a response to a barter


```
' bring in the exercise_2 work
git cherry-pick origin/exercise_2

' verify that the tests pass at the start
rake spec
```

Introduce a service call for the new use case.

```
' ensure the tests pass
rake spec

' commit your work
git commit
```

# Exercise 3

This is a similar exercise as first two exercise.  To add two service calls.
However, the tests have changed so this may affect the verification of the refactor

```
' bring in the exercise_3 work
git cherry-pick origin/exercise_3

' run the tests
rake spec
```

Fix the tests

```
' ensure the tests pass
rake spec

' commit your work
git commit
```

