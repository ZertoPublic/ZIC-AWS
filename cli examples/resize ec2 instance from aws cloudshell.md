# Resize an instance from AWS CLI

**Instance is an m5a.xlarge**

**Stop the instance**
~~~bash
aws ec2 stop-instances --instance-ids i-0e417e994e9cc9e8a
~~~


**Resize the instance**
~~~bash
aws ec2 modify-instance-attribute --instance-type t2.micro --instance-id i-0e417e994e9cc9e8a
~~~

![](file:////Users/shannonsnowden/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image003.png)

**Start the instance**
~~~bash
aws ec2 start-instances --instance-ids i-0e417e994e9cc9e8a
~~~


![](file:////Users/shannonsnowden/Library/Group%20Containers/UBF8T346G9.Office/TemporaryItems/msohtmlclip/clip_image005.png)

Instance is a t2.micro