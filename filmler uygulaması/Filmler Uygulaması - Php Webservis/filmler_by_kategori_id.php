<?php
    
    /*
     * Following code will delete a product from table
     * A product is identified by product id (pid)
     */
    
    // array for JSON response
    $response = array();
    
    // check for required fields
    if (isset($_POST['kategori_id'])) {
        $kategori_id = $_POST['kategori_id'];
        
        //DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE değişkenleri alınır.
        require_once __DIR__ . '/db_config.php';
        
        // Bağlantı oluşturuluyor.
        $baglanti = mysqli_connect(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
        
        // Bağlanti kontrolü yapılır.
        if (!$baglanti) {
            die("Hatalı bağlantı : " . mysqli_connect_error());
        }
        
        $sqlsorgu = "SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = kategoriler.kategori_id and kategoriler.kategori_id=$kategori_id";
        $result = mysqli_query($baglanti, $sqlsorgu);
        
        // check for empty result
        if (mysqli_num_rows($result) > 0) {
            // looping through all results
            // products node
            $response["filmler"] = array();
            
            while ($row = mysqli_fetch_assoc($result)) {
                
                $kategoriler = array();
                $kategoriler["kategori_id"] = $row["kategori_id"];
                $kategoriler["kategori_ad"] = $row["kategori_ad"];
                
                $yonetmenler = array();
                $yonetmenler["yonetmen_id"] = $row["yonetmen_id"];
                $yonetmenler["yonetmen_ad"] = $row["yonetmen_ad"];
                
                $filmler = array();
                $filmler["film_id"] = $row["film_id"];
                $filmler["film_ad"] = $row["film_ad"];
                $filmler["film_yil"] = $row["film_yil"];
                $filmler["film_resim"] = $row["film_resim"];
                $filmler["kategori"] = $kategoriler;
                $filmler["yonetmen"] = $yonetmenler;
                
                // push single product into final response array
                array_push($response["filmler"], $filmler);
            }
            // success
            $response["success"] = 1;
            
            // echoing JSON response
            echo json_encode($response);
            
        }
        
        //bağlantı koparılır.
        mysqli_close($baglanti);
        
    } else {
        // required field is missing
        $response["success"] = 0;
        $response["message"] = "Required field(s) is missing";
        
        // echoing JSON response
        echo json_encode($response);
    }
    ?>
