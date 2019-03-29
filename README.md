# Logic Seminar Verona

This repository hosts the
[website](https://www.logicverona.it/) of the Logic Seminar
Verona.

The individual posts are stored as Markdown files in the `posts` subdirectory.
A Haskell program based on [Hakyll](https://jaspervdj.be/hakyll/) turns these
into static HTML files. This program is automatically run on servers by [Travis
CI](https://travis-ci.org/) on each push to the repository. The resulting HTML
files are stored in the `gh-pages` branch, which is then served by [GitHub
Pages](https://pages.github.com). No knowledge of Haskell or NixOS is required
to edit the website.


## How to add a new post using GitHub's webinterface

1. Register an account on GitHub and tell one of the repository administrators
   your GitHub username so they can give you write access.
2. Navigate to [the directory `posts/main/`](https://github.com/logic-seminar-verona/website/tree/master/posts/main).
3. Click *Create new file*.
4. Pick a file name like `2019-03-27-departmental-seminar.md`. The date should
   refer to the current date, not to the day the talk will take place.
5. In the text box, copy the contents of a previous post such as [this
   one](https://raw.githubusercontent.com/logic-seminar-verona/website/master/posts/main/2019-03-27-departmental-seminar.md)
   to serve as a template and change the contents as you see fit.
6. Click *Commit new file*.
7. That's it. About five minutes later, the new post should be visible on the
   website. In case you're impatient or curious, you can follow the build
   progress [on Travis CI](https://travis-ci.org/logic-seminar-verona/website).


## How to add a new post from the command-line

1. Register an account on GitHub and tell one of the repository administrators
   your GitHub username so they can give you write access.
2. Run `git clone https://github.com/logic-seminar-verona/website.git`. This
   command creates a local copy of the repository in the new directory
   `website`.
3. From the `website` directory, run `git pull --rebase`. This command synchronizes
   the local copy with the repository on GitHub.
4. Create a new file with a name like `posts/main/2019-03-27-departmental-seminar.md`
   with the contents of your liking. Use one of the other files in the
   directory `posts/main/` as a template.
5. Teach Git about the existence of the new file with
   `git add posts/main/2019-03-27-departmental-seminar.md`.
6. Review the changes you are about to commit with `git status` and `git diff`.
7. If everything looks fine, run `git commit -a` followed by `git push`. The
   first command tells Git to record the changes in the local copy of the
   repository. The second command uploads the changes to GitHub.
8. That's it. About five minutes later, the new post should be visible on the
   website. In case you're impatient or curious, you can follow the build
   progress [on Travis CI](https://travis-ci.org/logic-seminar-verona/website).


## Undoing mistakes

As every change is tracked by Git, mistakes can easily be rolled back. Don't
worry and inform for instance Ingo of the mishap.
