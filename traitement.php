<?php

try
{
    $db = new PDO('mysql:host=localhost:3306;dbname=camping', 'root', 'root');
}
catch (Exception $e)
{
    die('Erreur : ' . $e->getMessage());
}

$error = "ERREUR, champ(s) vide(s)";


 if (empty ($_POST['nom']) || empty ($_POST['prenom']) || empty ($_POST['date_naissance']) || empty ($_POST['adresse']) 
|| empty ($_POST['code_postal']) || empty ($_POST['ville']) || empty ($_POST['telephone'])
|| empty ($_POST['pays']) || empty ($_POST['email']) || empty ($_POST['immatriculation'])  )
{
    echo($error);
}
 else{

    $id_client= 0;
    $nom = $_POST['nom']; 
    $prenom = $_POST['prenom'];
    $date_naissance = $_POST['date_naissance'];
    $adresse = $_POST['adresse'];
    $code_postal = $_POST['code_postal'];
    $ville = $_POST['ville'];   
    $telephone = $_POST['telephone'];
    $pays = $_POST['pays'];  
    $email = $_POST['email'];    
    $immatriculation = $_POST['immatriculation'];
    $arrivee =$_POST['date_arrivee'];
    $depart = $_POST['date_depart'];
    $id_location = $_POST ['id_location'];
    $i = 0;
    $emplacement_libre = 0;
    $tarif_jour = 0.00;
    $prix = 0.00;
    //--- Calcul nombre de jour
    $date1 = strtotime($arrivee);
    $date2 = strtotime($depart);
    $difference = $date2 - $date1;
    // On sait que 1 heure = 60 secondes * 60 minutes et que 1 jour = 24 heures donc :
    $nbJours = $difference/86400; // 86 400 = 60*60*24

    //---contrainte : caravanes et mobilhome minimum 7 jours
    if($id_location == 3 or $id_location == 4){
        if ($nbJours < 7){
            //echo("Les Campings cars et Mobil-home sont louable pour une durée minimum de 1 semaine");
            header('Location: formulaire_camping.php?erreur=1');
            return;
        }

    }

    //Vérification si client existe déja
    $query=$db->prepare('SELECT COUNT(*) AS nbr FROM client 
    WHERE Nom = :nom && Prenom = :prenom && Date_naissance = :date_naissance');

    $query->bindValue(':nom',$nom, PDO::PARAM_STR);
    $query->bindValue(':prenom',$prenom, PDO::PARAM_STR);
    $query->bindValue(':date_naissance',$date_naissance, PDO::PARAM_STR);

    $query->execute();

    $client_free=($query->fetchColumn()== 0)?1:0;
   

    if(!$client_free)
    {
        echo ("Votre compte client est déjà utilisé par un membre");
        echo("<br>");
       //Vérification si client existe déja
        $query=$db->prepare('SELECT Id_client FROM client 
        WHERE Nom = :nom && Prenom = :prenom && Date_naissance = :date_naissance');

        $query->bindValue(':nom',$nom, PDO::PARAM_STR);
        $query->bindValue(':prenom',$prenom, PDO::PARAM_STR);
        $query->bindValue(':date_naissance',$date_naissance, PDO::PARAM_STR);
        $query->execute();
        
        $id_client = $query->fetchColumn();
    }
    
    else{

    //---Ajout Client 
    $query=$db->prepare('INSERT INTO client (Nom, Prenom, Date_naissance, Adresse,            
    Code_postal, Ville, Telephone, Email, Pays, Immatriculation)
    VALUES (:nom, :prenom, :date_naissance, :adresse,            
    :code_postal, :ville, :telephone, :email , :pays, :immatriculation)');

    //--- Envoi des données dans table 'membres'
    $query->bindValue(':nom', $nom, PDO::PARAM_STR);
    $query->bindValue(':prenom', $prenom, PDO::PARAM_STR);   
    $query->bindValue(':date_naissance', $date_naissance, PDO::PARAM_STR);
    $query->bindValue(':adresse', $adresse, PDO::PARAM_STR);
    $query->bindValue(':code_postal', $code_postal, PDO::PARAM_INT);
    $query->bindValue(':ville', $ville, PDO::PARAM_STR);
    $query->bindValue(':telephone', $telephone, PDO::PARAM_INT);
    $query->bindValue(':email', $email, PDO::PARAM_STR);
    $query->bindValue(':pays', $pays, PDO::PARAM_STR);
    $query->bindValue(':immatriculation', $immatriculation, PDO::PARAM_STR);

    $query->execute();
    $id_client = $db->lastInsertId();
    echo("Client ajouté");
    echo("<br>");
    }


/*--- non dispo
$arrivee = ("2020-07-25"); 
$depart = ("2020-07-28");
// --- dispo (arriver et depart le même jour possible)
$arrivee = ("2020-07-25"); 
$depart = ("2020-07-27");
*/

    //--- Verif DATE RESERVATION  
    $query=$db->prepare('SELECT Arrivee, Depart, l.Nombre_emplacement, l.Tarif_jour from sejour s
    join location l on s.Id_location = l.Id_location
    where s.Id_location = :id_location and Depart > :arrivee  order by Arrivee');
    
    $query->bindValue(':id_location', $id_location, PDO::PARAM_INT);
    $query->bindValue(':arrivee', $arrivee, PDO::PARAM_STR);
        
    $query->execute();

    $sejour = $query;

    $disponible = false;


    // On vérifie si on a au moins une réservation
    if($sejour->rowCount() > 0){

        
        // On initialise un tableau associatif
        $tableauSejour = [];
        $tableauSejour['date'] = [];
        $z=0;
        $reserver = 0;
        // On parcourt les réservations
        while($row = $sejour->fetch(PDO::FETCH_ASSOC)){
            extract($row);
            $nombre_emplacement = $row['Nombre_emplacement'];
            $tarif_jour = $row['Tarif_jour'];
 
            $date_sejour = [
                "Arrivee" => $row['Arrivee'],
                "Depart" => $row['Depart']
            ];
            $z++;

            $tableauSejour['date'][] = $date_sejour;
        }
        echo("test = " .$tarif_jour);

        $occuper = 0;
        for ($i=0; $i<$z ; $i++){

            if( $arrivee <= $tableauSejour['date'][$i]['Depart'] and 
            $depart <= $tableauSejour['date'][$i]['Arrivee'] /*and
            $arrivee < $tableauSejour['date'][$i]['Arrivee'] and
            $depart < $tableauSejour['date'][$i]['Arrivee']*/ )
            {
                echo ("dispo");
                echo("<br>");
            }
            else{
                echo("non dispo");
                echo("<br>"); 
                $occuper ++;
            }
        }
        //si non dispo alors regarder nombre emplacement libre
        if ($occuper >= $nombre_emplacement){
            echo ("Désolé, date non disponible");
            echo("<br>");
        }
        else{
            $disponible = true;    
        }
        //var_dump($tableauSejour);
        echo("<br>");

    }else{
        //---si vide ,recup id location
        $query=$db->prepare('SELECT Tarif_jour FROM `location` 
        WHERE Id_location = :id_location');

        $query->bindValue(':id_location',$id_location, PDO::PARAM_INT);
        $query->execute();
        
        $tarif_jour = $query->fetch();

        $disponible = true;
    }

    if ($disponible){

        // --- calcul prix pour paiement
        $prix = $nbJours * $tarif_jour;
        echo("<br>");
        echo ("€jour" .$tarif_jour);
        echo("<br>");
        echo ("nbjour" .$nbJours);
        echo("<br>");
        echo ("prix = " .$prix);
        echo("<br>");
       //--calcul remise
       echo("idlocalation" .$id_location);
       echo("<br>");
       if ($id_location == 1 or $id_location == 2){

            if ($nbJours >= 7 and $nbJours < 14) {
                $prix -= ($prix / 100) *10;
                echo ("ristourne" .$prix);
                echo("<br>");
            }
            else if ( $nbJours >= 14 ){
                $prix -= ($prix / 100) * 20;
            }
        }
        
        if ($id_location == 3 or $id_location == 4){

            if ($nbJours >= 7) {

            $nbSemaine = $nbJours/ 7;
            $prix -= ($prix /100 )* (5 * $nbSemaine);     

            }
        } 
        $prix = number_format($prix,2);
           
        //echo($tarif_jour);
        echo("<br>");

        //--- Fournir emplacement libre.
        //--- Ajout Date de sejour avec Id_client
        //--attribution numéro emplacement
        $numero_emplacement = $occuper + 1;

        $query=$db->prepare('INSERT INTO sejour (Id_client, Id_location, Arrivee, Depart)
        VALUES ( :id_client, :id_location, :arrivee, :depart)');

        $query->bindValue(':id_client', $id_client, PDO::PARAM_INT);
        $query->bindValue(':id_location', $id_location, PDO::PARAM_INT);
        $query->bindValue(':arrivee', $arrivee, PDO::PARAM_STR);
        $query->bindValue(':depart', $depart, PDO::PARAM_STR);
        $query->execute();
        
        echo("Date disponible ! <br> - Ajout du sejour -<br> Emplacement n°" .$numero_emplacement ." <br>Prix = " .$prix ." €");
        echo("<br>");
    }
        echo($occuper);
        echo("<br>");
        echo($nombre_emplacement);

}
