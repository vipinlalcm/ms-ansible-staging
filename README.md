This is monitorscout staging installation repository. The work is in progress now.



### Dependencies:
siptracklib  
python  
ansible  



#### The below playbooks will work as expected. 

databaseinstall.yml   
hlrpcfront.yml  
hlwebalt.yml  

This cookbook is working with dynamix inventory script "inventory_generate.py". This script will read the groups and hosts from "inventory.yml" file and fetch the passwords from siptrack. Then it will parse it to ansible with ansible unedrstadable format with passwords and variables.

***NOTE: All server groups and hosts should be mentioned in "inventory.yml" in the same yml format.***

**How to run:**

1) Copy ssh-keys to destination hosts by running bootstrap playbook. This will fetch the password from siptrack and copy the ssh key to destination machine. After this step you will be able to run the playbook with ssh-keys. No need to mention the password.

    #ansible-playbook bootstrap.yml -i inventory_generate.py

2) Then you can run playbooks one by one.

    #ansible-playbook databaseinstall.yml
    #ansible-playbook hlrpcfront.yml
    #ansible-playbook hlwebalt.yml
