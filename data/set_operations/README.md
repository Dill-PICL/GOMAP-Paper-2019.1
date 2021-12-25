## Set Operations

This is a diagnostic tool not explicitly used in our manuscript that allows you to trace back differences between clades to the underlying GOMAP term sets.
It allows you to answer questions such as, *What do all legumes AND cotton have in common that cannabis doesn't have?* by performing set operations (union, intersect, setdiff) on the GO term sets of the species.
It is implemented as a very simple Ruby DSL which you can pass to `analyses/treebuilding/set_operations.rb`, e.g. `ruby analyses/treebuilding/set_operations.rb data/set_operations/arachis_medi_vs_legumes.rb`.
The following operations are implemented:
```ruby
# First we need to create the sets to work with by passing the dataset name to GOSet.new:
wheat = GOSet.new("Triticum_aestivum")
mays = GOSet.new("Zea_mays.PH207")
cowpea = GOSet.new("Vigna_unguiculata")
soy = GOSet.new("Glycine_max")
# Now we can use the + (union), & (intersect), and - (setdiff) operators to create new sets:
monocots_intersect = wheat & mays
legumes_union  = cowpea + soy
monocots_not_legumes = monocots_intersect - legumes_union
# To output the term set simply call output on it:
puts("These terms are present in both monocots but neither of the two legumes:")
monocots_not_legumes.output
```

