<!--/*-->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--*/-->
<!DOCTYPE html>
<html lang="fr" xmlns:th="http://www.thymeleaf.org">
<head th:replace="includes/header :: head('Modifier Vente par facilité')">
	<meta charset="utf-8"/>
</head>
<body>
	<div class="preloader">
        <div class="lds-ripple">
            <div class="lds-pos"></div>
            <div class="lds-pos"></div>
        </div>
    </div>
     <div id="main-wrapper">
    <!-- Main wrapper - style you can find in pages.scss -->
   	<div th:replace="includes/header :: header"></div>
    <div th:replace="includes/header :: aside-top"></div>
    <div class="page-wrapper">
    
    <!-- debut de contenu -->
 <div class="container-fluid" id="modifier-vente-container" th:fragment="modifier-ventes-facilite" style="display: none;">
 	 <div class="row" >
                    <div class="col-12">
                    	<form id="nouvelle-vente" >
                        <div class="card">
                            <div class="card-body">
                            	<div class="float-right">
                            		<a class="btn btn-primary waves-effect text-white" type="button" id="imprimer" onclick="imprimer()"  > Imprimer</a>
                            		<button  sec:authorize="hasRole('ROLE_Confirmation des ventes par facilité')" class="btn btn-primary waves-effect" type="button" id="valider" onclick="confirmeValiderVente()">Confirmer</button>
                            		<a  class="btn btn-info waves-effect text-white" type="button" id="calendrie" onclick="calendrie()" >Calendrie</a>
                            		<button  sec:authorize="hasRole('ROLE_Creation des ventes par facilité')" class="btn btn-danger waves-effect" type="button" id="mettre-brouillon" onclick="confirmeRemettreBrouillon()">Remettre en brouillon</button>
                            		<button  sec:authorize="hasRole('ROLE_Creation des ventes par facilité')" class="btn btn-danger waves-effect" type="button" id="modifier" onclick="activeModifier()">Modifier</button>
                            		<button   sec:authorize="hasRole('ROLE_Creation des ventes par facilité')" class="btn btn-primary waves-effect" id="sauvguarder" type="submit">Sauvguarder</button>            
                            		<button   sec:authorize="hasRole('ROLE_Modification des ventes par facilité')" class="btn btn-danger waves-effect" type="button" id="annuler" onclick="annulerVenteBrouillon()">Annuler</button>
                            		<a  sec:authorize="hasRole('ROLE_Creation des ventes par facilité')" class="btn btn-secondary waves-effect" id="retour" href="/ventes_facilte">Retour </a>
                                </div>
                                <h3 class="card-title" > </h3>
                           		<h3  class="card-title" th:text="Annulée"> </h3>
                           		<div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="form-group">
                                                <label for="inputlname" class="control-label col-form-label">Client:</label>
                                                <select class="select2-client form-control" style="width: 100%;height: 36px;"></select>
                                               </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="form-group">
                                                <label for="inputname" class="control-label col-form-label">Entrepôt:</label>
                                             	<select class="form-control" id="entrepot" style="height: 100%;" >
		                                                
		                                         </select>
                                            </div>
                                            
                                        </div>
                                 </div>    	
                                <div class="row">
                                	<div class="col-sm-12 col-md-6">
	                                	<div class="form-group">
	                                    	<label for="inputname" class="control-label col-form-label">Compte:</label>
	                                          	<select  class="form-control" id="entrepotAAA" style="height: 100%;" >
			                       	            	
			                                    </select>
	                                   	</div>
                                   	</div>
                                   	<div class="col-sm-12 col-md-6 mt-2">
	                                 	<div class="form-group mt-4">
	                                 		<div class="custom-control custom-radio">
				                            	<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" checked>
				                                <label class="custom-control-label" for="customRadio1">Prélèvements automatique</label>
				                	          </div>
				                                <div class="custom-control custom-radio">
				                                    <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" >
				                                    <label class="custom-control-label" for="customRadio2">Paiement espece</label>
				                                </div>
	                                   	</div> 	
                                   	</div>
                                </div>
                            </div>
                        </div>
                        <div class="card" id="client-info">
                            <div class="pt-3">
                                 <div class="row">
                                	<div class="col-md-6">
                                    	<div class="form-group row">
                                        	<label class="control-label text-right col-md-3">CCP/Cle:</label>
                                            <span class="form-control-static col-md-9" id="ccp-cle" ></span>
                                         </div>
                                    </div>
                                    <div class="col-md-6">
                                    	<div class="form-group row">
                                        	<label class="control-label text-right col-md-3">Solde:</label>
                                            <span id="soldeParEntrepot" class="form-control-static col-md-9"    >  </span>
                                        </div>
                                     </div>
                                 </div>     	
                            </div>
                        </div>    
                        <div class="card">
                            <div class="card-body">
                            <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                            <div class="form-group">
                                                <label for="inputname" class="control-label col-form-label">Article:</label>
                                            	<select class="select2-produit form-control" style="width: 100%;height: 36px;"></select> 
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-6">
                                            <div class="form-group">
                                                <label for="inputlname" class="control-label col-form-label">Offre:</label>
                                                <select class="form-control" id="echeances" style="width: 100%; height: 36px;" ></select>
                                               </div>
                                        </div>
                              </div>
                              <div class="row">
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-group">
                                                <label for="inputname" class="control-label col-form-label">Quantite conditionnée:</label>
                                                <input type="number" class="form-control"  id="qntConditionnee"  step="1">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-group">
                                                <label for="inputlname" class="control-label col-form-label">Quantite vrac:</label>
                                                 <input type="number" class="form-control" id="qntVrac" step="1">
                                               </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-group">
                                                <label for="inputname" class="control-label col-form-label">Remise %</label>
                                                 <input type="number" class="form-control" id="remise" value="0"  step="0.1">
                                            </div>
                                        </div>
                                        <div class="col-sm-12 col-md-3">
                                            <div class="form-group">
                                                <label for="inputlname" class="control-label col-form-label">Ajouter au panier:</label>
                                                <button id="addRow" class="btn btn-primary mb-2 col-md-12 "><i class="fas fa-plus"></i>&nbsp; Ajouter</button>
                                               </div>
                                        </div>
                              </div>      	
                            <div class="table-responsive">
                            		<!--<button onclick="lignesVente()" > get val  </button>-->
                                    <table id="t_add_row" class="table table-striped table-bordered display" style="width:100%">
                                        <thead>
                                            <tr>
                                            	<th>id ligne vente(hidden)</th>
                                            	<th>id produit(hidden)</th>
                                                <th style="width:20%">Article</th>
                                                <th>Quantité conditionnee</th>
                                                <th>Quantité vrac</th>
                                                <th>Prix Unitaire</th>
                                                <th>Apport</th>
                                                <th>Montant à prelever</th>
                                                <th>Remise %</th>
                                                <th>Sous Total</th>
                                                <th style="width:3%" ></th>
                                            </tr>
                                        </thead>
                                        </table>
                               </div>
                               <div class="row">
	                               <div class="col-md-4 my-2">
		                               	<div class="col-md-8">
		                                    <div class="form-group row">
		                                        <label class="control-label col-md-10">Date Vente:</label>
		                                        <input type="text" class="form-control" id="dateVente" data-lang="fr" data-large-mode="true" data-default-date="01-01-2019" data-max-year="2050"  data-format="d-m-Y" data-large-default="true" >
		                                    </div>
		                                </div>
		                               	<div class="col-md-8">
		                                    <div class="form-group row">
		                                        <label class="control-label col-md-10">Date début:</label>
		                                        <input type="text" class="form-control" id="dateD" data-lang="fr" data-large-mode="true" data-default-date="" data-max-year="2050"  data-format="d-m-Y" data-large-default="true" >
		                                    </div>
		                                </div>
		                                <div class="col-md-8">
		                                    <div class="form-group row">
		                                        <label class="control-label col-md-10">Date fin:</label>
		                                        <input type="text" class="form-control"  id="dateF" disabled="disabled" >
		                                    </div>
		                                </div>
	                               </div>
	                               <div class="col-md-4 my-2">
		                               <div class="col-md-12">
	                                    	<div class="form-group row">
	                                        	<label class="control-label text-right col-8 col-md-9">Nombre d'échéances:</label>
	                                            <span class="form-control-static col-4 col-md-3"  > <span id="nombreEchanceT" >0</span>  Mois</span>
	                                         </div>
	                                    </div>
	                            		<div class="col-md-12">
	                                    	<div class="form-group row">
	                                        	<label class="control-label text-right col-8 col-md-9">Montant d'échéance:</label>
	                                            <span class="form-control-static col-4 col-md-3"  > <span id="montantEchanceT">0.00 </span> DZ</span>
	                                         </div>
	                                    </div>	
	                               </div>
	                               
	                               <div class="col-md-4">
	                                    <div class="col-md-12">
	                                    	<div class="form-group row">
	                                        	<label class="control-label text-right col-7 mt-2">Apport initial:</label>
	                                            <input type="number" class="form-control col-5" id="apportT" onchange="majTotalByApport()" value="0.00"  step="0.1">
	                                            
	                                         </div>
	                                    </div>
	                                    <div class="col-md-12">
	                                    	<div class="form-group row">
	                                        	<label class="control-label text-right col-7 ">Total remise:</label>
	                                            <span class="form-control-static col-5"  > <span id="remiseT">0.00 </span> DZ</span>
	                                         </div>
	                                    </div>
	                                    <div class="col-md-12">
	                                    	<div class="form-group row">
	                                        	<label class="control-label text-right col-7">Montant total:</label>
	                                            <span class="form-control-static col-5"  > <span id="montantTotalT"> 0.00 </span> DZ</span>
	                                         </div>
	                                    </div>
	                                </div>
                                </div>
                            </div>
                        </div>    
                        </form>
                        <div sec:authorize="hasRole('ROLE_Utilisation outil de simulation')"  class="card">
                            <div class="card-body">
                            	<h3 class="card-title">Simulation la capacité de client</h3>
                                	<div class="col-md-8 my-2">
		                            	<div class="col-md-6">
	                                    	<div class="form-group">
	                                        	<button onclick="simulation()" class="btn btn-primary mb-2 "><i class="fa fa-check"></i>&nbsp; Vérifier</button>
                                            </div>
	                                  	</div>
	                            		<div class="col-md-12">
	                            			<div id="condition">
	                            				<div class="row">
		                            				<div class="col-sm-12 col-md-4">
			                                            <div class="form-group">
			                                                <label for="inputname" class="control-label col-form-label">Salaire client:</label>
			                                                <input type="number" class="form-control" onchange="calculeSimulation()"  id="salaire" value="0" step="0.01">
			                                            </div>
			                                        </div>
			                                        <div class="col-sm-12 col-md-4">
			                                            <div class="form-group">
			                                                <label for="inputname" class="control-label col-form-label">Autres soldes:</label>
			                                                <input type="number" class="form-control" onchange="calculeSimulation()"  id="autreSolde" value="0" step="0.01">
			                                            </div>
			                                        </div>
			                            			<div class="col-sm-12 col-md-4">
			                                            <div class="form-group">
			                                                <label for="inputname" class="control-label col-form-label">Ration sur salaire%:</label>
			                                                <input type="number" class="form-control" onchange="calculeSimulation()" id="rationSalaire" value="35" step="0.01">
			                                            </div>
			                                        </div>
		                                        </div>
		                                    	<div  class="form-group" >
		                                        	<ul class="list-style-none mx-2 px-3" id="verification-list">
		                                        		<li><a href="javascript:void(0)" id="remarque" 	class="text-info"><i class="fas fa-check"></i> Observations: <span class="text-right" id="observation" ></span> </a></li>
				                                        <li><a href="javascript:void(0)" class="text-info"><i class="fa fa-check"></i>  Nombre des alertes: <span class="text-right" id="nbrAlerte" ></span> </a></li>
				                                   		<li><a href="javascript:void(0)" id="capacite" class="text-info"></a></li>
				                                   		<li><a href="javascript:void(0)" id="decision" class="text-info"></a></li>
				                                   	</ul>
		                                        </div>
		                                	</div>        
	                                    </div>	
	                               </div>
                            </div>
                        </div>  
                    </div>
                </div>
   <script th:inline="javascript">
    
 		var entreprise,vente,solde;
        function setEntreprise(ent){
        	this.entreprise = ent;
        	console.log(entreprise)
            }
        function setvente(vente){
        	vente = vente;
            }
        function setsolde(solde){
        	solde = solde;
            }
        function startingModifierProduit(i){
    	$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            type: "POST",
            url: "/modifier-venteF-test?code="+i,
            dataType: 'json',
            timeout: 600000,
            data:  1,
            success: function (response) {
                console.log(response)
                initVente(response.vente);
                saveEvent(response.vente)
                dateFinEvent(response.vente);
                $("#sauvguarder,#annuler,#calendrie,#modifier,#valider,#mettre-brouillon,#retour").hide();
                if(response.vente["etat"]=="Brouillon"){
        			//verifierDisponibiliteOnStart()
        			$("#valider,#modifier,#annuler").show();
        		}
    	   	    $("#liste-ventesf-container").hide(350);
    	   		$("#modifier-vente-container").show(350);
            },
            error: function (e) {
            	alert(e.responseText)
            }
        });
     }
    
   
    var currClientId = null;
    var currSalaireMensuel = null;
    var currentProduit={};
    var currentOffre=null;
    var t = $('#t_add_row').DataTable({
    	"paging": false,
        select: false,
        searching : false,
        columns:[ 
        	{ "visible": false },
            { "visible": false },
    	    { "visible": true },
    	    { "visible": true },
    	    { "visible": true },
    	    { "visible": true },
    	    { "visible": true },
    	    { "visible": true },
    	    { "visible": true },
    	    { "visible": true },
    	    { "visible": true }
    	   ],
    	   language : {
   	        "emptyTable": "aucun article dans le panier",
   	        "infoEmpty":      "Affiche 0 à 0 sur 0 donnée",
   	        "info":           "Affiche _START_ à _END_ sur _TOTAL_ données"
   	      }
        });
	
    
    function activeModifier(){
    	$("select,input,i" ).prop( "disabled", false );
    	$("#modifier,#annuler,#imprimer,#valider").hide();
    	$("#sauvguarder,#retour").show();
        $("#solde" ).prop( "disabled", true );
        $("#addRow,i.delete" ).prop( "disabled", false );
        //$("#dateF" ).prop( "disabled", true );
        
    }
	

    function chancesByProduit(){
        var produit = {};
        produit['idProduit'] = $('.select2-produit').val();
    	$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            type: "POST",
            url: "/echancesProduit",
            dataType: 'json',
            timeout: 600000,
            data:  JSON.stringify(produit),
            success: function (offres) {
            	 var liste = document.getElementById("echeances");
            	 $("#echeances").empty();
             	 for(offre in offres) {
            		 liste.options[liste.options.length] = new Option(offres[offre]['designation'],offres[offre]['id']);
            	 }
            },
            error: function (e) {
            	alert(e.responseText)
            }
        });
     }
	
    function echanceById(id){
        var offre2={};
    	$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            async:false,
            type: "POST",
            url: "/echancesById?id="+id,
            dataType: 'json',
            timeout: 600000,
            error: function (e) {
            	alert(e.responseText)
            }
        }).done(function(data){
            offre2=data;
            })
         return offre2;
     }

    function echancesByProduitByEcheance(){
        var idProduit,nbrEcheance;
        idProduit =  parseFloat($('.select2-produit option:selected').val());

         nbrEcheance = parseInt(currentOffre[0]['echeance']);
    	$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            type: "POST",
            url: "/echancesByProduitByEcheance?idProduit="+idProduit+"&nbrEcheance="+nbrEcheance,
            dataType: 'json',
            timeout: 600000,
            success: function (offres) {
            	 var liste = document.getElementById("echeances");
            	 $("#echeances").empty();
             	 for(offre in offres) {
            		 liste.options[liste.options.length] = new Option(offres[offre]['designation'],offres[offre]['id']);
            	 }
            },
            error: function (e) {
            	alert(e.responseText)
            }
        });
     }

    function lignesVente(idV){
		var row = document.getElementById("t_add_row").rows;
		var lignes = [];
		for(var i=0; i < t.rows().count() ; i++ ){
			var tLigne =t.row( i ).data()
			var ligne= {};
			
			 ligne['vente']= vente['idVente'];	
			 ligne['idLigneVente']=	tLigne[0];
			 ligne['produit'] =  {'idProduit':tLigne[1]}
			 ligne['quantiteConditionnee'] =tLigne[3];
			 ligne['quantiteVrac']=tLigne[4];
			 ligne['prixVenteUnitaire']=tLigne[5];
			 ligne['sousApportInitial']=tLigne[6];
			 ligne['sousMontantPrelever']=tLigne[7];
			 ligne['remise']=tLigne[8];
			 ligne['sousTotal']=tLigne[9];
			lignes.push(ligne);
		}
		return lignes;
	}

    function majTotal(){
		var echeanceT = 0;
		var apportT  = 0;
		var totalT  = 0;
		var remiseT = 0;
		for(var i=0; i < t.rows().count() ; i++ ){
			var tLigne =t.row( i ).data()
			echeanceT+= tLigne[7]
			apportT+=tLigne[6]
			remiseT+=  parseFloat( tLigne[8] * tLigne[5] / 100);
			totalT+=tLigne[9]
		}
		$('#nombreEchanceT').html( currentOffre[0]['echeance']);
		$('#montantEchanceT').html(echeanceT );
		$('#apportT').val( apportT);
		$('#montantTotalT').html( totalT);
		$('#remiseT').html( remiseT);
		
		 if(t.rows().count()<1){
			 $('#nombreEchanceT').html(0);
			}
		
	}
    function majTotalByApport(){
		var nombreEchanceT = currentOffre[0]['echeance'];
		var echeanceT = $('#montantEchanceT').html();
		var apportT   = nullToZero($('#apportT').val());
		var totalT    = $('#montantTotalT').html();
		var remiseT   = $('#remiseT').html();
		
		echeanceT = (totalT - remiseT- apportT ) / nombreEchanceT;
		$('#montantEchanceT').html(echeanceT.toFixed(2) );
		
		
		 if(t.rows().count()<1){
			 $('#nombreEchanceT').html(0);
			}
		
	}   
	function initVente(vente){
		$('.select2-client').empty();
		t.rows().remove().draw();
		if(vente['modePaiement']=="Paiement espece"){
			$('#customRadio1').attr('checked', false);
			$('#customRadio2').attr('checked', true);
		}
		var ccp="";
		var cle="";
		if(vente['client']['nCcp']!=null)
			{
			
			ccp=vente['client']['nCcp'];
			}
		if(vente['client']['cle']!=null)
		{
              cle=vente['client']['cle'];
			}		
		
			$('#ccp-cle').html(ccp+'/'+cle);
			
		
		$("#entrepot" ).val(vente["entrepot"]['idEntrepot']);
		 $("#soldeParEntrepot").html(solde);
		var client = {
			    id: vente['client']['idClient'],
			    text: vente['client']['nom']+' '+vente['client']['prenom']
			};
		var newOption = new Option(client.text, client.id, false, false);
		$('.select2-client').append(newOption).trigger('change');
		$('#dateVente').attr("data-default-date",moment(vente['dateVente']).format('MM-DD-YYYY'));
		$('#dateD').attr("data-default-date",moment(vente['dateDebutPrelevement']).format('MM-DD-YYYY'));
		$('#dateF').val(moment(vente['dateFinPrelevement']).format('DD-MM-YYYY'));
		var lignes = vente['ligneVentes'];
		currentOffre = [];offreOne={};offreOne['echeance']=parseInt(vente['nombreEcheances']);
		currentOffre.push(offreOne);
		$('#salaire').val(vente['client']['salaireMensuel']);
		$('#observation').html(vente['client']['observation'])
	        currClientId = vente['client']['idClient'];currSalaireMensuel=vente['client']['salaireMensuel'];
		
		var i;
		for (i = 0; i < lignes.length; i++) {
			var idy = 0;
		        t.row.add([
		        	lignes[i]['idLigneVente'],
		        	lignes[i]['produit']['idProduit'],
		        	lignes[i]['produit']['designation'],
		        	lignes[i]['quantiteConditionnee'],
		        	lignes[i]['quantiteVrac'],
		        	lignes[i]['prixVenteUnitaire'],
		        	lignes[i]['sousApportInitial'],
		        	lignes[i]['sousMontantPrelever'],
		        	lignes[i]['remise'],
		        	lignes[i]['sousTotal'] ,
		            '<i class="far fa-trash-alt delete" style="color: #f20a34;"></i>'
		        ]).node().id = 'myId'+idy;
		        t.draw(false);
		        //majTotal();
		        
		}
		$('#nombreEchanceT').html( vente['nombreEcheances']);
		$('#montantEchanceT').html(vente['montantTotalPrelever'] );
		$('#apportT').val( vente['apportTotalInitial']);
		$('#montantTotalT').html( vente['montantTotal']);
		$('#remiseT').html( vente['montantTotalRemise']);	
		modeSaved();
	}    
	
	function modeSaved(){
		$("#sauvguarder").hide();
	    $("#anuuler").hide();
	    $("#modifier,#annuler,#imprimer,#valider").show();
		$( "select,input,#addRow,i.delete" ).prop( "disabled", true );
	}
	function modeConfirmed(){
		$("#imprimer,#mettre-brouillon,#calendrie").show();
	    $("#anuuler").hide();
	    $("#sauvguarder,#annuler,#modifier,#valider").hide();
		$( "select,input,#addRow,i.delete" ).prop( "disabled", true );
	}

	function modeAnnuler(){
		$("#imprimer").show();
	    $("#anuuler").hide();
	    $("#sauvguarder,#calendrie,#annuler,#modifier,#valider").hide();
		$( "select,input,#addRow,i.delete" ).prop( "disabled", true );
	}
	function nullToZero(x){
		 if (Number.isNaN(Number.parseFloat(x))) {return 0;}else return x;
		 }
	function saveVente(){
		vente['dateVente']=			 moment($('#dateVente').val(),'DD-MM-YYYY');	
		vente['dateDebutPrelevement']= moment($('#dateD').val(),'DD-MM-YYYY');
		vente['dateFinPrelevement']=	 moment($('#dateF').val(),'DD-MM-YYYY');
		vente['montantTotalPrelever']= parseFloat($('#montantEchanceT').text());
		vente['apportTotalInitial']= nullToZero($('#apportT').val()); 	
		vente['montantTotal']= 		 parseFloat($('#montantTotalT').text());		
		vente['nombreEcheances']= 		 parseFloat($('#nombreEchanceT').text());	
		vente['montantTotalRemise']=   parseFloat($('#remiseT').text());
		vente['client']= 				 {'idClient':parseInt($(".select2-client option:selected" ).val())};
		vente['entrepot']=				 {'idEntrepot':$("#entrepot option:selected" ).val()};			
		vente['type']='Par facilité';
		vente['jourPrelevement']= moment($('#dateD').val(),'DD-MM-YYYY').get('date');
		if($('#customRadio1').is(':checked')) {
			vente['modePaiement']= "Prélèvement automatique";
		}else{
			vente['modePaiement']= "Paiement espece";
			}
		vente['ligneVentes']= lignesVente(vente['idVente']);
		$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            type: "POST",
            url: "/sauvegarderVenteF",
            dataType: 'json',
            timeout: 600000,
            data:  JSON.stringify(vente),
            success: function (data) {
            	 modeSaved();
            },
            error: function (e) {
            	alert(e.responseText)
            }
        });
	}
	
	function validerVente(){
		$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            type: "POST",
            url: "/validerVenteF",
            dataType: 'json',
            timeout: 600000,
            data: JSON.stringify(vente),
            success: function (data) {
            	modeConfirmed();	
            	alert('cette vente est confirmée avec succès');
            		
            },
            error: function (e) {
            	alert(e.responseText)
            }
        });
	}

	function remettreBrouillon(){
		$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            type: "POST",
            url: "/remettreBrouillon",
            dataType: 'json',
            timeout: 600000,
            data: JSON.stringify(vente),
            success: function (data) {
            	window.location.href = "/modifier-venteF?code="+data['idVente']; 
            },
            error: function (e) {
            	alert(e.responseText)
            }
        });
	}
	
	function annulerVente(){
		$.ajax({
    		headers : {
                'Accept' : 'application/json',
                'Content-Type' : 'application/json'
            },
            type: "POST",
            url: "/annulerVenteF",
            dataType: 'json',
            timeout: 600000,
            data: JSON.stringify(vente),
            success: function (data) {
            	modeAnnuler();	
            	
            		
            },
            error: function (e) {
            	alert(e.responseText)
            }
        });
	}
	
    
    function confirmeValiderVente(){
		if (confirm("voulez vous confirmer cette vente!")) {
			verifierDisponibiliteOnConfirme();
		  } 
	}
    function confirmeRemettreBrouillon(){
		if (confirm("voulez vous annuler cette vente!")) {
			remettreBrouillon();
		  } 
	}
	function annulerVenteBrouillon(){
		if (confirm("voulez vous annuler cette vente!")) {
			annulerVente();
		  } 
		}
   
    //select produit
    $(".select2-produit").select2({
        ajax: {
            url: "/produitSelect",
            dataType: 'json',
            delay: 500,
            data: function(params) {
                return {
                    q: params.term, // search term
                    page: params.page
                    
                };
            },
            processResults: function(data) {
                return {
                    results: data
                };
            },
            cache: true
        },
        escapeMarkup: function(markup) {return markup; }, // let our custom formatter work
        minimumInputLength: 1,
        templateResult: formatRepoProduit, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelectionProduit // omitted for brevity, see the source of this page
    });

    function formatRepoProduit(repo) {
        if (repo.loading) return repo.text;

        var markup = "<div class='select2-result-repository clearfix'>" +
            "<div class='select2-result-repository__meta'>" +
            "<div class='select2-result-repository__title'>" + repo.designation + "</div>";

        markup += "</div></div>";

        return markup;
    }

    function formatRepoSelectionProduit(repo) {
    	$('#qntConditionnee').val(1,00);
    	currentColisage = repo.colisage
        $('#qntVrac').val(currentColisage);
    	currentProduit = repo;
        return repo.designation;
    }
    //fin select produit
    
    //select client
	$(".select2-client").select2({
        ajax: {
            url: "/clientSelect",
            dataType: 'json',
            delay: 500,
            data: function(params) {
                return {
                    q: params.term, // search term
                    page: params.page
                    
                };
            },
            processResults: function(data) {
                return {
                    results: data
                };
            },
            cache: true
        },
        
        escapeMarkup: function(markup) { return markup; }, // let our custom formatter work
        minimumInputLength: 1,
        templateResult: formatRepoClient, // omitted for brevity, see the source of this page
        templateSelection: formatRepoSelectionClient // omitted for brevity, see the source of this page
    });
	
    function formatRepoClient(repo) {
        if (repo.loading) return repo.text;

        var markup = "<div class='select2-result-repository clearfix'>" +
            "<div class='select2-result-repository__meta'>" +
            "<div class='select2-result-repository__title'>" + repo.text + "</div>";

        markup += "</div></div>";
        return markup;
    }
	var secondStep =0;
    function formatRepoSelectionClient(repo) {
		if(repo.ccpCle!=null){ $('#ccp-cle').html(repo.ccpCle)}
        $('#observation').html(repo.observation)
        currClientId = repo.id;
        
        if(secondStep>1){
        	$('#salaire').val(repo.salaireMensuel)
            currSalaireMensuel=repo.salaireMensuel;
        }secondStep++;
        return repo.text;
    }
    //fin select client    
    
    function calendrie(){
    	window.location.href = "/calendrie?code="+vente['idVente'];
    }
    
    $(".select2-produit").change(function(){
    	if( t.rows().count() < 1 ){
    		chancesByProduit();
        }else{
        	echancesByProduitByEcheance()
        }
    	    	
       });
    $("#echeances").change(function(){
		var id = $("#echeances").val();
    	echanceById(id);
       });
    $("#qntConditionnee").change(function(){
    	if(isNaN($("#qntConditionnee").val()) || $("#qntConditionnee").val() < 0  ){
			alert('Valeur incorrecte');
		}else{
		var qnt = parseInt($("#qntConditionnee").val() * currentProduit['colisage'])	
    	$('#qntVrac').val(qnt);
		}
       });

    $("#qntVrac").change(function(){
        	var qnt = parseInt($("#qntVrac").val())
			if(isNaN($("#qntVrac").val()) ||  $("#qntVrac").val() <0 || !Number.isInteger(qnt) ){
				alert('Valeur incorrecte');
				$("#qntVrac").val(0)
			}else{
  		  		var conditionnee = parseFloat(qnt /  currentProduit['colisage'] );
  		  		$("#qntVrac").val(qnt)
  		  		$('#qntConditionnee').val(conditionnee.toFixed(2));
			}
  	    		
    	
       });
	
    var idy = 0;
    $('#addRow').on('click', function() {
    	event.preventDefault();
        currentOffre = echanceById($("#echeances option:selected").val());
        t.row.add([
            null,
        	currentProduit['id'],
        	currentProduit['designation'],
        	$('#qntConditionnee').val(),
        	$("#qntVrac").val(),
        	currentOffre[0]['total'],
        	(currentOffre[0]['apport'] - ( parseFloat($('#remise').val()) * currentOffre[0]['apport'] /100)  ) * parseFloat($("#qntVrac").val()),
        	(currentOffre[0]['montantEcheance']  - (parseFloat($('#remise').val()) *  currentOffre[0]['montantEcheance'] /100) ) * parseFloat($("#qntVrac").val()) ,
        	parseFloat($('#remise').val()),
        	(currentOffre[0]['total'] - (parseFloat($('#remise').val()) * currentOffre[0]['total'] /100)) * parseFloat($("#qntVrac").val()),
            '<i class="far fa-trash-alt delete" style="color: #f20a34;"></i>'
        ]).node().id = 'myId'+idy;
        t.draw(false);

        $('.select2-produit').children().remove();$("#echeances").children().remove();
        $('#qntConditionnee').val('');$("#qntVrac").val('');
        majTotal();
    });

	
	function saveEvent(vente){
		$( "form#nouvelle-vente" ).submit(function( event ) {
	    	event.preventDefault();
	    	var dd =  $('#dateD').val();var df= $("#dateF").val();
	    	  if ( $(".select2-client option:selected" ).val() == null || dd ==null || df==null ) {
					alert("champs invalide");
	    	  }else{
	    		  	var dateDebut = moment(dd,'DD-MM-YYYY');
		      	  	if($('#customRadio1').is(':checked')) {
		      	  		if(dateDebut.get('date') != vente["entreprise"]["jourPrelevement"]) { alert("Rappel : jour de prélévement est le " + vente["entreprise"]["jourPrelevement"])}
		      	  		else{saveVente();}
			        }else{
		          		if($("#dateF").val()=='' ){
			          		alert("Vérifier les dates SVP")
			          	}else{saveVente();}
	              		
	              	}
	        	  }
	    });
	}
	function dateFinEvent(vent){
		var vente = vent;
		$("#dateD").change(function() {
			var d =  $('#dateD').val();
	  		var dateDebut = moment(d,'DD-MM-YYYY');
	  		
			if($('#customRadio1').is(':checked')) {
		  		if(dateDebut.get('date') != vente["entreprise"]["jourPrelevement"]){
					alert("Rappel : jour de prélévement est " + vente["entreprise"]["jourPrelevement"])
		  	  	}else{
				  	  	var dateFin = dateDebut.add( (currentOffre[0]['echeance']-1) ,'M');
				  		$("#dateF").val(moment(dateFin).format('DD-MM-YYYY'))	;
		  	  	 }
			}else{
					var dateFin = dateDebut.add( (currentOffre[0]['echeance']-1) ,'M');
			  		$("#dateF").val(moment(dateFin).format('DD-MM-YYYY'))	;
				}
			
		});
	}
	function autreSoldes(){
		$.ajax({
		headers : {
            'Accept' : 'application/json',
            'Content-Type' : 'application/json'
        },
        type: "POST",
        url: "/simulationSoldes",
        dataType: 'json',
        timeout: 600000,
        data: JSON.stringify(currClientId),
        success: function (data) {
        	$('#autreSolde').val(data.autreSolde.toFixed(2));
        	$('#nbrAlerte').html(data.nbrAlerte);
        	calculeSimulation();
	            },
        error: function (e) {
        	alert(e.responseText)
        }
    });

	}
	function simulation(){
		autreSoldes();
	}
	function calculeSimulation(){
			var ration = $('#rationSalaire').val();
		var autreSolde=$('#autreSolde').val();
		currSalaireMensuel = $('#salaire').val();
		var resultat = (currSalaireMensuel-(currSalaireMensuel *(100-ration) /100))  - autreSolde;
		var montantEcheance = parseFloat($('#montantEchanceT').html());
		$('#capacite').empty();$('#decision').empty();
		if(resultat-montantEcheance<0){
			$('#capacite').append("<i class='fa fa-times'></i>  Capacité max:<span class='text-danger'> "+resultat.toFixed(2) +" DZD</span>");
			$('#decision').append("<i class='fa fa-times'></i> Decision système: <span class='text-danger'>vendre à ce client n'est pas recommandé</span>");
	    }else{$('#capacite').append("<i class='fa fa-check'></i>  Capacité max:<span class=''> "+resultat.toFixed(2) +" DZD</span>");
	    $('#decision').append("<i class='fa fa-check'></i> Decision système: <span class=''> les vérifications ne trouvent aucun danger de vendre à ce client</span>")
	    	}
	
		 $("#condition").show(500);
	}

	function verifierDisponibiliteOnConfirme(){
		$.ajax({
			headers : {
	            'Accept' : 'application/json',
	            'Content-Type' : 'application/json'
	        },
	        type: "POST",
	        url: "/verifierDisponibilite",
	        dataType: 'json',
	        timeout: 600000,
	        data: JSON.stringify(vente),
	        success: function (data) {
	            if(data.length>0){
	            	for(var i=0; i < t.rows().count() ; i++ ){
	        			var tLigne = t.row( i ).data();
	        			var id = tLigne[1]
	        			for(var j=0; j < data.length ; j++){
							if(data[j]["idProduit"]== id){
								t.rows( i ).nodes().to$().addClass( 'text-danger' );
							}
		        		}
	        		}
	            	if (confirm("Stock insuffisant, voulez-vous forcer la disponibilité ?")) {
	            		validerVente();
	        		  } 
	            }else{validerVente();}  
	        },
	        error: function (e) {
	        	alert(e.responseText)
	        }
	    });
	}
	
	function verifierDisponibiliteOnStart(){
		$.ajax({
			headers : {
	            'Accept' : 'application/json',
	            'Content-Type' : 'application/json'
	        },
	        type: "POST",
	        url: "/verifierDisponibilite",
	        dataType: 'json',
	        timeout: 600000,
	        data: JSON.stringify(vente),
	        success: function (data) {
	            if(data.length>0){
	            	for(var i=0; i < t.rows().count() ; i++ ){
	        			var tLigne = t.row( i ).data();
	        			var id = tLigne[1]
	        			for(var j=0; j < data.length ; j++){
							if(data[j]["idProduit"]== id){
								t.rows( i ).nodes().to$().addClass( 'text-danger' );
							}
		        		}
	        		} 
	            }  
	        },
	        error: function (e) {
	        	alert(e.responseText);
	        }
	    });
		}

	function majLignesVente(){
		for(var i=0; i < t.rows().count() ; i++ ){
			t.column(4).data().draw(true);
		}
	}
	 //  Row selection and deletion (single row)         //
    $('#t_add_row tbody').on( 'click', 'i.delete', function () {
	    t.row( $(this).parents('tr')).remove().draw();
	    if(t.rows().count()<1){
	    	currentProduit = null;
		}
	    majTotal();
    });
    
    $("#client-info").hide();
    $("#condition").hide();
    $('.select2-client').change(function(){
        $("#client-info").hide(250);
    	$("#client-info").show(500);
    	$("#condition").hide();
    	currClientId = null;
        currSalaireMensuel = null;
    	
     });
    $('#dateD,#dateVente').on('click', function() {
      	var position= {
      		'position' : 'fixed',
      		'top':'20px'
      	}
        $('.picker-focus').css(position);
      });
	$('#dateD').dateDropper();
	$('#dateVente').dateDropper();

	 $('#client,#entrepot').on('change', function() {

         var idEntrepot=$("#entrepot option:selected" ).val();
         var idClient=$(".select2-client option:selected" ).val();
         if(idClient!=null)
         {
			$.ajax({
	    		headers : {
	                'Accept' : 'application/json',
	                'Content-Type' : 'application/json'
	            },
	            type: "POST",
	            url: "/soldeClientParEntrepot?idEntrepot="+idEntrepot+"&idClient="+idClient+"",
	            dataType: 'json',
	            timeout: 600000,
	            success: function (data) {
		       
	           	 $("#soldeParEntrepot").html(data);

			            },
	            error: function (e) {
	            	alert("error")
	            }
	        });

         }
		 });

	 
		//majLignesVente();
    </script>
 </div>


	<!-- fin de contenu -->
         <footer th:replace="includes/footer :: buttom-footer"></footer>
            <!-- End footer -->
            </div>
        <!-- End Page -->
    </div>
<div th:replace="includes/footer :: aside-footer" ></div>
<div th:replace="includes/footer :: js-libs" ></div>

    <!--<script src="/resources/dist/js/pages/datatable/datatable-advanced.init.js"></script>-->
   
</body>
</html>








