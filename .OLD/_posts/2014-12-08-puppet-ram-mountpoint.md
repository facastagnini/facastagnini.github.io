ghlight shell %}---
title: Manage your ram mount points with this useful puppet module
published: true
tags:
- puppet
- devops
---
In this times that we have to live in, it is more convenient/efficient to use RAM memory to do I/O intensive operations instead hitting the HDD, or wearing off our precious SSD drives.

James Coyle wrote a [good article](http://www.jamescoyle.net/how-to/943-create-a-ram-disk-in-linux) explaining what a RAM disk is and why you should use it.

I wrote a simple yet useful puppet module to assist me in my every day tasks with RAM drives, I hope someone can use it too.



**Use this command to install the latest compatible version:**

``` shell
puppet module install facastagnini-ramdrive
```


Examples:

{% highlight ruby %}
# logdir in ram
$log_path = '/var/log/ipsec'
ramdrive { $log_path:
  size       => '100M',
  mode       => '0750',
  owner      => 'root',
  group      => 'adm',
  notify     => Service[$strongswan::service_name],
  require    => Package[$strongswan::package],
}
{% endhighlight %}



{% highlight ruby %}
# mount a ramdrive for each temporary folder
ramdrive { [
  "${project_dir}/app/storage/cache",
  "${project_dir}/app/storage/logs",
  "${project_dir}/app/storage/meta",
  "${project_dir}/app/storage/sessions",
  "${project_dir}/app/storage/views"]:
  size    => '50M',
  mode    => 0770,
  recurse => true,
  owner   => $owner,
  group   => $group,
  require => File["${project_dir}/app/storage"]
}
{% endhighlight %}

You can find related information here: [https://forge.puppetlabs.com/facastagnini/ramdrive/](https://forge.puppetlabs.com/facastagnini/ramdrive/)
