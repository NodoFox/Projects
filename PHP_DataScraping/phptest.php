<html>
<head>
<title> Search Result </title>
<meta charset="UTF-8">
</head>
<style type="text/css">
table{
    text-align: center;
    
    
}
td, th{
    text-align: center;
    height:50px;
    padding:7px;
}
img{
    height:180px;
    width:160px;
}
body{
    text-align: center;
    
}
#search{
    font-family:courier;
}
</style>
<body>
<h1 id="search"> SEARCH RESULT </h1><br>
<?php
    error_reporting(0);
    // FUNCTION TO GET THE ROWS OF TABLE --
    function getTableRow($page){
        if(preg_match_all('/<tr.*?>[\s\S\n]*?([\s\S]*?)<\/tr>/', $page, $tableRow, PREG_SET_ORDER)){
            return $tableRow;
        }
        else{
            //echo $page;
            //echo "Hey there!<br>";           
            return "NoMatchFound";
        }
    }
    function getEachPerformer($allPerformers){
        if(preg_match_all('/<a href="(.*?)">(.*?)<\/a>/',$allPerformers[0][0],$each,PREG_SET_ORDER))
            return $each;
        else
            return "N/A";
    }
    // GETS EACH PERFORMER AS AN ASSOSIATIVE ARRAY
    function getPerformers($tRow){
        if(preg_match_all('/<span class="performer".*?>[\s\S\n]*?([\s\S]*?)<\/span>/',$tRow,$performers,PREG_SET_ORDER)){
            $performerEach = getEachPerformer($performers);
            return $performerEach;
        }
        else{
            return "N/A";
        }
    }
    // GETS TITLE OF THE SONG
    function getSongTitle($tRow){
        if(preg_match_all('/<div class="title".*?>[\s\S\n]*?<a href="(.*?)".*?>[\s\S\n]*?([\s\S]*?)<\/a>/',$tRow,$title, PREG_SET_ORDER)){
            return $title;
        }
        else
            return "N/A";
    }
    function getEachComposer($compData){
        //if (preg_match_all('/Various Artists/',$compData[0][0],$result,PREG_SET_ORDER)) return "Various Artists";
        if(preg_match_all('/<a href="(.*?)">[\s\S\n]*?([\s\S]*?)<\/a>/',$compData[0][0], $allComposers, PREG_SET_ORDER)){
            return $allComposers;
        }
        else if(preg_match_all('/([\s\S]*)/',$compData[0][0],$result,PREG_SET_ORDER)) {         
        return $result[0][0]; }
            
        else {return "N/A";}
    }
    // GETS ALL THE COMPOSERS OF THE SONG
    function getComposers($tRow, $regexString){
        if(preg_match_all($regexString,$tRow, $composerData, PREG_SET_ORDER)){
            $composers = getEachComposer($composerData);
            return $composers;
        }
        else
            return "N/A";
    }
    // GETS ALL THE COMPOSERS OF THE SONG
    function getComposers2($tRow, $regexString){
        if(preg_match_all($regexString,$tRow, $composerData, PREG_SET_ORDER)){
            $composers = getEachComposer2($composerData);
            return $composers;
        }
        else
            return "N/A";
    }
    function getEachComposer2($compData){
        //if (preg_match_all('/Various Artists/',$compData[0][0],$result,PREG_SET_ORDER)) return "Various Artists";
        if(preg_match_all('/<a href="(.*?)">[\s\S\n]*?([\s\S]*?)<\/a>/',$compData[0][0], $allComposers, PREG_SET_ORDER)){
            return $allComposers;
        }
                  
        else {return "N/A";}
    }
    
    function getSongSample($tRow){
        if(preg_match_all('/<div class="[\S]*? icon-search-song-new[\s\S\n]*?<a href="(.*)?"[\s\S]*? title="(.*)?"/',$tRow,$songSample,PREG_SET_ORDER)){
            return $songSample;
        }
        else
            return "NoSample";
    }
    function getImageLink($tRow){
        
    }
