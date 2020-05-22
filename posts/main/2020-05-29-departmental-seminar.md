---
author: ioiops
date: 2020-05-22 16:45:00+00:00
title: Departmental Seminar
---

Friday, 29. May 2020, 16:00, via [Zoom](https://univr.zoom.us/j/96504680574).\
This seminar is complementary to the compact course [Program Extraction](https://www.logicverona.it/2020-05-25-short-course.html).

[Monika Seisenberger](https://www.swansea.ac.uk/staff/science/computer-science/m.seisenberger/) (Swansea University)\
_Logic in Railway Verification_

_Abstract_:  Mathematical methods always played an important role in the verification of Railway control systems.
In this talk we present two different approaches, the first for discrete systems, the second for hybrid systems. Both were used in our collaboration with Industry.
We start with traditional solid state Railway interlockings, often specified using a graphical language called Ladder Logic. We give a semantics for this language
and show how to get from aladder logic specification to a satisfiability problem. This process has been automated, and several existing Interlocking case studies,
provided by our Industrial partner Siemens Rail Automation, have been verified using automated theorem proving tools.
We further applied our own SAT solver, which we extracted from a formal constructive proof of the completeness of the Davis-Putnam-Logemann-Loveland (DPLL) proof
system. The extracted SAT solver is a verified algorithm, which either yields a model or a DPLL refutation of a given clause set [1].
In the second part, we present our modelling of the European Rail Traffic Management System ERTMS, a state-of-the-art train control system, which aims at improving
the performance/capacity of rail traffic systems, without compromising their safety.
It generalizes from traditional interlockings to a system that includes on-board equipment and communication between trains and interlockings via radio block processors. Whilst
the correctness of discrete interlocking systems is well-researched, it is challenging to verify ERTMS based systems for safety properties such as collision freedom due to the
involvement of continuous data. The modelling and verification is done in Real-Time Maude, a tool that allows for both simulation and verification of real-time and hybrid
systems [2].

[1] U. Berger, A. Lawrence, F. Nordvall Forsberg, M. Seisenberger, Extracting Verified Decision Procedures: DPLL and Resolution, Logical Methods in Computer Science, 2015.\
[2] U. Berger, P. James, A. Lawrence, M. Roggenbach, M. Seisenberger, Verification of the European Rail Traffic Management System in Real-Time Maude,
Science of Computer Programming, JSP 2018.
