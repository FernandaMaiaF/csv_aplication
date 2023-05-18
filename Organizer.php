
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

function getFiles()
{
  $directory = 'organizations/';
  $arrContent = glob($directory . "*");
  return $arrContent;
}

function findWord($word)
{
  $arrFiles = getFiles();
  $count = 0;
  foreach ($arrFiles as $fileName) {
    $file = fopen($fileName, "r");
    if ($file == false) {
      var_dump("Error in opening file");
      exit();
    }
    $filesize = filesize($fileName);
    $filetext = fread($file, $filesize);
    fclose($file);
    $count += substr_count($filetext, $word);
    // echo ( "<pre>$count</pre>");
  }
  return $count;
}
?>