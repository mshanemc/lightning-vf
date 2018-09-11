# sfdx force:org:create -f config/project-scratch-def.json -d 1 -s
sfdx shane:org:create -f config/project-scratch-def.json -d 1 -s --json -u vf -o work.shop

sfdx force:package:install -r --package 04t6A000000SG0F -w 20

sfdx force:apex:execute -f scripts/dataWipe.cls
sfdx force:data:tree:import -p data/sample-data-plan.json

sfdx force:source:push
sfdx shane:user:password:set -l User -g User -p sfdx1234 --json

sfdx force:org:open
sfdx shane:data:file:upload -f assets/Visualforce_Report_2018-09-06_02-25_PM.pdf -n "VisualforceReport"