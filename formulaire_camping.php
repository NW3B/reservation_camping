<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <link rel="stylesheet" href="style.css" media="screen" type="text/css" />
</head>
<body>  
            <div id="container">
            <span id="titre">
            <h1>Réservation</h1>
            <h1> Camping les flots bleus</h1>
            </span>
            <br>
            <!-- zone de connexion -->
    <form action="traitement.php" method="POST" id="formReserv">
      <fieldset>

        <ul>
            <li><label for="nom">Nom : </label>  <input name="nom" type="text" id="nom" required  /> <br /><br /></li>
            <li><label for="prenom">Prénom : </label><input type="text" name="prenom" id="prenom" required  /><br /><br /></li>
            <li><label for="date_naissance">Date de Naissance : </label><input type="date" name="date_naissance" required id="date_naissance" /><br /><br /></li>
            <li><label for="adresse">Adresse : </label><input type="text" name="adresse" required id="adresse" /><br /><br /></li>
            <li><label for="code_postal">Code Postal : </label><input type="text" name="code_postal" required id="code_postal" /><br /><br /></li>
            <li><label for="ville">Ville : </label><input type="text" name="ville" required id="ville" /><br /><br /></li>
            <li><label for="telephone">Téléphone : </label><input type="text" name="telephone" id="telephone" required /><br /><br /></li>
            <li><label for="pays">Pays : </label><input type="text" name="pays" id="pays" required /><br /><br /></li>
            <li><label for="email">Email : </label><input type="email" name="email" id="email" /><br /><br /></li>
            <li> <label for="immatriculation">Immatriculation Voiture : </label><input type="text" name="immatriculation" id="immatriculation" required /><br /><br /></li>
        </ul>
        </fieldset>
      <br>
      <fieldset>
        <label for="date_arrivee">Date d'arrivé : </label><input type="date" name="date_arrivee" id="date_arrivee" /><br /><br />
        <label for="date_depart">Date de départ : </label><input type="date" name="date_depart" id="date_depart" /><br /><br />

        <p>Sélectionner votre formule:</p>

        <p>
          <input type="radio" id="tente" name="id_location" value="1">
          <label for="tente">Emplacement tente</label>
        </p>
        <p>
          <input type="radio" id="camping_car" name="id_location" value="2">
          <label for="camping_car">Emplacement Camping Car (eau + éléctricité)</label>
        </p>
        <p>
          <input type="radio" id="caravane" name="id_location" value="3">
          <label for="caravane">Caravane équipée</label>
        </p>
        <p>
          <input type="radio" id="mobilhome" name="id_location" value="4">
          <label for="mobilhome">Mobil Home</label>
        </p>
 </fieldset>
        <br><br>
        
        <input type="submit" id='submit' value='RESERVER' >
          
          <?php
          if(isset($_GET['erreur'])){
              $err = $_GET['erreur'];
              if($err==1 || $err==2)
                  echo "<p style='color:red'>Durée 7 jours minimum pour les mobilhomes et caravanes</p>";
          }
          ?>
            </form>
        </div>
	 
	</div>
	</body>
    </html>
    







