### Introduction into BOSH release

A BOSH release is a versioned collection of configuration properties, configuration templates, start up scripts, source code, binary artifacts, and anything else required to build and deploy software in a reproducible way.

You can refresh your knowledge about main BOSH concepts in the introduction to the course ["Install BOSH with bosh-init"](#/training/cf_for_devops_engineers/cf_for_devops_engineers_advanced/install_bosh_with_bosh_init).

In this section we will repeat relations between 3 main concepts: Stemcell, Release and Manifest.

#### Stemcells

You can think of Stemcell as a basic image of operating system. Essentially a stemcell is a template, which BOSH uses to create VMs that are needed for a broad variety of components and products.

![](https://s3.amazonaws.com/cf-training-resources/stemcells.png)

Stemcells can be normal and light. Normal Stemcell is an archive with image file (`.raw`, `.ovf` and other formats) plus metadata that contains BOSH system data. Light Stemcells contain only metadata with reference to an image in cloud itself (it works similarly to using AMI ID while creating VMs in AWS).

#### Releases

Releases are combination of source code, binaries, configuration templates and other things that are requred to run software on the VM that was created on top of stemcell. 

![](https://s3.amazonaws.com/cf-training-resources/releases.png)

Sometimes you can find compiled releases. These releases contain pre-compiled packages and various configuration files. A non-compiled release (or just release) contains jobs and source packages. The problem with the compiled release is the requirement to be compiled across every stemcell and cloud.

#### Manifest

Manifest is the main configuration file that ties all releases and stemcell together. Originally Manifest is a YAML file that identifies one or more release, one or more stemcells and specifies how to configure them for a given deployment. As soon as you upload BOSH releases, stemcells and create deployment manifest, you can run the deployment. BOSH will create all the components described in the Manifest. 

![](https://s3.amazonaws.com/cf-training-resources/manifest.png)

On the way of BOSH development more and more concepts may appear: e.g. Cloud Config, CPI Config and etc. Still Stemcell, Release and Manifest are three core components, which are irreplaceble.
