---
layout: page
title: Controller Design
description: Low-Level Controller for the Unitree Go1 Robot
img: assets/img/pdilc.jpg
importance: 1
category: research
related_publications: true
---


## Low-Level Control for the Unitree Go1 Robot

In this project with the CoRoLab at the Berlin University of Applied Science and Technology, I helped investigate 
a control strategy that combined Proportional-Derivative (PD) control with Iterative Learning Control (ILC) to 
enhance legged robot velocity control. This PD-ILC controller approach was presented in {% cite ECC_pub %}.

### Control Strategy Overview

The first step was deriving a first principles, kinematic model of the Unitree Go1. 
Using the inverse kinematics equations derived from this allowed us to control individual foot positions in reference to the 
shoulder (hip) joints, forming the basis of the control strategy.

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/unitree_go1.JPG" title="Kinematic Model of Go1" class="img-fluid rounded z-depth-1" %}
  </div>
</div>

Reference foot trajectories were obtained using Bezier Curves:

$$
B(t) = \sum_{i=0}^{n} \binom{n}{i} (1-t)^{n-i} t^i P_i
$$

Using PD Control, each foot is able to follow these step trajectories, resulting in a trotting gait. However, PD turned out 
to not be satisfactory for performance, with the Go1 being unable to accurately follow desired trotting speeds. 
To improve upon this, we integrated ILC, which traditionally was only used for fixed robots such as robotic arms. 
The architecture for the PD-ILC method can be found below.

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/pdilc.JPG" title="PD-ILC Framework" class="img-fluid rounded z-depth-1" %}
  </div>
</div>

Finally, with both the PD-ILC, we were able to obtain good performance with velocity errors diminishing to under 5% after the ILC has kicked in.

<div class="row">
  <div class="col-sm mt-3 mt-md-0">
    {% include figure.liquid path="assets/img/fig_go1.JPG" title="Performance of PD-ILC" class="img-fluid rounded z-depth-1" %}
  </div>
</div>

And a video of the initial performance:

<video width="560" height="315" controls>
  <source src="/assets/video/dynamics_kortex.mp4" type="video/mp4">
</video>