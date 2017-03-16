### Introduction into BOSH release

A BOSH release is a versioned collection of configuration properties, configuration templates, start up scripts, source code, binary artifacts, and anything else required to build and deploy software in a reproducible way.

You can refresh the main BOSH concepts in introduction to the course ["Install BOSH with bosh-init"](#/training/cf_for_devops_engineers/cf_for_devops_engineers_advanced/install_bosh_with_bosh_init).

In this section we will repeat relations between 3 main concepts: Stemcell, Release and Manifest.

##### Stemcells

You can think of Stemcell as a basic image of operating system. Commonly a stemcell is a template from which BOSH creates VMs that are needed for a wide variety of components and products.

![](https://s3.amazonaws.com/cf-training-resources/stemcells.png)

Stemcells can be normal and light. Normal Stemcell is an archive with image file (with `.raw`, `.ovf` and other formats) and metadata that contains BOSH system data. Light Stemcells contain only metadata with a reference to image in cloud itself (the good example is using AMI ID while creating VMs in AWS).

##### Releases

Releases are set of source code, binaries, configuration templates and other things that needed to run software on the VM that was created on base of stemcell. 

![](https://s3.amazonaws.com/cf-training-resources/releases.png)

Sometimes you can find compiled releases. A compiled release contains compiled packages and configuration files. A non-compiled release (or just release) contains jobs and source packages. The problem with compiled release is that they needed to be compiled across every stemcell and cloud.

##### Manifest

After you have uploaded BOSH releases and stemcells, you can run deployment, which will create all the components described in the Manifest. Manifest is the main configuration file that ties all releases and stemcell together. Originally Manifest is a YAML file that identifies one or more release, one or more stemcells and specifies how to configure them for a given deployment.

![](https://s3.amazonaws.com/cf-training-resources/manifest.png)

On the way of BOSH development more and more concepts appear: Cloud Config, CPI Config and other. Still these three things always stay the same.
