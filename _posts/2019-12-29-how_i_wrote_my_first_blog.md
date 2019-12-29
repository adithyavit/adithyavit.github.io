---
layout: post
title: How I wrote my first blog!
---

# How I wrote my first blog!

## This is not my first blog
To be frank this is not my first blog, when I was young, I tried to write blogs using google blogger, wix, wordpress etc.
But, I did not continue doing them for long. There were numerous reasons like jumping from one thing to another without sticking to a domain and no viewer ship etc.

## There was no struggle in my previous blogs
When I used solutions like wix, wordpress or blogger, It was so easy to publish blogs that I took it for granted. I left it easily.
Think about throwing out a branded shirt vs throwing out a shirt you custom designed.

## I did not share my previous blogs
Previously when I wrote some blogs, I posted them on my facebook page which had 20 followers, and 18-19 of those people did not care.
This made it easier to leave what I was writing in between

## My previous blogs were silly
I wrote about things that were stupid. (a boy on an adventure trip with his dog, love story hens). I fel't that I might make grammatical mistakes (Of course now, I realize that no one cares and it doesn't matter).

## Why it's different this time
This time I plan to write about data structrues, computer vision, machine learning, data science, web development, andriod development etc.
Most of my friends on instagram, twitter and linkedin would be intereseted to read atleast one of my blogs, so I would feel atleast a bit comfortable sharing my blogs if not entirely.
I care less about my mistakes being public and recieve any criticism positively.  

## Tools I used
I used jekyll and github to write and publish this blog.

## What I needed to learn to write this blog.
1. writing markdown scripts.
2. using github
3. [jekyll](https://jekyllrb.com/)
4. liquid

## Why i choose jekyll
My target was to create a portfolio website, since I have been learning about webdevelopment for a while, I looked at the available options.
1.django (I created a web app in djnago and am good at python)
2. mean/mern stack (this was trending stack and I took a course on udemy from colt steel from which I learnt a lot from)
3. ruby on rails (heard this was easy to learn and had only one was to do things unlike node)
4. dot net (widely used in industry, so I can have an easier time finding a job, if I have this on my resume)

But the thing is, I wanted to host my blog on github which provides free hosting for static sites. So, I started writing my blog in pure html/css.
Since I knew that there are a lot of themes on internet that can be used for free, I started to search for them.

while I was learning about different tools and looking at what people on quora and reddit had to say about different things, I stumbled across this things called static site generator.

## What is a static site generator??
Basically dynamic webapps are meant for websites/apps where the content is continously changing, which require to store user data in database for login authorization, providing relevant content.
Since a blog, doesn't need to have any users to login or provide unique content to each user, I can afford to cut database out of the equation.

## Advantages of static site generator.
1. **Security** It doesn't have a database, so the content is secure by default (unless someone hacks my github account and modifies the content).
2. **Performance** It does not have run a query on every request, so the files are served instantaneously by default.

## Most popular static site generators
1. jekyll (ruby)
2. gatsbyjs (node)
3. hugo (go)

## Trying out gatsby
Since I was comfortable using node and after looking at great things about gatsbyjs, I went to the gatsby website and started following the instructions given in the documentation.
I faced some issues while running those instructions, so i went to jekyll after some unfruitful searching on google for solutions.

## Trying out jekyll
I went the jekyll website and started working on it, the instructions were very simple with only four lines of code. I liked it instantly and found it better than gatsby.
but I was stuck on the same problem as before. So, I understood the problem was elsewhere. After few hours of random searching, I figured out that I had to update my xcode tools.

## After updating the xcode tools.
By the time I was done updating the xcode tools, I was already in love with jekyll. I found it much simpler than gatsbyjs. So I continued to work on jekyll.

###### I used the following line to install jekyll (always look at the official documentation for latest commands, this is just for reference)
```gem install bundler jekyll``` (make sure you have ruby installed)

###### Then I created the template folder using the following command.
```jekyll new my-awesome-site```

After looking at the documentation, I figured out that, writing blogs in jekyll is as simple as copying markdown files into the root folder of the project.
Since, I already wrote these markdown files for my projects on my github readme, I immediately copied them into my project.

## Creating the nav-bar
Now, I had to create a nav-bar for the blog, so that the viewers can click on on the project title and read about it in detail.
The default theme given by jekyll website for the blog was clean looking, but the nav-bar was on top, so everytime I added a new page, I had it update it in the yaml file for it to be updated on top nav-bar.
It was inconvinient in both ways, 
1. I had to update yml file after each blog
2. The top nav-bar would be filled after a few pages.

So, I started looking for themes with sidebar. After a few hours of trying different themes. I stumbled upon this theme **Lanyon** which is based on poole.

## steps to use Lanyon
1. clone the lanyon theme
2. copy/create markdown files for your blog.
3. create a folder for each markdown with the same name and use it store the images for markdown.
4. add a front-matter at the top of each markdown by basically adding lines in the below format

```
---
layout: page
title: About
---
```

5. create a git repo, add all files to git and push them to your github.(make sure that the repo is of the format username.github.io)
6. go to username.github.io to view your blog published ([adithyavit.github.io](adithyavit.github.io))

### notes on hyde
There is one more theme based on poole called hyde. This is similar to lanyon, but has a fixed sidebar as opposed to sliding sidebar on lanyon.
I tried using it, but as it uses some deprecated tools, I encountered some issues while trying to serve it. Even after fixing those things, the rendering was improper.
So, I would suggest using lanyon and avoid hyde.
