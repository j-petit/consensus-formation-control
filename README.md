# Formation Flight of Quadrotors
Blog post to the repo: https://www.jenspetit.de/2019/03/formation_control_quadrocopters.html
All Information can be found in the thesis, the .pdf File in the repo.

# Thesis Abstract
Due to falling prices of electronics, the abundance of cheap computing power and ongoing miniaturization, swarms of autonomous vehicles are starting to become reality. To control such large scale systems, the field of cooperative control was established and has gained significant attention in recent years. A multi-vehicle system may be able to solve tasks that cannot be achieved by a single agent. Applications are various and range from cooperative load carrying to monitoring large areas. In all these applications, formation maintenance plays a key role, which is covered in this work.

Traditionally, a formation consists of multiple vehicles with defined relative positions in a reference coordinate frame. Through a consensus algorithm, a common understanding of the reference frame is achieved and enables the vehicles to move accordingly. Hence, the vehicles follow the trajectory of the reference movement while keeping the geometric configuration in a simple feed forward manner as conventional formation control algorithms do not include feedback from the formation. This idea is realized in order to improve the formation keeping accuracy.

In a first step in the present thesis, a quadrotor is modeled as well as controlled and serves as a vehicle in the formation flight. Secondly, as in traditional formation control, a consensus algorithm enables each quadrotor to have a common under- standing of the reference frame. Thirdly, the formation feedback comes through a maximum distance consensus module and consists of information about the max- imum physical dimensions of the formation. This knowledge is then used to affect the trajectory of the reference frame. Finally, the performance of the proposed formation control framework is evaluated through simulations and compared to a solution without feedback. The results show a considerable improvement in position keeping accuracy. The formation shape persists recognizable even for fast dynamic movements of the reference frame. As the presented framework is independent of the quadrotor, it can be adapted for other vehicles. Furthermore, through the distributed approach, it is easily scalable and robust to changes in the communication network. An experimental validation could be a topic for future work.