?>
<?php
    // FOR A SONG
    function buildSongTable($rows){
    if($rows == "NoMatchFound"){
            echo "<br><h2>Query Failed! No Match Found, Please Try Again!</h2>";
        }
        else{
            $count = 5;
            if(count($rows)<$count)
                $count = count($rows);
            echo "<table border = '1' align='center'>";
            echo "<tr><th>Sample</th><th>Title</th><th>Performer(s)</th><th>Composer(s)</th><th>Details</th></tr>";
            for($i=0;$i<$count;$i++){
                echo "<tr>";
                for($k=0;$k<1;$k++){                    
                    // Sample
                    echo "<td>";
                    $sample=getSongSample($rows[$i][$k]);
                    if($sample =="NoSample")
                        echo "<img src='SongImg.jpg' />";
                    else
                        echo "<a href='".$sample[0][1]."'target ='_blank'>"."<img src='SongImg.jpg' />"."</a>";
                    echo "</td>";
                    // Title
                    echo "<td>";
                    $title = getSongTitle($rows[$i][$k]);
                    $title[0][2] = str_replace("&quot;","",$title[0][2]);
                    echo $title[0][2];
                    echo "</td>";
                    //Performers
                    echo "<td>";
                    $performers=getPerformers($rows[$i][$k]);
                    if($performers == "N/A")
                        echo "N/A";
                    else{
                        echo $performers[0][2];
                        for($performCount = 1; $performCount<count($performers);$performCount++){
                            
                            echo " / ".$performers[$performCount][2];                            
                        }
                    }
                    echo "</td>";
                    // Composers
                    echo "<td>";
                    $regex = '/<div class="info".*?>([\s\S\n]*?[\s\S]*?)<\/div>/';
                    $composers=getComposers2($rows[$i][$k],$regex);
                    if($composers == "N/A")
                        echo "N/A";
                    
                    else{
                        echo $composers[0][2];
                        for($performCount = 1; $performCount<count($composers);$performCount++){
                            
                            echo " / ".$composers[$performCount][2];                            
                        }
                    }
                    
                    echo "</td>";
                    //Details
                    echo "<td><a href='".$title[0][1]."'target ='_blank'> Details </a>";
                }
                echo "</tr>";
                
            }
            echo "</table>";
        }
    }
?>
<?php
//ARTIST'S METHODS
    function getArtistName($tRow){
        if(preg_match_all('/<div class="name".*?>[\s\S\n]*?<a href="(.*?)".*?>(.*?)<\/a>[\s\S\n]*?<\/div>/',$tRow,$artist,PREG_SET_ORDER)){
            return $artist;
        }
        else{
            return "N/A";
        }
    }
    function getImage($tRow){
        if(preg_match_all('/<img src=(.*?)>/',$tRow,$putImage,PREG_SET_ORDER)){
            return $putImage;
        }
        else
            return "NoImage";
    }
    function getGenreOrYear($tDiv){
        if(preg_match_all('/[\s\S\n]*?([\s\S]*?)<br\/>[\s\S\n]*?([\s\S]*)/',$tDiv[0][1],$GenreYear,PREG_SET_ORDER))
            return $GenreYear;
        else
            return "N/A";
    }
    function getGenresYears($tRow){
        if(preg_match_all('/<div class="info".*?>[\s\S\n]*?([\s\S]*?)<\/div>/',$tRow,$GenresYears,PREG_SET_ORDER)){
            //$GenresYears = str_replace("\n","",$GenresYears);
            $genAndYear = getGenreOrYear($GenresYears);
            return $genAndYear;
        }
        else
            return "N/A";
    }
?>
<?php
    // BUILDING ARTIST TABLE
    function buildArtistTable($rows){
        if($rows == "NoMatchFound"){
            echo "<br><h2>Query Failed! No Match Found, Please Try Again!</h2>";
        }
        else{
            $count = 5;
            if(count($rows)<$count)
                $count = count($rows);
            echo "<table border = '1' align='center'>";
            echo "<tr><th>Image</th><th>Name</th><th>Genre(s)</th><th>Year(s)</th><th>Details</th></tr>";
            for($i=0;$i<$count;$i++){
                echo "<tr>";
                for($k=0;$k<1;$k++){
                    //Image
                    
                    $image = getImage($rows[$i][$k]);
                    if($image!="NoImage")
                        echo "<td>".$image[0][0]."</td>";//"<td><img src='".$image[0][1]."'alt='No_Image'>"."</td>";
                    else
                        echo "<td><img src='"."ArtistImg.jpg"."'alt='No_Image'/>"."</td>";                   
                    // ArtistName                    
                    $artist = getArtistName($rows[$i][$k]);
                    echo "<td>".$artist[0][2]."</td>";
                    //Genre and Year
                    $genreYear = getGenresYears($rows[$i][$k]);
                    if($genreYear=="N/A"){
                        echo  "<td>"."N/A"."</td>"."<td>"."N/A"."</td>";
                    }
                    else{
                        if(strlen(trim($genreYear[0][1]))==0) echo "<td>"."N/A"."</td>";
                        else{
                            echo "<td>".$genreYear[0][1]."</td>";
                        }
                        if(strlen(trim($genreYear[0][2])==0))echo "<td>"."N/A"."</td>";
                        else{
                            echo "<td>".$genreYear[0][2]."</td>";
                        }
                    
                    }
                    
                    //Details
                    echo "<td><a href='".$artist[0][1]."'target ='_blank'>Details</a></td>";
                }
                echo "</tr>";
            }
            echo "</table>";
        }
    }
