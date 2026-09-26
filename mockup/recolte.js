
// ═════════════════════════════════════════════════════════════════════════════════════
//  L'APP DE RÉCOLTE — un seul moteur, deux écrans. (26/09/2026)
//
//  Jusqu'ici l'app vivait deux fois : dans app_mockup.html (le banc de fidélité la teste)
//  et, recopiée, dans dessin/00_connexion.html (la vitrine la montre). Les deux copies
//  avaient divergé dans les deux sens — la vitrine gardait « ça travaille » après que la
//  base l'eut refusé, et app_mockup affichait deux phrases de doctrine périmées le 15/07
//  que seule la vitrine avait corrigées. C'est la panne que noyau.js a réglée pour le nœud :
//  « le moteur ne vit qu'une fois ». Même remède, même garde (tests/source_unique.sh).
//
//  Les différences légitimes entre écrans ne sont plus des copies : ce sont des OPTIONS,
//  comme opts.labels / opts.encre pour le nœud.
//    · anonyme  — la vitrine est ouverte à tous : elle ne signe personne. L'app réelle
//                 signe (la signature EST l'acte, §5 ; banc : I11). Défaut : signé.
//    · exemples — { metab:[…], reflex:[…] } : ce que la vitrine montre des deux autres
//                 strates. Le contenu reste chez elle ; le moteur ne fait que le poser.
// ═════════════════════════════════════════════════════════════════════════════════════
import { SET, setRed, setInk, setRefreshStatics } from './noyau.js';
import { creerNoeud } from './noeud.js';
export function monterRecolte(opts){
  "use strict";
  opts = opts || {};
  var ANONYME  = !!opts.anonyme;
  var EXEMPLES = opts.exemples || null;
  var reduce = window.matchMedia("(prefers-reduced-motion:reduce)").matches;

  setRefreshStatics(refreshStatics);

  // ---- DOM ----
  var fil=document.getElementById("fil"), filR=document.getElementById("filR"),
      grp=document.getElementById("grp"), pt=document.getElementById("pt"), ptHalo=document.getElementById("ptHalo"),
      ptPup=document.getElementById("ptPup"), ptIris=document.getElementById("ptIris"), ptClipC=document.getElementById("ptClipC"),
      ptCatch=document.getElementById("ptCatch"),
      scouterG=document.getElementById("scouter"), montureG=document.getElementById("scMonture"),
      oudjatG=document.getElementById("oudjat"),
      labels=document.getElementById("labels"), tag=document.getElementById("tag"),
      hint=document.getElementById("hint"), knotSvg=document.getElementById("knot"),
      eyeG=document.getElementById("eyeG"),
      holesG=document.getElementById("holes"), oversG=document.getElementById("overs");
  var switchBtns=[].slice.call(document.querySelectorAll("#switch button"));
  var frames=[].slice.call(document.querySelectorAll(".frame"));
  var NS="http://www.w3.org/2000/svg";


  // signature du wordmark (forme CO) + lockup ∞NT + épreuves favicon : même pipeline, formes statiques
  var WM_K=1.6, WM_PTR=9; // graisse et point calés sur les capitales
  function vbOf(P, pad){
    var x0=1e9,x1=-1e9,y0=1e9,y1=-1e9;
    for(var i=0;i<P.length;i++){ var p=P[i];
      if(p[0]<x0)x0=p[0]; if(p[0]>x1)x1=p[0]; if(p[1]<y0)y0=p[1]; if(p[1]>y1)y1=p[1]; }
    x0-=pad; y0-=pad; x1+=pad; y1+=pad;
    return { s:f1(x0)+" "+f1(y0)+" "+f1(x1-x0)+" "+f1(y1-y0), ar:(x1-x0)/(y1-y0), h:(y1-y0) };
  }
  function refreshStatics(){ /* l'œil et le tracé vivent dans le nœud (noeud.js) ; rien à rafraîchir ici */ }

  // ══════════════════════════════════════════════════════════════════════════════
  //  L'APP — le nœud EST le shell. Un seul objet qui se replie ; pas de pages.
  //
  //  Trois strates, dans l'ordre du terrain vers l'institutionnel (l'inverse du
  //  chemin de la doctrine) : on entre à cinq boucles, on replie vers deux.
  //
  //  ┌ La loi de cet écran ──────────────────────────────────────────────────┐
  //  │  ON LIT PAR AXE. ON ÉCRIT AU NŒUD.                                    │
  //  │                                                                        │
  //  │  Si le champ de saisie vivait DANS un lobe, choisir la boucle serait   │
  //  │  choisir l'axe — l'axe serait déposé, et l'invariant 20 mourrait avec  │
  //  │  lui. Le lobe tenu DÉROULE ; il ne reçoit pas. Il n'y a pas de         │
  //  │  sélecteur d'axe parce qu'il n'existe aucun endroit géométrique où en  │
  //  │  mettre un. Absence de chemin, pas règle.                              │
  //  └────────────────────────────────────────────────────────────────────────┘
  // ══════════════════════════════════════════════════════════════════════════════

  var $=function(i){ return document.getElementById(i); };


  // ── Le grain : la forme du nœud quand rien n'a été récolté ────────────────────
  // `ASYM[5].s` ne disparaît pas ; il cesse d'être la TAILLE. Sans lui, le patient nu
  // s'afficherait en fleur parfaitement symétrique — la symétrie normative que le §19
  // bannit — et les boucles NAÎTRAIENT de la donnée, quand la loi du logo dit qu'elles
  // préexistent repliées. La récolte DÉPLIE, elle ne crée pas.

  // ── Dépôts (domaine 2) ────────────────────────────────────────────────────────
  var DEPOTS=[
    {a:"Karima", t:"Le 3 mars : « toute-puissance ». Il a refusé de s’asseoir, puis s’est excusé dans le couloir."},
    {a:"Karima", t:"Sa sœur a rappelé, depuis qu’il ne travaille plus. Elle demande si on peut passer le matin."},
    {a:"Céline", t:"Il dit qu’il ne prend plus le traitement du soir. Il ne veut pas en parler à sa sœur."},
    {a:"Anthony",t:"Rendez-vous manqué au CMP. Il était chez lui, il n’a pas ouvert."},
    {a:"Céline", t:"Il a parlé de son ancien poste à l’atelier. Il en parle au présent."},
    {a:"Karima", t:"Sa sœur pleure au téléphone. Elle dit qu’elle n’en peut plus, mais qu’elle ne lâchera pas."}
  ];
  DEPOTS.forEach(function(d,i){ d.h=new Date(Date.now()-(DEPOTS.length-i)*36e5); });
  // Anonyme : l'anonymat se fait EN RETIRANT — la date seule, jamais qui. Les textes restent
  // mot pour mot ; seuls les auteurs partent. Aucun de ces six textes ne nomme quelqu'un.
  if(ANONYME) DEPOTS.forEach(function(d){ delete d.a; });

  // Le gabarit de la Récolte, à l'identique : le texte, puis la date et la nature. Rien
  // d'autre — pas d'auteur, donc pas de place où en mettre un.
  //
  // `d` est FACULTATIF, et son absence dit quelque chose : une proposition de la machine
  // est recalculée en permanence, elle est toujours maintenant — la dater serait mentir.
  // La mention « proposé par la machine » dit déjà ce qu'il faut. Seuls les objets signés
  // portent une date : ce sont des dépôts, ils ont eu lieu une fois.
  function filEx(items, cls){
    return '<ul class="fil '+cls+'">'+items.map(function(x){
      var corps = x.html ? '<div class="depot">'+x.html+'</div>' : '<p class="depot">'+ech(x.t)+'</p>';
      var marques = '<span class="nat">'+ech(x.n)+'</span>' + (x.m ? '<span class="nat">'+ech(x.m)+'</span>' : '');
      var agr = x.agr ? '<div class="agr"><p class="agrTxt">'+ech(x.agr)+'</p>'+
                        '<p class="attr">'+ech(x.agrD)+'<span class="nat">agrafé</span></p></div>' : '';
      return '<li><p class="attr">'+(x.d ? ech(x.d)+' ' : '')+marques+'</p>'+corps+agr+'</li>';
    }).join('')+'</ul>';
  }

  // Qui signe, sur une ligne d'attribution. Signé : « Karima · ». Anonyme : rien — pas
  // « anonyme » : ça ferait une colonne de « anonyme · anonyme · anonyme ».
  function signe(d){ return ANONYME ? '' : ech(d.a)+' · '; }

  // ── Le patient nu : `?nu` ─────────────────────────────────────────────────────────
  // Ce n'est pas un mode de test, c'est l'état le plus important de l'app et le plus rare
  // à voir : personne n'a encore rien déposé. Le fil est au premier cran, les cinq boucles
  // ne portent que leur grain, et l'œil ne désigne rien — parce qu'il n'y a pas d'angle mort
  // quand tout l'est. C'est le seul écran où l'outil n'a strictement rien à dire, et c'est
  // celui qu'il faut regarder le plus longtemps.
  if(/[?&]nu\b/.test(location.search)) DEPOTS.length = 0;

  // ── La passe machine (domaine 3) ──────────────────────────────────────────────
  // Un acte machine DATÉ, jamais un dépôt. Rejouable ; le pentalobe lit la dernière.
  // Le lexique ci-dessous tient lieu du découpeur : dans l'app réelle c'est un modèle,
  // borné à la COUVERTURE (quels sujets la prose touche), jamais au sens.
  var LEX={ "Familiale":/sœur|soeur|famille|mère|père|frère/i,
            "Sociale":/ami|voisin|couloir|quelqu|téléphone/i,
            "Professionnelle":/travail|poste|atelier|emploi|chômage/i,
            "Amoureuse":/compagne|amoureu|conjoint|femme|copine/i,
            "Soi":/traitement|rendez-vous|cmp|soin|refus|excus|asseoir|ouvert|prend/i };
  var PASSE=null;

  // ── Les trois couvertures ────────────────────────────────────────────────────────
  // « Ce que tu fais · ce que tu vois · ce qu'il faudrait. » Trois marques, pas trois champs.
  //
  // `depots_grille_formulee_en_college` verrouille `situation` et `demande` sur
  // `cadre='synthese_collective'` : l'infirmier NE PEUT PAS les déposer. Un guichet à trois
  // champs produirait trois dépôts illégaux, ou une grille formulée par une main seule — et le
  // trilobe cesserait d'être un collège pour devenir un bureau. Donc : UN dépôt, TROIS lectures.
  //
  // ⚠ Ces marques ne sont PAS déterministes. Savoir si une prose a touché « la clinique » est un
  // jugement sémantique. Le lexique ci-dessous est un FIGURANT, du même statut que `LEX` : dans
  // l'app c'est un modèle, borné à la couverture, jamais au sens. Ce qui est déterministe dans
  // l'architecture d'éval, c'est la couverture STRUCTURELLE — le complément de ce qui a été
  // rangé, calculable sur des positions de caractères. Pas ceci.
  var COUV=[
    {cle:"situation", mot:"l’intervention", fig:/domicile|visite|entretien|téléphon|cmp|rendez|passé|reçu|appel/i},
    {cle:"clinique",  mot:"la clinique",    fig:/dit|refus|parl|pleur|angoiss|traitement|sommeil|mange|voix|présent/i},
    {cle:"demande",   mot:"la direction",   fig:/faudrait|revoir|coordon|hospitalis|famille|orient|reprendre|surveill/i}
  ];
  function couvertures(txt){ return COUV.map(function(c){ return c.fig.test(txt||""); }); }

  function passer(){
    var frags=[], AX=noeud.axes();   // la carte des axes vient du nœud (forme de l'instance), jamais copiée ici
    DEPOTS.forEach(function(d,di){
      // découpage grossier en propositions — la portion la plus petite QUI GARDE LE SENS.
      var parts=d.t.split(/(?<=[.;])\s+/);
      var off=0;
      parts.forEach(function(p){
        var deb=d.t.indexOf(p,off); off=deb+p.length;
        var lobes=[];
        for(var b=0;b<5;b++){ var ax=AX[b]; if(LEX[ax] && LEX[ax].test(p)) lobes.push(b); }
        if(lobes.length) frags.push({depot:di, debut:deb, fin:off, lobes:lobes});
      });
    });
    PASSE={ calculeLe:new Date(), n:DEPOTS.length, frags:frags };
    noeud.setGrain(densitesParLobe()); rendre();
  }

  function densitesParLobe(){
    var d=[0,0,0,0,0];
    if(!PASSE) return d;
    PASSE.frags.forEach(function(f){ f.lobes.forEach(function(b){ d[b]++; }); });
    return d;
  }

  // ── La géométrie suit la matière rangée ───────────────────────────────────────
  // s_i = grain_i · (1 + k·u_i),  u_i = 1 − e^(−d_i/τ)  — u_i ne dépend QUE de d_i.
  // Pas de normalisation par le max : sinon déposer sur le travail RÉTRÉCIRAIT la
  // boucle familiale alors que rien de familial n'a bougé. Une part relative est un
  // poids relatif, et le poids est interdit (§19).
  // La saturation n'est pas un défaut : c'est « montré, jamais chiffré » tenu par la
  // courbe. Une boucle linéaire laisserait lire le compte sur le dessin ; celle-ci dit
  // « beaucoup », jamais « quatre-vingts ».

  // ── L'épaisseur du fil : quatre crans francs, jamais une courbe ───────────────
  // « rien · pas assez · il y en a · le dossier est fourni ». Un saut visible entre chaque :
  // on ne lit pas un volume, on lit un ÉTAT. Une courbe laisserait compter sur le dessin.
  //
  // Elle ne rétrécit JAMAIS : les dépôts sont append-only, le fil hérite de l'invariant 1.
  // Elle ne se lit pas de la passe : au dépôt le fil épaissit et AUCUNE boucle ne bouge.
  // « On sait davantage, on ne l'a pas encore rangé. » Le Goodhart meurt là : on ne peut
  // pas engraisser une boucle en écrivant.
  //
  // Le quatrième cran n'appartient PAS à la récolte. Un dossier « fourni » n'est pas un dossier
  // gros : c'est un dossier métabolisé. À cinq boucles le fil sature donc au troisième cran,
  // quel que soit le nombre de dépôts. La quantité ne peut pas se faire passer pour du travail.
  var CRANS = [5, 8, 11, 14];             // rien · pas assez · il y en a · fourni
  var SEUILS = [1, 4, 12];                // dépôts requis pour monter d'un cran
  function cranRecolte(){
    var n=DEPOTS.length, c=0;
    for(var i=0;i<SEUILS.length;i++) if(n>=SEUILS[i]) c=i+1;
    return Math.min(c, 2);                // plafond récolte : le 4e cran se gagne au trilobe
  }
  function majFil(){ noeud.setEpaisseur(CRANS[cranRecolte()]); }

  // ── Le panneau ────────────────────────────────────────────────────────────────
  var HEURE=new Intl.DateTimeFormat("fr-FR",{day:"numeric",month:"long",hour:"2-digit",minute:"2-digit"});
  function quand(d){ return HEURE.format(d).replace(":"," h "); }
  function ech(s){ var e=document.createElement("i"); e.textContent=s; return e.innerHTML; }

  // Le panneau lit `targetS`, non `currentS` : la strate est décidée au clic, la forme
  // met une seconde à s'y rendre. Le morph est le voyage, pas la décision.
  // ── La péremption est arithmétique, pas décidée ───────────────────────────────
  // Le condensé porte le nombre de dépôts dont il est issu. Un dépôt tombe → périmé, par
  // construction. Personne ne relance. (Chez LeCLG : `_n === n`. Chez nous le compte est
  // MONOTONE — append-only — donc c'est une clé de péremption parfaite, pas une heuristique.)
  //
  // Et personne ne PAIE le recalcul à la récolte : le rangement appartient à la métabolisation.
  // L'infirmier ne déclenche jamais un acte machine. Ouvrir le trilobe, c'est payer la passe.
  function retardTexte(){
    if(!PASSE) return 'rien n’a encore été rangé';
    var d=DEPOTS.length-PASSE.n;
    return 'rangé sur '+PASSE.n+' dépôt'+(PASSE.n>1?'s':'')+(d>0? ' · '+d+' de plus depuis' : '');
  }
  function retard(){ return '<span class="passe" title="le rangement se recalcule au trilobe">'+retardTexte()+'</span>'; }
  function passePerimee(){ return !PASSE || PASSE.n !== DEPOTS.length; }

  function rendre(){
    var s=STRATE, pan=$("panneau");
    majFil();

    if(s===2 && HELD<0){                                // ── LE NŒUD : on écrit ──
      var fl=DEPOTS.map(function(d){
        var corps = '<p class="depot">'+ech(d.t)+'</p>';
        var typ = (d.n && d.n!=="observation") ? '<span class="nat">'+ech(d.n)+'</span>' : '';
        return '<li>'+corps+
               '<p class="attr">'+signe(d)+quand(d.h)+' '+typ+'</p></li>';
      }).join("");
      pan.innerHTML =
        '<p class="rtag">Récolte · le nœud · <b>on écrit ici</b></p>'+
        '<ul class="fil">'+fl+'</ul>'+
        // AMORCE, non glose (§8). Elle n'explique pas le champ — elle ouvre le geste.
        // « Le jour où un champ a besoin d'un texte d'aide pour être compris, c'est le champ
        // qui est mal fait » vise la GLOSE. « L'indice ouvre un geste » autorise ceci.
        '<div class="champ"><textarea id="txt" rows="2" aria-label="Observation" '+
          'placeholder="Ce qui a été vu, entendu, rapporté"></textarea></div>'+
        '<div class="couv" id="couv"></div>'+
        '<div class="barre">'+retard()+'<button id="btDep">Déposer</button></div>';
      var txt=$("txt");
      txt.value=BROUILLON;
      majCouv();
      txt.addEventListener("input",function(){
        BROUILLON=txt.value;
        txt.style.height="auto"; txt.style.height=txt.scrollHeight+"px";
        majCouv();   // la marque suit la prose. Elle ne la corrige pas, ne la complète pas,
      });            // n'écrit jamais dans le champ, et ne conditionne jamais le bouton.
      $("btDep").addEventListener("click",function(){
        // Le refus : le champ vide ne rejoint pas le fil. Rien ne l'explique.
        if(!/\S/.test(txt.value)){ txt.focus(); return; }
        DEPOTS.push({a:QUI, n:"observation", t:txt.value, h:new Date()});
        BROUILLON="";                        // signé : la prose quitte l'écran pour le fil
        rendre(); $("txt").focus();
        // Aucune boucle ne bouge. La passe n'a pas tourné.
      });
      // Pas de focus ici : `rendre()` tourne aussi à l'ouverture, et le focus y faisait
      // défiler .ecran jusqu'au champ — le nœud sortait du cadre avant qu'on l'ait vu.
      // Le focus appartient au DÉPÔT (on continue d'écrire), pas au rendu : il est posé
      // sur chacun des gestes qui déposent, jamais ici.

      // Le fil est une chronologie et les dépôts s'ajoutent en queue : on ouvre EN BAS,
      // sur le dernier, comme on arrive dans une conversation. `scrollTop` sur la boîte
      // ne touche pas .ecran — c'est un défilement interne, pas un scrollIntoView (le
      // piège du focus). Seule la boîte des dépôts est concernée : la liste d'une boucle
      // tenue se lit, elle ne s'écrit pas, elle reste en tête.
      var ul=pan.querySelector("ul.fil"); if(ul) ul.scrollTop=ul.scrollHeight;
      return;
    }

    if(s===2){                                          // ── UNE BOUCLE TENUE : on lit ──
      var b=HELD, ax=HELDAXE, AX=noeud.axes();
      var fr=(PASSE? PASSE.frags.filter(function(f){ return f.lobes.indexOf(b)>=0; }) : []);
      var corps = fr.length
        ? fr.map(function(f){ var d=DEPOTS[f.depot];
            var croise=f.lobes.length>1 ? '<span class="croise">croise '+f.lobes.filter(function(x){return x!==b;}).map(function(x){return AX[x];}).join(" · ")+'</span>' : '';
            return '<li><p class="depot">'+ech(d.t.slice(f.debut,f.fin))+'</p>'+
                   '<p class="attr">'+signe(d)+quand(d.h)+' · <a href="#" class="note">la note entière</a> '+croise+'</p></li>';
          }).join("")
        : '<li class="creux"><p class="depot">—</p><p class="attr">'+(PASSE?'rien n’a été rangé ici':'la lecture machine n’a pas tourné')+'</p></li>';
      pan.innerHTML =
        '<p class="rtag">Récolte · boucle <b>'+ax+'</b> · on lit, on n’écrit pas ici</p>'+
        '<ul class="fil">'+corps+'</ul>'+
        '<div class="note-bas">'+retardTexte()+'. La portion est citée ; le dépôt reste entier, à un clic. '+
        'Un fragment sur deux axes est <b>un</b> croisement, non deux cases cochées.</div>';
      return;
    }

    if(s===1){
      // La note doctrinale reste EN DESSOUS des exemples : on montre, puis on dit.
      // (2026-07-15, Abtine) La dernière phrase mélangeait le trilobe et la Vigilante :
      // « ne se dépose jamais SEUL » dit qu'on dépose, en collège — ce n'est pas « aucun
      // guichet ». L'écran de la page 2 le confirme : Synthèse, Hypothèse et
      // Accompagnement ont chacun le leur ; la Vigilance est la seule à n'en avoir aucun.
      // Le reste de la note est intact.
      // (2026-09-26, Abtine) « Métabolisation », sans « trilobe » : comme « l'infini » au bilobe,
      // c'était la forme du logo, pas le nom de la strate.
      pan.innerHTML='<p class="rtag">Métabolisation</p>'+
        (EXEMPLES ? filEx(EXEMPLES.metab,"mMetab") : '')+
        '<div class="note-bas">Affectif et Réflexif <b>composent</b> ; la Vigilante <b>lit</b> — deux lobes composent, un seul lit. '+
        'Entre dans un lobe : l’œil saute la corde. Dans la Vigilante il chausse la lentille. '+
        'Ce qui se <i>formule</i> ne se dépose jamais seul : on noue et on signe en collège. '+
        'Seule la Vigilante n’a aucun guichet — on la lit, on n’y dépose pas ; c’est ce qui lui donne le droit de parler.</div>';
      return;
    }
    // (2026-07-15, Abtine) Deux périmés levés dans cette note :
    //  · « montré jamais chiffré » : la garde est levée au bilobe — le nombre est permis
    //    sur l'agrégat anonyme, il n'y a plus personne dedans ; l'interdit porte sur la
    //    personne.
    //  · « se tient au centre » : l'œil se balade sur le fil depuis le chantier du 15/07.
    // Le reste de la note est intact.
    // (2026-09-26, Abtine) L'étiquette est « Institutionnel ». « L'infini » n'était que la
    // forme du logo correspondant, pas le nom de la strate.
    pan.innerHTML='<p class="rtag">Institutionnel</p>'+
      (EXEMPLES ? filEx(EXEMPLES.reflex,"mReflex") : '')+
      '<div class="note-bas">Continuité et Fragmentation — les deux faces d’une même présence. '+
      'L’œil veille : sentinelle, non lecteur. Agrégat anonyme : aucun nombre sur quelqu’un, '+
      'mais on peut compter notre trace.</div>';
  }

  // La prose en cours n'est pas un dépôt — mais elle n'est pas rien non plus. Re-rendre l'écran
  // (un dépôt, une marque, une strate) ne doit pas effacer ce qu'on était en train d'écrire. Le brouillon vit dans
  // l'écran, jamais dans la base : « rien n'est déposé tant qu'il n'a pas signé. »
  var BROUILLON="";

  function motDe(cle){ for(var i=0;i<COUV.length;i++) if(COUV[i].cle===cle) return COUV[i].mot; return cle; }

  // Les marques s'allument, et n'ont AUCUN pouvoir. Le bouton n'est jamais grisé par elles :
  // une couverture qui conditionne le dépôt, c'est la machine qui dicte quand une observation
  // est complète. Elle montre. Elle ne conclut pas, et elle n'empêche pas.
  function majCouv(){
    var zone=$("couv"); if(!zone) return;
    var t=$("txt")?$("txt").value:"", etats=couvertures(t);
    zone.innerHTML = COUV.map(function(c,i){
      return '<span class="mq'+(etats[i]?' on':'')+'" data-i="'+i+'">'+c.mot+
             '<b class="actes"><a data-a="rien" data-i="'+i+'">j’ai regardé, rien</a></b></span>';
    }).join("");
    zone.querySelectorAll("a").forEach(function(a){
      a.addEventListener("click", function(e){
        e.preventDefault();
        var c=COUV[+a.dataset.i].cle, tx=$("txt");
        // Un seul acte sur une marque. « ça travaille » (`gestation`) est retiré le 26/09/2026 :
        // attendre est devenu une `temporalite`, argumentée et déposée EN COLLÈGE (db/30, gestes
        // 12-13). Le guichet de récolte est un cadre=seul — il n'en a pas le chemin (banc : I12).
        // `vide_info` porte un contenu : « j'ai regardé, il n'y avait rien » est un FAIT,
        // il se dit. Le champ vide reste refusé — un fait ne se dépose pas en blanc.
        if(!/\S/.test(tx.value)){ tx.focus(); return; }
        DEPOTS.push({a:QUI, n:"vide_info", c:c, t:tx.value, h:new Date()});
        BROUILLON="";
        rendre(); $("txt").focus();   // déposé aussi : le champ reprend la main
      });
    });
  }

  // ── Qui écrit ─────────────────────────────────────────────────────────────────
  // Signé : le sélecteur de prénom du prototype dit qui écrit (le banc le lit, jamais en dur).
  // Anonyme : personne. Le dépôt garde sa place dans le fil et son heure ; `a` reste dans sa
  // forme (l'app réelle signe — invariant 1), il ne porte rien, et rien ne l'affiche.
  var QUI = ANONYME ? null : "Karima";
  var selQui = $("qui"); if(selQui) selQui.addEventListener("change",function(){ QUI=this.value; });

  // ── Le nœud (module) et son câblage à la page ──────────────────────────────────
  // La page ne dessine plus le nœud : elle l'instancie, le pilote (setStrate/setGrain),
  // et écoute ses événements. La strate change la forme (nœud) ET le panneau (page).
  setRed(0.85); setInk(0.36);
  var STRATE=2, HELD=-1, HELDAXE=null;
  var noeud = creerNoeud(knotSvg);

  // #tag/#hint suivent le lobe courant, émis par le nœud pendant le morph (jamais un id de page dans le module)
  noeud.onStrateChange(function(s, lc, ctx){
    tag.innerHTML='<b>'+lc+' boucle'+(lc>1?'s':'')+'</b> — '+ctx;
    hint.className=(lc>=5?"hint show":"hint");
  });
  // clic sur une boucle : le nœud tient l'œil et NOTIFIE la page de l'axe tenu (pour le panneau « on lit »)
  noeud.onLobe(function(b, axe){ HELD=b; HELDAXE=axe; rendre(); });

  // la strate décide la forme (nœud) ET le panneau (page), d'un seul geste
  function changerStrate(s){
    STRATE=s; HELD=-1; HELDAXE=null;
    noeud.setStrate(s);
    switchBtns.forEach(function(b){ b.classList.toggle("on",(+b.dataset.s)===s); });
    frames.forEach(function(f){ f.classList.toggle("on",(+f.dataset.f)===s); });
    // Ouvrir la métabolisation paie le recalcul (seul déclencheur, humain sans être un verdict).
    if(s===1 && passePerimee()) passer();
    rendre();
  }
  switchBtns.forEach(function(b){ b.addEventListener("click",function(){ changerStrate(+b.dataset.s); }); });

  changerStrate(2); rendre();
}

