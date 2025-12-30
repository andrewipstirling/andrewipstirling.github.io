---
layout: page
title: Multi-Camera Setup for Image Guided Neurosurgery
description: Development of a low-cost multi-camera optical tracking system for neuronavigated surgery.
img: assets/img/opsis/opsis_overview.png
importance: 2
category: research
related_publications: true
---

## Project description

During my Bachelor's capstone project, my team partnered with the **Neuro-Imaging and Surgical Technologies Lab (NIST)** at McGill to develop a multi-camera object tracking system for image-guided neurosurgery.

State-of-the-art neuronavigated surgeries require expensive infrared stereo cameras, which are prone to occlusion in the operating room (OR). To address this limitation, our capstone group designed a **multi-camera ring fixture** that can be overlaid on top of surgical lamps in the OR.

In addition, we developed a **custom optical fusion algorithm** that combines measurements from each camera, allowing tracking to continue even when multiple cameras are occluded. Because neuronavigated surgeries are prohibitively expensive, very few Canadian hospitals are able to offer these lifesaving procedures. Our capstone project placed **2nd among competing teams**, providing funding to transition the work into the startup **OPSIS**.

## Mechanical and Electrical Design

The fixture consists of a **3D-printed circular ring** holding five camera mounts. The surgical pointer and reference object were designed as **3D-printed dodecahedrons**, maximizing planar surface area for ArUco markers used in the optical tracking software.

Mounted on top of the camera ring are **five Raspberry Pis**, along with a shared power source and network switch, which transmit all RGB camera feeds to a local computer.

<img src="/assets/img/opsis/embodiment.png" alt="Mechanical Drawings of Components" width="45%">

<img src="/assets/img/opsis/exploded.png" alt="Exploded View of Camera Ring" width="45%">

## Optical Fusion Algorithm

To fuse camera measurements, detected **ArUco markers** are extracted from each image, and the pose of the pointer and reference object is computed by solving a **Perspective-n-Point (PnP)** problem.

We then smoothed the poses using a **constant-velocity motion model** and fed this process model through an **adaptive Extended Kalman Filter (EKF)**. Each camera’s pose measurement is fused asynchronously as it becomes available. Further description of the system can be found in {% cite LARK %}. The current system achieves an estimated tracking error on the order of **1 mm**, comparable to the performance of traditional infrared camera-based systems.
