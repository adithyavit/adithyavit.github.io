---
layout: page
title:  "Geospatial hotspot analysis"
categories: jekyll update
---
# Abstract
Today the use of Geodatabases and spatial databases has expanded into almost every market and institution around the globe especially in the field of Logistics, Transportation, Healthcare, retail and financial services industry. These databases are optimized for storing and querying data that represents objects defined in a geometric space and can provide new levels of insight and information. In this project We extract data from such a  database and use it for operational (day-to-day) and strategic level (long term) decisions including Hot zone analysis and hot cell/hotspot analysis.
# Keywords
GeoSpark , MapReduce Algorithms, Geo Spatial Databases, Hadoop, Spark, Parallel and Distributed Databases.
# Introduction
Due to the distributed nature of organizational Units and need for sharing of data, Distributed databases are very  favored nowadays. They  can provide  on-demand capacity, continuous availability and geographically distributed operations and are not limited to one system and can be  spread over different sites that don’t share physical components. Its predecessor , a centralized database  is a database that is located, stored, and maintained in a single location, most often a central computer or database system. It had its own advantages like maximized data integrity, minimum redundancy, security and faster updates to name a few. On the other hand , it was highly dependent on network connectivity and vulnerable to high traffic, concurrency and hardware failures. People have now  given up on these highly desirable characteristics of transactional consistency in favor of distributed operation. That is a trade-off that is very attractive if you can’t find a way to scale-out transactions.
With the introduction of Big Data ,the importance of distributed databases has increased exponentially.
The highly centralized data centers have become a thing of the past and organizations now have to  favor a distributed model to deal with the huge amount of data. The number and variety of client devices, use of embedded technology, need to mine data and maintaining acceptable performance levels without sacrificing  scaling capabilities highly favor distributed computing paradigm for resolving all these issues.

![](images/geospatial1.png)

In this project, we have to work with spatial queries on a large database that contains geographic data as well as real-time location data of customers.This geodatabase or spatial database is  designed to store, query, and manipulate geographic information and spatial data.The queries used in this project  are different from traditional  SQL queries because they allow for the use of points, lines, and polygons and also consider the relationship between these geometries.
The project is divided in two phases where each phase has its own set of tasks to be completed.In  Phase-1 was to extract data from the  database to be used for operational (day-to-day) and strategic level (long term) decisions.The next phase,  Phase-2, was based on Hot zone analysis and hot cell/hotspot analysis.
We used Spark SQL as the Big Data application for data extraction,processing and analysis for this project.This enabled us to streamline the process of querying data from any source, whether internal distributed datasets or external.Its cost based optimizers, columnar storage, and code generation aid the query processing  , making it a lot faster. It also scales well and provides a robust fault tolerance.
# Project Phases 
## Phase 1:
Phase 1 of the project involved setting up the environment necessary for running our queries.We created three AWS EC2 instances(one master and two slave nodes) and installed Hadoop and Spark on the same instances .Using a bidirectional password-less SSH, we were able to login from master to workers.
We then proceeded to create two functions: ST_Contains and ST_Within in SparkSQL.The function ST_Contains checks if a point is contained within a rectangle while the function ST_Within is used for finding if two points are within a specified distance.
These two user defined functions are then used for the following 4 spatial queries:
1. Range query: Using ST_Contains, for a query rectangle R and a set of points P , we find all points within the rectangle.
2.Range Join query:Using ST_Contains, for a query rectangle R and a set of points P , we find all (point, rectangle) pairs within the rectangle.
3.Distance query:Using ST_Within , for a point P and a specified distance D, we find all points that lie within that distance from P.
4.Distance join query:Using ST_Within , for a set of points S1 and S2 and a specified distance D, we find all (s1,s2)pairs such that  S1 is within a distance D from S2.
For all these queries, we have used  "arealm10000.csv" and "zcta10000.csv" datasets which contain the coordinates of approximately  10,000 points each. 
## Phase 2:
The goal of Phase 2 was to do Hot zone analysis and hot cell/hotspot analysis using the spatial queries.
`Hot zone analysis`:The task was to perform a range join operation on a rectangle and point dataset.For each rectangle, the number of points  within that rectangle is obtained.The larger the number of points within the particular rectangle, the hotter zone it is.Here also, we used the ST_Contains function from phase 1 for finding the zones.
`Hot cell analysis`:
This task was focused on applying spatial statistics to spatio-temporal big data and identifying statistically significant spatial hotspots .We implemented a Spark Program to calculate Getis-Ord statistics of NYC Taxi Trip datasets.
For this phase , We used the "zone-hotzone.csv" dataset which contains the coordinates of 286 rectangles. It also used "point-hotzone.csv" which contains information on 10,000 taxi trips in New York City with only  including pick-up coordinates.”yellow_trip_sample_100000.csv” is the dataset which contains data on taxi trips in the month of January, 2009