The above example would yield the following output:
```
These terms are present in both monocots but neither of the two legumes:
GO:0070840 - dynein complex binding
GO:0047322 - [hydroxymethylglutaryl-CoA reductase (NADPH)] kinase activity
GO:0050405 - [acetyl-CoA carboxylase] kinase activity
GO:0005469 - succinate:fumarate antiporter activity
GO:0015138 - fumarate transmembrane transporter activity
GO:0034186 - apolipoprotein A-I binding
GO:0047254 - 2,4-dihydroxy-7-methoxy-2H-1,4-benzoxazin-3(4H)-one 2-D-glucosyltransferase activity
GO:0005159 - insulin-like growth factor receptor binding
GO:0047364 - desulfoglucosinolate sulfotransferase activity
GO:0044548 - S100 protein binding
GO:0008923 - lysine decarboxylase activity
GO:0005129 - granulocyte macrophage colony-stimulating factor receptor binding
GO:0047085 - hydroxyphenylacetonitrile 2-monooxygenase activity
GO:0050592 - 4-hydroxyphenylacetaldehyde oxime monooxygenase activity
GO:0004026 - alcohol O-acetyltransferase activity
GO:0034318 - alcohol O-acyltransferase activity
GO:0016401 - palmitoyl-CoA oxidase activity
GO:0090704 - nicotinate-O-glucosyltransferase activity
GO:0008701 - 4-hydroxy-2-oxovalerate aldolase activity
GO:0033879 - acetylajmaline esterase activity
GO:0050294 - steroid sulfotransferase activity
GO:0033948 - fructan beta-(2,1)-fructosidase activity
GO:0008186 - RNA-dependent ATPase activity
GO:0004309 - exopolyphosphatase activity
GO:0008254 - 3'-nucleotidase activity
GO:0033850 - Z-farnesyl diphosphate synthase activity
GO:0015113 - nitrite transmembrane transporter activity
GO:0051498 - syn-copalyl diphosphate synthase activity
GO:0018674 - (S)-limonene 3-monooxygenase activity
GO:0019113 - limonene monooxygenase activity
GO:0004730 - pseudouridylate synthase activity
GO:0005201 - extracellular matrix structural constituent
GO:0070975 - FHA domain binding
GO:0050618 - phycoerythrobilin:ferredoxin oxidoreductase activity
GO:0003681 - bent DNA binding
GO:0008119 - thiopurine S-methyltransferase activity
GO:0018708 - thiol S-methyltransferase activity
GO:0045503 - dynein light chain binding
GO:0070061 - fructose binding
GO:0004307 - ethanolaminephosphotransferase activity
GO:0043560 - insulin receptor substrate binding
GO:0050449 - casbene synthase activity
GO:0040022 - feminization of hermaphroditic germ-line
GO:0040021 - hermaphrodite germ-line sex determination
GO:2000905 - negative regulation of starch metabolic process
GO:2000049 - positive regulation of cell-cell adhesion mediated by cadherin
GO:2000047 - regulation of cell-cell adhesion mediated by cadherin
GO:0045071 - negative regulation of viral genome replication
GO:0045069 - regulation of viral genome replication
GO:1903900 - regulation of viral life cycle
GO:0048525 - negative regulation of viral process
GO:0060337 - type I interferon signaling pathway
GO:0006853 - carnitine shuttle
GO:0014823 - response to activity
GO:0032007 - negative regulation of TOR signaling
GO:0045821 - positive regulation of glycolytic process
GO:1900544 - positive regulation of purine nucleotide metabolic process
GO:0045981 - positive regulation of nucleotide metabolic process
GO:1903580 - positive regulation of ATP metabolic process
GO:0034372 - very-low-density lipoprotein particle remodeling
GO:0034370 - triglyceride-rich lipoprotein particle remodeling
GO:0034369 - plasma lipoprotein particle remodeling
GO:0034368 - protein-lipid complex remodeling
GO:0034367 - protein-containing complex remodeling
GO:0034375 - high-density lipoprotein particle remodeling
GO:0034435 - cholesterol esterification
GO:0043691 - reverse cholesterol transport
GO:0090107 - regulation of high-density lipoprotein particle assembly
GO:0071287 - cellular response to manganese ion
GO:0045980 - negative regulation of nucleotide metabolic process
GO:0089722 - phosphoenolpyruvate transmembrane transport
GO:1904961 - quiescent center organization
GO:0048520 - positive regulation of behavior
GO:0032260 - response to jasmonic acid stimulus involved in jasmonic acid and ethylene-dependent systemic resistance
GO:0000732 - strand displacement
GO:0021537 - telencephalon development
GO:0048704 - embryonic skeletal system morphogenesis
GO:0002540 - leukotriene production involved in inflammatory response
GO:0002538 - arachidonic acid metabolite production involved in inflammatory response
GO:0052151 - positive regulation by symbiont of host apoptotic process
GO:0052150 - modulation by symbiont of host apoptotic process
GO:0052433 - modulation by organism of apoptotic process in other organism involved in symbiotic interaction
GO:0044532 - modulation of apoptotic process in other organism
GO:0045822 - negative regulation of heart contraction
GO:1903523 - negative regulation of blood circulation
GO:0051519 - activation of bipolar cell growth
GO:0051518 - positive regulation of bipolar cell growth
GO:0051516 - regulation of bipolar cell growth
GO:0010132 - dhurrin biosynthetic process
GO:0071000 - response to magnetism
GO:0007431 - salivary gland development
GO:0060052 - neurofilament cytoskeleton organization
GO:0045104 - intermediate filament cytoskeleton organization
GO:0045103 - intermediate filament-based process
GO:2001034 - positive regulation of double-strand break repair via nonhomologous end joining
GO:2000781 - positive regulation of double-strand break repair
GO:2001032 - regulation of double-strand break repair via nonhomologous end joining
GO:0032510 - endosome to lysosome transport via multivesicular body sorting pathway
GO:0007290 - spermatid nucleus elongation
GO:0034454 - microtubule anchoring at centrosome
GO:0072393 - microtubule anchoring at microtubule organizing center
GO:0010622 - specification of ovule identity
GO:0000709 - meiotic joint molecule formation
GO:0000711 - meiotic DNA repair synthesis
GO:0015707 - nitrite transport
GO:0051489 - regulation of filopodium assembly
GO:0006408 - snRNA export from nucleus
GO:0035523 - protein K29-linked deubiquitination
GO:1990167 - protein K27-linked deubiquitination
GO:1990168 - protein K33-linked deubiquitination
GO:0007253 - cytoplasmic sequestering of NF-kappaB
GO:0042994 - cytoplasmic sequestering of transcription factor
GO:0043518 - negative regulation of DNA damage response, signal transduction by p53 class mediator
GO:1901797 - negative regulation of signal transduction by p53 class mediator
GO:0090201 - negative regulation of release of cytochrome c from mitochondria
GO:0090199 - regulation of release of cytochrome c from mitochondria
GO:0048599 - oocyte development
GO:0006663 - platelet activating factor biosynthetic process
GO:0046469 - platelet activating factor metabolic process
GO:0019061 - uncoating of virus
GO:0060765 - regulation of androgen receptor signaling pathway
GO:0006799 - polyphosphate biosynthetic process
GO:0071232 - cellular response to histidine
GO:0007084 - mitotic nuclear envelope reassembly
GO:0101024 - mitotic nuclear membrane organization
GO:0001706 - endoderm formation
GO:0016331 - morphogenesis of embryonic epithelium
GO:0010803 - regulation of tumor necrosis factor-mediated signaling pathway
GO:0032651 - regulation of interleukin-1 beta production
GO:0032652 - regulation of interleukin-1 production
GO:0045987 - positive regulation of smooth muscle contraction
GO:0006940 - regulation of smooth muscle contraction
GO:0032060 - bleb assembly
GO:0046887 - positive regulation of hormone secretion
GO:0014068 - positive regulation of phosphatidylinositol 3-kinase signaling
GO:0046618 - drug export
GO:0046326 - positive regulation of glucose import
GO:0010828 - positive regulation of glucose transmembrane transport
GO:0050995 - negative regulation of lipid catabolic process
GO:0071361 - cellular response to ethanol
GO:0014065 - phosphatidylinositol 3-kinase signaling
GO:0001015 - snoRNA transcription by RNA polymerase II
GO:0009302 - snoRNA transcription
GO:0070911 - global genome nucleotide-excision repair
GO:0090262 - regulation of transcription-coupled nucleotide-excision repair
GO:2000819 - regulation of nucleotide-excision repair
GO:2001165 - positive regulation of phosphorylation of RNA polymerase II C-terminal domain serine 2 residues
GO:2001163 - regulation of phosphorylation of RNA polymerase II C-terminal domain serine 2 residues
GO:2001173 - regulation of histone H2B conserved C-terminal lysine ubiquitination
GO:2001166 - regulation of histone H2B ubiquitination
GO:2001209 - positive regulation of transcription elongation from RNA polymerase I promoter
GO:2001207 - regulation of transcription elongation from RNA polymerase I promoter
GO:1905508 - protein localization to microtubule organizing center
GO:0031442 - positive regulation of mRNA 3'-end processing
GO:0045662 - negative regulation of myoblast differentiation
GO:0045661 - regulation of myoblast differentiation
GO:0060320 - rejection of self pollen
GO:0071988 - protein localization to spindle pole body
GO:0043107 - type IV pilus-dependent motility
GO:0008024 - cyclin/CDK positive transcription elongation factor complex
GO:0044217 - other organism part
GO:0044165 - host cell endoplasmic reticulum
GO:0033655 - host cell cytoplasm part
GO:0044177 - host cell Golgi apparatus
GO:0031594 - neuromuscular junction
GO:0034364 - high-density lipoprotein particle
GO:0070937 - CRD-mediated mRNA stability complex
GO:0043195 - terminal bouton
GO:0098793 - presynapse
GO:0033650 - host cell mitochondrion
GO:0017087 - mitochondrial processing peptidase complex
GO:0097038 - perinuclear endoplasmic reticulum
GO:0000112 - nucleotide-excision repair factor 3 complex
GO:0044164 - host cell cytosol
GO:0097047 - DNA replication termination region
GO:0044174 - host cell endosome
GO:0005967 - mitochondrial pyruvate dehydrogenase complex
GO:0044196 - host cell nucleolus
GO:0031093 - platelet alpha granule lumen
GO:0034774 - secretory granule lumen
GO:0060205 - cytoplasmic vesicle lumen
GO:0031983 - vesicle lumen
GO:0070210 - Rpd3L-Expanded complex
GO:0009353 - mitochondrial oxoglutarate dehydrogenase complex
GO:0002944 - cyclin K-CDK12 complex
GO:0009279 - cell outer membrane
```
