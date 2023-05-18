
<?php
$linkchoice = '';
if (isset($_GET['word'])) {
  $linkchoice = 'word';
  $option = $_GET['word'];
}

switch ($linkchoice) {
  case 'word':
    actionFindOcurrency($option);
    break;

  default:
    echo 'no function';
}

function actionFindOcurrency($word)
{
  $ocurrency = findWord($word);
  echo $ocurrency ?? 0;
}

function findWord($word)
{
  $arrFiles = getFiles();
  $count = 0;
  foreach ($arrFiles as $fileName) {
    $zip = new ZipArchive;
    $zip->open($fileName, ZipArchive::RDONLY);
    if ($zip == false) {
      var_dump("Error in opening file");
      exit();
    }
    $contentZip = $zip->getFromIndex(0);
    $zip->close();
    $count += substr_count($contentZip, $word);
  }
  return $count;
}

function getFiles()
{
  $directory = 'organizations/';
  $arrContent = glob($directory . "*");
  return $arrContent;
}
?>