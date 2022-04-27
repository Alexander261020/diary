console.log("existFolder")

function existFolder(name){
  console.log(name)
}
if (document.getElementById('new-folder') !== null) {
  newFolder = document.getElementById('new-folder');
  newFolder.addEventListener('click', function () {
    setNameFolder()
  });
}

function setNameFolder(){
  nameFolder = document.getElementById('name-folder');
  nameFolderHidden = document.getElementById('name-folder-hidden');
  folderHiddenInForm = document.getElementById('folder-hidden');
  townFromId = document.getElementById('town_from_id');
  townInId = document.getElementById('town_in_id');
  let date = nameFolder.innerHTML.split(" ")[0]
  townFrom = townFromId.value.split(" - ")[0]
  townIn = townInId.value.split(" - ")[0]
  let name = null
  if (townFrom != "" || townIn != "" ) {
    name = date+" "+townFrom+" - "+townIn
    console.log(name)
  } else {
    name = date
    console.log(name)
  }
  nameFolder.innerHTML = name
  nameFolderHidden.value = name
  folderHiddenInForm.value = name
}