# Experimental Setups
## Cluster setup:
Amazon web services were used to set up the environment for this phase of the project. Initially only one master with one worker is used to run the programs. Then, Three instances of EC2 were created, one for master node and 3 for worker nodes, including the master. 
![](images/geospatial2.png)

Initially hadoop was installed and the required java version was also installed on all the nodes. Here EC2 implies elastic compute 2. Due to the limitations of aws, the created instances were configured with 7.69 gb of storage, which is sufficient enough for this project. After installing Hadoop, a framework named spark was also installed on each node. We use spark sql to run our queries.

![](images/geospatial3.png)

## Data set:
The datasets that have been used for this project are zone-hotzone.csv, yellow_trip_sample_100000.csv (Small Dataset), yellow_tripdata_2009-01_point.csv (Large Dataset). was used to generate the output for HotZone Analysis.
`CPU use percent:` Cpu utilization is the amount of work done by the cpu. Based on the type of tasks and the amount of tasks done by the cpu, the utilization could vary. Few tasks require a lot of cpu, in which case the cpu utilization would be high and few cases require a lot less, where the cpu utilization is low.
`Memory - Cache:`  This is the memory used for page cache in linux. The operating system takes the regularly used pages and uses memory to cache them.
`Memory - Use:` Though we have a lot of physical memory, only a portion of it used to run the task. This is the amount of memory used by the worker and is represented by the term Memory - Use.
`Loads/procs -CPU’s:` It represents the number of cpu used by the system. When we use a single processor (AWS T2.small), we have a straight line representing the cpu count and there is a sudden jump when we start using 2 cpu (AWS T2.large). 
`Loads/procs -procs:` Proc is a virtual file system which is created when required by the system and contains information about the processes. As the file size is increased, we observe a sudden spike in creation of procs.

We perform these queries by configuring the machine with t2.small which is 2gb ram, 1 core. Also, we use t2.large which has 8gb ram and 2 cores. Then we scale up the resources and use 3 machines to compare how the performance increases as we add more instances/worker nodes.
## Results:
 The below tables illustrate the experiments conducted, the cpu utilization, disk I/O and the time taken for each program on different 
![](images/dds_graph1.png)
![](images/dds_graph2.png)
![](images/dds_graph3.png)
![](images/dds_graph4.png)
![](images/dds_graph5.png)
![](images/dds_graph6.png)
## Conclusion
Working on this project helped us recognize the importance  of  Distributed Database Systems and how they work with large volume of data.We got a hands-on-experience on both Apache Hadoop and Spark and learnt how Mapreduce solves the problems of Big data and its storage.We also learnt about the geospatial databases and how they are different from traditional databases.All of this has greatly improved our overall understanding of the subject matter and will definitely help us in our future endeavours.
## Acknowledgements
We would like to express our gratitude to Dr. Mohamed Sarwat for giving us this opportunity to explore the field of Distributed databases through a very relevant project.His support and motivation was key in the fulfillment of this project and we really appreciate it.We would also like to thank Kanchan choudhary for his explanation as well as his assistance in clearing our doubts when we needed it.Without him this project would never have successfully completed.
## References
  1. https://hadoop.apache.org/ 
  2. 2016.Amazon EC2. https://docs.aws.amazon.com/ec2/index.html?nc2=h_ql_doc. 
  3. 2016.Apache Spark documentation https://spark.apache.org/documentation.html
  4.  http://sigspatial2016.sigspatial.org/giscup2016/problem
  5. https://www.scala-lang.org/