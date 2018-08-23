sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx force:package:install -r --package 04t6A000000SG0F -w 20
sfdx force:user:permset:assign -n dreamhouse
sfdx force:apex:execute -f scripts/dataWipe.cls
sfdx force:data:tree:import -p data/sample-data-plan.json

sfdx force:source:push

sfdx force:org:open