?>
<?php
// ALBUM METHODS
?>
<?php
//BUILDING ALBUM TABLE
    function buildAlbumTable($rows){
        if($rows == "NoMatchFound"){
                echo "<br><h2>Query Failed! No Match Found, Please Try Again!</h2>";
            }
        else{
            $count = 5;
            if(count($rows)<$count)
                $count = count($rows);
            echo "<table border = '1' align='center'>";
            echo "<tr><th>Image</th><th>Name</th><th>Artist</th><th>Genre(s)</th><th>Year(s)</th><th>Details</th></tr>";
            for($i=0;$i<$count;$i++){
                echo "<tr>";
                for($k=0;$k<1;$k++){
                    //Image                    
                    $image = getImage($rows[$i][$k]);
                    if($image!="NoImage")
                        echo "<td>".$image[0][0]."</td>";//"<td><img src='".$image[0][1]."'alt='No_Image'>"."</td>";
                    else
                        echo "<td><img src='"."AlbumImg.jpg"."'alt='No_Image'/>"."</td>";
                    // Title
                    echo "<td>";
                    $title = getSongTitle($rows[$i][$k]);
                    $title[0][2] = str_replace("&quot;","",$title[0][2]);
                    echo $title[0][2];
                    echo "</td>";
                    // Composers
                    echo "<td>";
                    $regex = '/<div class="artist".*?>([\s\S\n]*?[\s\S]*?)<\/div>/';
                    $composers=getComposers($rows[$i][$k],$regex);
                    if($composers == "N/A")
                        echo "N/A";
                    else if(preg_match_all('/([\s\S]*)/',$composers,$testify,PREG_SET_ORDER)) echo $composers;
                    else{
                        echo $composers[0][2];
                        for($performCount = 1; $performCount<count($composers);$performCount++){
                            
                            echo " / ".$composers
                            [$performCount][2];                            
                        }
                    }
                    echo "</td>";
                    //Genre and Year
                    $genreYear = getGenresYears($rows[$i][$k]);
                    if($genreYear=="N/A"){
                        echo  "<td>"."N/A"."</td>"."<td>"."N/A"."</td>";
                    }
                    else{
                        if(strlen(trim($genreYear[0][2]))==0) echo "<td>"."N/A"."</td>";
                        else{
                            echo "<td>".$genreYear[0][2]."</td>";
                        }
                        if(strlen(trim($genreYear[0][1])==0))echo "<td>"."N/A"."</td>";
                        else{
                            echo "<td>".$genreYear[0][1]."</td>";
                        }
                    
                    }
                    //Details
                    echo "<td><a href='".$title[0][1]."'target ='_blank'> Details </a>";
                    
                    
                }
            echo "</tr>";
            }
            echo "</table>";
        }     
    }
?>
<?php
    // FUNCTION TO START PROCESS --
    function begin(){
        $prefix = 'http://www.allmusic.com/search/';
        $query = $_POST["musicQuery"];
        $queryType = $_POST["musicType"];
        $queryValue = urlencode($query);
        $url = $prefix.$queryType;
        $url = $url."/".$queryValue;
        //echo $url."<br>";
        $contents = file_get_contents($url);
        echo "<h2><i>&quot;".$query."&quot;"." of type "."&quot;".$queryType."&quot;</i></h2><br>";
        $rows = getTableRow($contents);
        if($queryType == "songs")
            buildSongTable($rows);
        if($queryType == "albums")
            buildAlbumTable($rows);
        if($queryType == "artists")
            buildArtistTable($rows);
        
        
    }

?>
<?php
// MAIN
    begin();
?>
</body> 
</html>
