<?php
ob_start();
?>

<br>
<h2>Modification de l'agent</h2>

<div class="d-flex justify-content-center" >
    <form action="" method="POST" id="formSpy" class="form d-flex flex-column">
        <?php if(isset($error)) : ?>
            <span class="mb-3 error-msg"><?= $error ?></span>
        <?php endif ?>
        <div class="my-3">
            <p id="errorFirstname" class="mb-3 error-msg"></p>
            <label for="firstname" class="form-label">Prénom</label>
            <input type="text" class="form-control" id="firstname" name="firstname" value="<?= $_POST['firstname'] ?? $spy->getFirstname(); ?>" minlength="2" maxlength="50" required>
        </div>

        <div class="my-3">
        <p id="errorLastname" class="mb-3 error-msg"></p>
            <label for="lastname" class="form-label">Nom</label>
            <input type="text" class="form-control"  id="lastname" name="lastname" value="<?= $_POST['lastname'] ?? $spy->getLastname(); ?>" minlength="2" maxlength="50" required>
        </div>

        <div class="my-3">
        <p id="errorCodeName" class="mb-3 error-msg"></p>
            <label for="codeName" class="form-label">Nom de code</label>
            <input type="text" class="form-control" id="codeName" name="codeName" value="<?= $_POST['codeName'] ?? $spy->getCodeName(); ?>"" minlength="2" maxlength="50" required>
        </div>

        <div class="my-3">
            <label for="birthdate" class="form-label">Date de naissance</label>
            <input type="date" id="birthdate" name="birthdate" value="<?= $_POST['birthdate'] ?? $spy->getBirthdate(); ?>" class="form-control" required>
        </div>

        <div class="my-3">
             <label for="codeCountry" class="form-label">Nationalité</label>
            <select id="codeCountry" class="form-select" name="codeCountry" required>
            <?php foreach($countryArray as $clef => $valeur){  ?>
                <option value="<?= $clef ?>" 
                <?php if(isset($_POST['codeCountry'])){
                        if($_POST['codeCountry'] === $clef){ 
                            echo "selected"; 
                        }
                    } else {
                        if($spy->getCodeCountry() === $clef){ 
                            echo "selected"; 
                        }
                    } ?>
                ><?= $valeur ?></option>
                <?php } ?>
            </select>
        </div>

        <div class="my-3">
            <p class="form-label">Spécialité(s)</p>
            <div class="form-check">
            <?php for($i=0; $i < count($specialities); $i++){ ?>
                <?php if(isset($_POST['optionSpeciality'])){ ?>
                    <input class="my-2" type="checkbox" 
                    id="<?= "speciality" . $specialities[$i]->getName(); ?>"
                    name="optionSpeciality[]" 
                    value="<?= $specialities[$i]->getId(); ?>" 
                        <?php if(in_array($specialities[$i]->getId(), $_POST['optionSpeciality'])){ 
                            echo "checked"; 
                        } else { 
                            echo " ";
                        }?>
                    >
                    <label for="<?= "speciality" . $specialities[$i]->getName(); ?>">
                    <?= $specialities[$i]->getName();?>
                    </label>
                    <br>
                <?php }  else {?> 
                    <input class="my-2" type="checkbox" 
                    id="<?= "speciality" . $specialities[$i]->getName(); ?>" 
                    name="optionSpeciality[]" 
                    value="<?= $specialities[$i]->getId(); ?>"
                        <?php if(in_array($specialities[$i]->getId(), $specialitiesIdBySpy)){ 
                            echo "checked";
                        } else { 
                            echo " ";
                        }?>
                    >
                    <label for="<?= "speciality" . $specialities[$i]->getName(); ?>">
                    <?= $specialities[$i]->getName();?>
                    </label>
                    <br>   
                <?php } ?>  
            <?php } ?>
            </div>
        </div>
        <button type="submit" class="btn btn-info btn-lg align-self-center">Valider</Button>
    </form>
</div>

<div class="d-flex flex-column align-items-start">
    <a class="btn btn-info " href="<?= URL ?>spies/list/<?= $spy->getId(); ?>">Retour à l'agent</a>
    <br>
    <a class="btn btn-info" href="<?= URL ?>spies">Retour aux agents</a>
</div>

<?php
$content = ob_get_clean();

$preContent = "";
$titleHead = "Modification agent";
$src = URL . "script.js";

require "views/common/template.php";