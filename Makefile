APP = imicrobe-prokka
VERSION = 0.0.1
EMAIL = $(CYVERSEUSERNAME)@email.arizona.edu

clean:
	find . \( -name \*.conf -o -name \*.out -o -name \*.log -o -name \*.param -o -name launcher_jobfile_\* \) -exec rm {} \;

container:
	rm -f singularity/$(APP).img
	sudo singularity create --size 3072 singularity/$(APP).img
	sudo singularity bootstrap singularity/$(APP).img singularity/$(APP).def
	sudo chown reference=singularity/$(APP).def singularity/$(APP).img

iput-container:
	rm -f singularity/$(APP).img.xz
	xz --compress --force --keep singularity/$(APP).img
	iput -fKP singularity/$(APP).img.xz

iget-container:
	iget -fKP $(APP).img.xz
	xz --decompress --force --keep $(APP).img.xz
	mv $(APP).img singularity/
	mv $(APP).img.xz stampede/

test:
	sbatch test.sh

jobs-submit:
	jobs-submit -F stampede/job.json

files-delete:
	files-delete $(CYVERSEUSERNAME)/applications/$(APP)-$(VERSION)

files-upload:
	files-upload -F stampede/ $(CYVERSEUSERNAME)/applications/$(APP)-$(VERSION)

apps-addupdate:
	apps-addupdate -F stampede/app.json

deploy-app: clean files-delete files-upload apps-addupdate

share-app:
	systems-roles-addupdate -v -u <share-with-user> -r USER tacc-stampede-$(CYVERSEUSERNAME)
	apps-pems-update -v -u <share-with-user> -p READ_EXECUTE $(APP)-$(VERSION)
