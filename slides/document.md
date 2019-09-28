
class: center, middle

# AWS infrastructure in 15 minutes

a.k.a do not be a Click Monkey

---

# Whoami

N: David Karban<br>
C: wf tech, s.r.o.<br>
T: AWS guy<br>

<img src="/images/david-karban-2.jpg" width="200" style="float:right; padding:16px" />

???

TODO: Expand info about me, about wf tech. What do I do? What the company do?

---

# What is AWS`s killer feature?

* Number of services?
--

* Pricing?
--

* Global availability?
--


API!

???

You probably know, what the AWS services are. What you may not know is, that AWS services are completely API driven. All commands to the services are send trhu same API regardless of using them thru cmdline client, SDK, or web console. And if all is accesible trhu API, all can be automated! But, does it make sense to automate?

---


#  A small infrastructure

<img src="/images/simple-infra.png" style="float:center; max-width:100%; height:500px;" />

???

This is a small example infrastructure, it is running in 1 VPC, with 6 subnets ,two public, 2 private for ec2 and 2 private for RDS. It is highly available, you can see load balancer there. With that, Load balancer needs to access outside, so we have a Internet gateway on the public subnets. Ther eis also a nat instance, so the internal machines are able to get security updates and call AWS API if needed. You see the Multi-AZ MySQL RDS. All the EC2 are in the autoscaling group. Another one is bastion here. All the EC2 have security groups. But there is more to it, you cannot see the routing tables between subnets and more. 

TODO: Find/create an imge with ALB + ec2 in autoscaling group, with sec. groups, in two AZ.

---

#  A small infrastructure

That was:

* ~ 23 services
--

* 69+ configuration items (I lost count)
--

* 80+ clicks in web console for setting it up.

--


---

# New ticket has arrived


Subject: Create a test environment.

--


Hi! I need the testing environment, just playing with some software and I may have better way how to use some services. Can you please do ASAP, so I can start working on it? It will last only for several days, no worries about price.

--

* How long will it take?
--

* How many mistakes will you do?


???

---

# There has to be a better way!

--

<img src="/images/automate-all-the-things.png" style="float:center; max-width:100%; height:500px;" />

???

What will you do? you are screwed, you do not have automation, so you must click it anyway. Ok, what to do next?

What if I tell you, you can bring it up in about 15 minutes?

---

# Automation tools

--

* Cloudformation

--

* Terraform

---

# CloudFormation

* Native AWS tool

--

* YAML/JSON syntax (pick your favorite)

--

* Stack visibility in the console

--

* Auto rollback and rolling update features


???

* wait condition

---

# Terraform

* Cloud agnostic!

--

* HCL (Hashicorp configuration language) - more powerful, than CF syntax. 

--

* State file driven drift management 

--

* Modules

--

* New features often arrive faster, then to the CF

???

* count parameter
* importing existing services
* data sources

---

# Demo


---

# Which one to choose?

* Depends mainly on you. 

--

* CloudFormation is somewhat harder to code, but you have audit trail automatically. 

--

* Terraform can do more than CloudFormation thru different clouds/APIs, and is easier to code. 

---

# Which one to choose?

* Both are better alternatives to being a click monkey!

---

# Thank You

This presentation including demos is on github: https://github.com/wftech/talk-devopssummitcz.

I am available at the wf tech booth, if you want to know more.

