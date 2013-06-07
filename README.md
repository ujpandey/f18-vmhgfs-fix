patch_vmware_tools_Fedora_18
============================

The current release of VMware Tools has some issues which makes vmhgfs not work with the newest Linux Kernels.

Look at [Erik Bryan'ts Blog](http://erikbryantology.blogspot.com/2013/03/patching-vmware-tools-in-fedora-18.html) and [Fedora forums](http://www.forums.fedoraforum.org/showthread.php?t=291199) for more information.
Currently, it seems that only issue #3 on the blog is relevant.

You can install the patches provided in the pages linked above yourself or you can use the script I wrote for the entire installation procedure. Keep in mind that you need to apply both the patch provided under issue #3 of the blog and the patch provided in the Fedora forums thread. The instructions provided in the Fedora Forums thread doesn't work because of an apparent typo in the patch.

## Pre-install
You need to choose to either install or reinstall VMware Tools then extract the VMwareTools-9.2.3-1031360.tar.gz package from the mounted CD onto a location inside your VM first.

## Installing Manually
Follow the instructions for issue #3 at [Erik Bryan'ts Blog](http://erikbryantology.blogspot.com/2013/03/patching-vmware-tools-in-fedora-18.html)

Download the patch provided at [Fedora forums](http://www.forums.fedoraforum.org/showthread.php?t=291199), open it in a text editor and change `inode.c` to `./inode.c` in the first two lines and save. Then install the patch.

Install vmware tools by running vmware-install.pl. Clobber the vmci module provided by the kernel.

You can also download the copies for the patches I made in this repo. I also created a script to install the other patch.

### Command Line commands
Open a terminal and enter the following commands:

    $ cd /.../vmware-tools-distrib (replace ... with the proper path to the directory where you extracted VMware Tools)
    $ wget -d https://raw.github.com/ebdevrepo/bin/master/vmware9.compat_mm.patch
    $ wget -d https://raw.github.com/ebdevrepo/bin/master/vmware_hgfs_fix.sh
    $ wget -d https://raw.github.com/ujpandey/patch_vmware_tools_Fedora_18/master/patch_inode.c.patch
    $ wget -d https://raw.github.com/ujpandey/patch_vmware_tools_Fedora_18/master/patch_inode.c.sh
    $ chmod +x vmware_hgfs_fix.sh
    $ chmod +x patch_inode.c.sh
    $ ./vmware_hgfs_fix.sh
    $ ./patch_inode.c.sh
    $ su -c './vmware-install.pl --clobber-kernel-modules=vmci'
    
## Installing with the script
You can either download all the files provided in this repo into your vmware-tools-distrib directory and then run the patch script as root or you can just download the script into your vmware-tools-distrib directory and run it as root. It will download the other files provided you have an internet connection. 

This script installs VMware Tools with all the default options. To change that behavior, open the script and remove `echo | ` from the last line, then save and run.

    $ cd /.../vmware-tools-distrib (replace ... with the proper path to the directory where you extracted VMware Tools)
    $ wget -d https://raw.github.com/ujpandey/patch_vmware_tools_Fedora_18/master/patch.sh
    $ chmod +x patch.sh
    $ su -c './patch.sh'
