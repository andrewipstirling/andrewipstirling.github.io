---
layout: page
title: Applied Robotics
description: A series of projects implementing kinematic and dynamic controllers for various robots in my graduate course.
img: assets/img/kinova_arm.png
importance: 2
category: research
related_publications: false
---

## Applied Robotics

In these projects, I worked with a variety of robots in my Applied Robotics Graduate Course.  
The main highlights consisted of implementing kinematic and dynamic controllers
for the Kinova Kortex arm, achieving commanded positions within set time constraints.

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    <video width="560" height="315" controls>
      <source src="{{ '/assets/video/dynamics_kortex.mp4' | relative_url }}" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  </div>
</div>

Building off the controllers, I used ROS action servers to perform tasks such as cleaning
a table of boxes or performing pick-and-place operations.

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    <video width="560" height="315" controls>
      <source src="{{ '/assets/video/cleaning_kortex.mp4' | relative_url }}" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  </div>
</div>
