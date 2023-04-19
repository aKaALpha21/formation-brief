-- les requetes sql --

-- 1 fficher les sessions de formation à venir qui se chevauchent pas avec une session donnée 
        --$datedebut = "2023-05-01";  
        --$datefin = "2023-05-15";

        --  sql= "SELECT * FROM session WHERE date_fin < $datedebut OR date_debut > $datefin";

--2 Afficher les sessions de formation à venir avec des places encore disponibles

        --  sql= "SELECT * FROM session WHERE etat = 'en cours d'inscription'";



--3 Afficher le nombre des inscrits par session de formation
        --      $id_session = 3;
        --      sql = "SELECT count(*) From inscriptions where  id_session = $id_session";

--4  Afficher l'historique des sessions de formation d'un apprenant donné

    --$id_appr3 = 3;
       --       $sql = "SELECT formations.titre, sessions.date_debut, sessions.date_fin
        --      FROM inscriptions
        --      JOIN sessions ON inscriptions.id_session = sessions.id_session
        --      JOIN formations ON sessions.id_formation = formations.id_formation
        --      WHERE inscriptions.id_appr = $id_appr
        --      AND sessions.date_fin < CURDATE()"


--5   Afficher la liste des sessions qui sont affectées à un formateur donné, triées par date de début

    --          $id_formateur = 44;

    --         $sql =  " SELECT id_session, date_debut, date_fin, etat, places, id_formation
    --         FROM sessions
    --         WHERE id_formateur = $id_formateur
    --         ORDER BY date_debut";



--6   Afficher la liste des apprenants d'une session donnée d'un formateur donné

        --$id_formateur = 44;

        --       $sql =" SELECT a.id_appr, a.nom_appr, a.prenom_appr
        --          FROM apprenants a
        --           JOIN inscriptions i ON a.id_appr = i.id_appr
        --           WHERE i.id_session IN (
        --           SELECT s.id_session
        --           FROM sessions s
        --           WHERE s.id_formateur = $id_formateur
        --          )";





--7   Afficher l'historique des sessions de formation d'un formateur donné

        --      $id_formateur = 44;
        --       $sql =  "SELECT * 
        --         FROM session_formation
        --         WHERE id_formateur = $id_formateur AND date_fin < CURDATE()
        --         ORDER BY date_debut DESC";



--8   Afficher les formateurs qui sont disponibles entre 2 dates


    --   $date1 = 2022-07-12 
    --   $date2 = 2022-09-01

    --      $sql  = "
    --             SELECT f.id_formateur, f.nom, f.prenom
    --             FROM formateurs f
    --             WHERE NOT EXISTS (
    --                 SELECT * FROM sessions s
    --                 WHERE s.id_formateur = f.id_formateur
    --                 AND s.date_debut <= $date1
    --                 AND s.date_fin >= $date2
    --             )";

--9   Afficher toutes les sessions d'une formation donnée
    --   $id_formation = 3
    --   $sql = " SELECT * from session WHERE id_formation = $id_formation ";


-- 10   Afficher le nombre total des sessions par cétegorie de formation
   
--     $category = "english"
   
--      $sql =  "SELECT COUNT(*) AS total_sessions
--             FROM sessions
--             INNER JOIN formations ON sessions.id_formation = formations.id_formation
--             WHERE formations.categorie = $category"



-- 11  Afficher le nombre total des inscrits par catégorie formation


--      $category = "english"
--      $sql =  "SELECT SUM(i.nb_inscrits) as total_inscrits
--             FROM sessions s
--             JOIN formations f ON s.id_formation = f.id_formation
--             JOIN inscriptions i ON s.id_session = i.id_session
--             WHERE f.categorie = $category"






